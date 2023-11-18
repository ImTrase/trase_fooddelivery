Config = {}

Config.Framework = 'auto' -- 'auto', 'esx', 'qbcore'
Config.Job = false -- false OR jobName (string) e.g. Config.Job = 'police'
Config.Progress = true -- Enable the progress bar from ox_lib?
Config.FindClientTimer = {5, 7} -- How long it takes to find a client (in seconds) (min, max) e.g. 5-7 seconds
Config.Target = false -- enable/disable. (requires: ox_target)
Config.Wait = 60 -- Time in seconds to delete the object or ped once the mission is complete

Config.Command = {
    Enabled = true,
    Command = 'deliverfood'
}


Config.Missions = {
    {
        MissionType = 'dropoff', -- 'dropoff' OR 'handoff'
        DropOff = vec3(282.2982, -1886.8708, 26.8337),
        -- HandOff = vec4(280.9147, -1886.9911, 25.7582, 131.9588),
        Reward = {
            Item = 'money', -- 'money' OR 'black_money' OR 'bank'
            Amount = { 100, 200 } -- (min, max) e.g. 100-200
        }
    }
}

Config.FoodModels = {
    {
        Model = `ng_proc_food_bag01a`,
        Rotation = vector3(0.0, -100.0, 0.0),
        Position = vector3(0.3, 0.0, 0.05) -- X = Down, Y = Forward, Z = Right
    },
    {
        Model = `prop_food_bag1`,
        Rotation = vector3(0.0, -100.0, 0.0),
        Position = vector3(0.3, 0.0, 0.05) -- X = Down, Y = Forward, Z = Right
    },
    {
        Model = `prop_food_bag2`,
        Rotation = vector3(0.0, -100.0, 0.0),
        Position = vector3(0.3, 0.0, 0.05) -- X = Down, Y = Forward, Z = Right
    },
    {
        Model = `ng_proc_food_bag02a`,
        Rotation = vector3(0.0, -100.0, 0.0),
        Position = vector3(0.3, 0.0, 0.05) -- X = Down, Y = Forward, Z = Right
    },
}

Config.Notify = function(data)
    lib.notify(data)
end