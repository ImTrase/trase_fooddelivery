local FRAMEWORK = require('modules.framework.server')
local legit = {}

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

        local sellComplete = lib.callback.await('trase_food:client:beginLooking', src)
        if not sellComplete then return end
        legit[src] = true

        local missionId = random(#Config.Missions)
        TriggerClientEvent('trase_food:client:beginMission', src, missionId)
    end, false)
end

RegisterNetEvent('trase_food:server:food_delivered', function(missionId)
    local src = source
    if not Config.Missions[missionId] or not legit[src] then return end -- Modder

    local mission = Config.Missions[missionId]
    local reward = random(mission.Reward.Amount[1], mission.Reward.Amount[2])

    FRAMEWORK.addItem(src, mission.Reward.Item, reward)
    TriggerClientEvent('trase_food:client:notify', src, { type = 'success', title = locale('reward_title'), description = locale('reward_desc'):gsub('{reward}', reward) })
end)