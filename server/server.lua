local FRAMEWORK = require('modules.framework.server')
local legit = {}
local oldMissions = {}
local inProgress = {} -- Add a new table to track if a player is currently in the process of looking for a mission

local random <const> = math.random

lib.locale()

local function hasJob(target)
    if Config.Job == false then return true end
    local job = FRAMEWORK.getJob(target)
    return job == Config.Job
end

if Config.Command.Enabled then
    RegisterCommand(Config.Command.Command, function(source)
        local src = source
        if not hasJob(src) then
            return TriggerClientEvent('trase_food:client:notify', src, { type = 'error', title = locale('no_job_title'), description = locale('no_job_desc') })
        end

        if not Config.AllowInVehicle then
            local invehicle = lib.callback.await('trase_food:client:inVehicle', src)
            if invehicle then
                return TriggerClientEvent('trase_food:client:notify', src, { type = 'error', title = locale('in_vehicle_title'), description = locale('in_vehicle_desc') })
            end
        end

        -- Check if the player is already in progress bar phasee
        if inProgress[src] then
            return TriggerClientEvent('trase_food:client:notify', src, { type = 'error', title = locale('progress_bar_active_title'), description = locale('progress_bar_active_desc') })
        end

        -- Check if the player already has an active mission
        if legit[src] then
            return TriggerClientEvent('trase_food:client:notify', src, { type = 'error', title = locale('active_mission_title'), description = locale('active_mission_desc') })
        end

        -- Set the inProgress flag to prevent spamming the command
        inProgress[src] = true
        local sellComplete = lib.callback.await('trase_food:client:beginLooking', src)

        -- Reset the inProgress flag once progress bar completes or is canceled
        inProgress[src] = false

        if not sellComplete then return end
        legit[src] = true  -- Mark the player as having an active mission

        -- Assign a random mission ID
        local missionId = random(#Config.Missions)
        if oldMissions[src] ~= nil and oldMissions[src] == missionId then
            missionId = random(#Config.Missions)
        end
        
        oldMissions[src] = missionId
        TriggerClientEvent('trase_food:client:beginMission', src, missionId)
    end, false)
end

-- Register the event for when the delivery is completed
RegisterNetEvent('trase_food:server:food_delivered', function(missionId)
    local src = source
    if not Config.Missions[missionId] or not legit[src] then return end

    local mission = Config.Missions[missionId]

    if mission.Reward then
        local reward = random(mission.Reward.Amount[1], mission.Reward.Amount[2])
        FRAMEWORK.addItem(src, mission.Reward.Item, reward)
        TriggerClientEvent('trase_food:client:notify', src, { type = 'success', title = locale('reward_title'), description = locale('reward_desc'):gsub('{reward}', reward) })
    else
        local reward = random(Config.Reward.Amount[1], Config.Reward.Amount[2])
        FRAMEWORK.addItem(src, Config.Reward.Item, reward)
        TriggerClientEvent('trase_food:client:notify', src, { type = 'success', title = locale('reward_title'), description = locale('reward_desc'):gsub('{reward}', reward) })
    end

    -- Mark the mission as complete
    legit[src] = nil
end)