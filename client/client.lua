local random <const> = math.random

local cachedZone = nil
local currentMission = nil
local customer = nil
local blip = nil

lib.locale()

RegisterNetEvent('trase_food:client:notify', Config.Notify)


lib.callback.register('trase_food:client:beginLooking', function()
    if Config.Progress then
        return lib.progressBar({
            duration = random(Config.FindClientTimer[1], Config.FindClientTimer[2]) * 1000,
            label = locale('looking_client_progressBar'),
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, combat = true },
            anim = { scenario = 'WORLD_HUMAN_STAND_MOBILE' }
        })
    else
        local ped = cache.ped

        -- Play the scenario
        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_MOBILE', 0, true)

        -- Wait for the timer to finish
        local waitTime = random(Config.FindClientTimer[1], Config.FindClientTimer[2]) * 1000
        Wait(waitTime)

        -- Stop the scenario
        ClearPedTasksImmediately(ped)

        return true
    end
end)

RegisterNetEvent('trase_food:client:beginMission', function(missionId)
    local mission = Config.Missions[missionId]
    if not mission then return end

    if mission.MissionType == 'dropoff' then
        if Config.Target then
            local fixedCoords = vector3(mission.DropOff.x, mission.DropOff.y, mission.DropOff.z - 1.0)
            cachedZone = exports.ox_target:addBoxZone({
                coords = fixedCoords,
                radius = { x = 1.5, y = 1.5, z = 1.0 },
                debug = true,
                options = {
                    {
                        event = 'trase_food:client:dropoff',
                        args = missionId,
                        icon = 'fas fa-utensils',
                        label = locale('dropoff_label'),
                        group = Config.Job ~= false and Config.Job or nil,
                        distance = 2.0,
                        canInteract = function()
                            return not IsEntityDead(cache.ped) and not LocalPlayer.state.dead
                        end
                    },
                }
            })
        else
            currentMission = missionId
        end

        -- Create the blip
        if Config.Blip.Enabled then
            blip = AddBlipForCoord(mission.DropOff.x, mission.DropOff.y, mission.DropOff.z)
            SetBlipSprite(blip, Config.Blip.Sprite)
            SetBlipColour(blip, Config.Blip.Color)
            SetBlipScale(blip, Config.Blip.Scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(locale('devliver_blip_name'))
            EndTextCommandSetBlipName(blip)
        end

        Config.Notify({ type = 'success', title = locale('dropoff_notify_title'), description = locale('dropoff_notify_desc') })
    elseif mission.MissionType == 'handoff' then
        currentMission = missionId

        if Config.Blip.Enabled then
            blip = AddBlipForCoord(mission.HandOff.x, mission.HandOff.y, mission.HandOff.z)
            SetBlipSprite(blip, Config.Blip.Sprite)
            SetBlipColour(blip, Config.Blip.Color)
            SetBlipScale(blip, Config.Blip.Scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(locale('devliver_blip_name'))
            EndTextCommandSetBlipName(blip)
        end

        Config.Notify({ type = 'success', title = locale('dropoff_notify_title'), description = locale('dropoff_notify_desc') })
    end
end)

local createdObjects = {}

local FOOD_MODELS <const> = Config.FoodModels
local CUSTOMER_MODELS <const> = Config.CustomerPedModels
local HANDOFF_ANIM <const> = { dict = 'mp_common', anim = 'givetake1_a' }
local ANIM_INFO <const> = { dict = 'random@domestic', anim = 'pickup_low' }

AddEventHandler('trase_food:client:dropoff', function(data)
    local missionId = data.args
    local mission = Config.Missions[missionId]
    if not mission then return end

    currentMission = nil
    RemoveBlip(blip)

    -- Delete the zone
    if cachedZone then
        exports.ox_target:removeZone(cachedZone)
        cachedZone = nil
    end

    -- Play put down animation
    local duration = 1000

    -- Create the objects
    local bag = FOOD_MODELS[math.random(#FOOD_MODELS)]
    local model = bag.Model
    lib.requestModel(model)

    local boneIndex = GetPedBoneIndex(cache.ped, 57005) -- Right hand bone index
    local obj = CreateObject(model, 0, 0, 0, true, true, true)
    createdObjects[#createdObjects +1] = obj
    AttachEntityToEntity(obj, cache.ped, boneIndex, bag.Position.x, bag.Position.y, bag.Position.z, bag.Rotation.x, bag.Rotation.y, bag.Rotation.z, true, true, false, true, 1, true)

    Wait(500)

    lib.requestAnimDict(ANIM_INFO.dict)
    TaskPlayAnim(cache.ped, ANIM_INFO.dict, ANIM_INFO.anim, 8.0, -8.0, duration, 0, 1, false, false, false)

    -- Wait for animation to finish
    Wait(duration)

    DetachEntity(obj, true, true)
    local coords = mission.DropOff
    SetEntityCoords(obj, coords.x, coords.y, coords.z + 0.5) -- Adjust Z as needed
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)

    Wait(500)

    -- Clear the animation
    ClearPedTasks(cache.ped)

    SetTimeout(Config.Wait * 1000, function()
        DeleteObject(obj)
    end)

    -- Trigger the event to give the player money
    TriggerServerEvent('trase_food:server:food_delivered', missionId)
end)

RegisterNetEvent('trase_food:client:handoff', function(data)
    local missionId = data.args
    local mission = Config.Missions[missionId]
    if not mission then return end

    currentMission = nil
    RemoveBlip(blip)

    -- Delete the zone
    if cachedZone then
        exports.ox_target:removeZone(cachedZone)
        cachedZone = nil
    end

    -- Play the animation for cache.ped and customer
    local duration = 2500

    lib.requestAnimDict(HANDOFF_ANIM.dict)

    TaskPlayAnim(cache.ped, HANDOFF_ANIM.dict, HANDOFF_ANIM.anim, 8.0, -8.0, duration, 0, 1, false, false, false)
    TaskPlayAnim(customer, HANDOFF_ANIM.dict, HANDOFF_ANIM.anim, 8.0, -8.0, duration, 0, 1, false, false, false)

    -- Make ped talk
    SetPedTalk(customer)
    Wait(500)
    PlayAmbientSpeech1(customer, 'GENERIC_THANKS', 'SPEECH_PARAMS_STANDARD')

    -- Food bag in my hand
    local bag = FOOD_MODELS[math.random(#FOOD_MODELS)]
    local model = bag.Model
    lib.requestModel(model)

    local boneIndex = GetPedBoneIndex(cache.ped, 57005) -- Right hand bone index
    local obj = CreateObject(model, 0, 0, 0, true, true, true)
    createdObjects[#createdObjects +1] = obj
    AttachEntityToEntity(obj, cache.ped, boneIndex, bag.Position.x, bag.Position.y, bag.Position.z, bag.Rotation.x, bag.Rotation.y, bag.Rotation.z, true, true, false, true, 1, true)

    -- Money in customers hand
    local money = `bkr_prop_money_sorted_01`
    lib.requestModel(money)

    local customerBoneIndex = GetPedBoneIndex(customer, 57005) -- Right hand bone index
    local moneyObj = CreateObject(money, 0, 0, 0, true, true, true)
    createdObjects[#createdObjects +1] = moneyObj
    AttachEntityToEntity(moneyObj, customer, customerBoneIndex, vec3(0.13, 0.02, 0.0), vec3(-90.0, 0, 0), true, true, false, true, 1, true)

    -- Wait for animation to finish
    Wait(1000)

    -- Swap the objects
    DetachEntity(obj, true, true)
    DetachEntity(moneyObj, true, true)

    AttachEntityToEntity(obj, customer, customerBoneIndex, bag.Position.x, bag.Position.y, bag.Position.z, bag.Rotation.x, bag.Rotation.y, bag.Rotation.z, true, true, false, true, 1, true)
    AttachEntityToEntity(moneyObj, cache.ped, boneIndex, vec3(0.13, 0.02, 0.0), vec3(-90.0, 0, 0), true, true, false, true, 1, true)

    Wait(1000)

    -- Clear the animation
    ClearPedTasks(cache.ped)
    ClearPedTasks(customer)

    Wait(500)

    -- Delete the objects

    SetTimeout(Config.Wait * 1000, function()
        DeleteEntity(customer)
        customer = nil
        DeleteObject(obj)
    end)

    -- DeleteObject(obj)
    DeleteObject(moneyObj)

    -- Reward Player
    TriggerServerEvent('trase_food:server:food_delivered', missionId)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for _, obj in ipairs(createdObjects) do
            DeleteObject(obj)
        end

        if customer and DoesEntityExist(customer) then
            DeleteEntity(customer)
        end
    end
end)

local function DisplayHelp(help, sound)
    AddTextEntry(GetCurrentResourceName(), help)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

CreateThread(function()
    while true do
        local wait = 1500

        if currentMission and Config.Missions[currentMission] then
            local mission = Config.Missions[currentMission]
            local ped = cache.ped
            local myCoords = GetEntityCoords(ped)
            local place = mission.MissionType == 'dropoff' and mission.DropOff or mission.HandOff
            local dist = #(myCoords.xyz - place.xyz)

            if dist <= 150.0 then
                if mission.MissionType == 'handoff' then
                    -- Create Ped
                    if not customer or not DoesEntityExist(customer) then
                        local model = CUSTOMER_MODELS[math.random(#CUSTOMER_MODELS)]
                        lib.requestModel(model)

                        customer = CreatePed(4, model, place.x, place.y, place.z, 0.0, false, true)
                        SetEntityHeading(customer, place.w)
                        -- Ignore everything
                        FreezeEntityPosition(customer, true)
                        SetEntityInvincible(customer, true)
                        SetBlockingOfNonTemporaryEvents(customer, true)

                        if Config.Target then
                            cachedZone = exports.ox_target:addLocalEntity(customer, {
                                {
                                    event = 'trase_food:client:handoff',
                                    args = currentMission,
                                    icon = 'fas fa-utensils',
                                    label = locale('handoff_label'),
                                    group = Config.Job ~= false and Config.Job or nil,
                                    distance = 2.0,
                                    canInteract = function()
                                        return not IsEntityDead(cache.ped) and not LocalPlayer.state.dead
                                    end
                                }
                            })
                        end
                    end

                    if not Config.Target then
                        wait = 0
                        local crds = GetEntityCoords(customer)
                        local newdist = #(myCoords.xyz - crds.xyz)

                        if newdist <= 1.5 then
                            DisplayHelp(locale('handoff_help'), true)
                            if IsControlJustPressed(0, 38) then
                                TriggerEvent('trase_food:client:handoff', { args = currentMission })
                            end
                        end
                    end
                elseif mission.MissionType == 'dropoff' then
                    if dist <= 15.0 then
                        DrawMarker(2, place.xyz, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.4, 0.4, 0.4, 200, 20, 20, 50, false, true, 2, false, nil, nil, false)
                        wait = 0

                        if dist <= 1.5 then
                            DisplayHelp(locale('dropoff_help'), true)
                            if IsControlJustPressed(0, 38) then
                                TriggerEvent('trase_food:client:dropoff', { args = currentMission })
                            end
                        end
                    end
                end
            end
        end

        Wait(wait)
    end
end)