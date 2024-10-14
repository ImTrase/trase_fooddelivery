Config = {}

Config.Framework = 'auto' -- 'auto', 'esx', 'qbcore'
Config.Job = false -- false OR jobName (string) e.g. Config.Job = 'police'
Config.Progress = true -- Enable the progress bar from ox_lib?
Config.FindClientTimer = {5, 7} -- How long it takes to find a client (in seconds) (min, max) e.g. 5-7 seconds
Config.Target = true -- enable/disable. (requires: ox_target)
Config.Wait = 60 -- Time in seconds to delete the object or ped once the mission is complete
Config.AllowInVehicle = false -- If true, may experience bugs may occur.

Config.Blip = {
    Enabled = true,
    Sprite = 1,
    Color = 5,
    Scale = 0.8,
}

-- This is that people do not need to configure each and every mission payout.
-- If you wish to have a specific job pay more or less you can set that in the mission table.
Config.Reward = {
    Item = 'money', -- 'money' OR 'black_money' OR 'bank'
    Amount = { 1000, 2500 } -- (min, max) e.g. $1000-$2500
}

Config.Command = {
    Enabled = true,
    Command = 'deliverfood'
}

Config.Missions = {
    {
        MissionType = 'dropoff', -- 'dropoff' OR 'handoff'
        DropOff = vec3(-824.7894, 422.4605, 92.1244), -- Where the player needs to drop off the food and the bag is placed.
        -- HandOff = vec4(-824.7828, 422.3705, 91.1242, 358.7914), -- x, y, z, heading: Where the ped is located to hand off the food.
        -- If below is specified it will override the Config.Reward
        -- Reward = {
        --     Item = 'money', -- 'money' OR 'black_money' OR 'bank'
        --     Amount = { 100, 200 } -- (min, max) e.g. $100-$200
        -- }
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(-762.4222, 431.6999, 99.0545, 19.3861),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(-595.5572, 393.2983, 100.8824, 3.3858),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-297.8313, 380.0955, 112.0952),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-519.8602, 594.5056, 120.8365),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-386.5587, 504.5525, 120.4125),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1861.3837, 310.3929, 89.1144),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1906.1367, 252.6594, 86.2526),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(1231.4558, -1592.1500, 52.3684, 211.4206),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(1245.2704, -1626.5038, 52.2822, 35.4281),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(1210.9844, -1607.3175, 49.3596, 223.8309),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1214.4501, -1644.2463, 48.6460),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1193.4069, -1622.3464, 45.2209),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1193.4642, -1656.3115, 43.0264),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1354.835, -1690.645, 60.49118),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1250.786, -1734.361, 52.03197),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1315.768, -1526.581, 51.80761),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1327.449, -1553.044, 54.05154),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1338.202, -1524.25, 54.58157),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-34.03564, -1847.268, 26.19352),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-20.66694, -1858.717, 25.40867),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(20.9673, -1844.3757, 23.6016, 46.0655),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(-4.9444, -1872.0133, 23.1509, 26.8938),
    },
    {
        MissionType = 'handoff',
        HandOff = vec4(5.0092, -1884.2086, 22.6967, 39.1062),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(45.9828, -1864.26, 23.2783),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(23.28914, -1896.662, 22.96588),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(39.17495, -1911.738, 21.9535),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(39.17495, -1911.738, 21.9535),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(56.71088, -1922.634, 21.91107),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(72.29422, -1938.999, 21.36912),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(76.24441, -1948.262, 21.17413),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(85.8941, -1959.494, 21.12167),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(114.3562, -1961.01, 21.33418),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(126.8143, -1929.823, 21.38242),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(118.2327, -1920.99, 21.32343),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(100.9826, -1912.236, 21.40742),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(100.9826, -1912.236, 21.40742),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(103.946, -1885.355, 24.31878),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(115.3631, -1887.887, 23.92823),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(127.8691, -1896.914, 23.67419),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(148.8684, -1904.412, 23.53166),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(130.4333, -1853.374, 25.23479),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(150.003, -1864.736, 24.59133),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(171.4927, -1871.427, 24.40022),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(192.2494, -1883.215, 25.05676),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(252.846, -1670.884, 29.66316),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(240.7114, -1687.884, 29.69961),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(222.8008, -1702.845, 29.69481),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(216.6737, -1717.679, 29.67778),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(197.8287, -1725.775, 29.66364),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(250.2528, -1730.623, 29.6688),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(257.5017, -1722.701, 29.65413),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(269.6539, -1712.734, 29.6688),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(282.0764, -1694.844, 29.64791),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(332.9873, -1740.934, 29.73052),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(320.599, -1759.836, 29.6379),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(304.5208, -1775.6, 29.10108),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(300.152, -1783.769, 28.43866),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(288.7335, -1792.574, 28.08906),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(320.3028, -1853.915, 27.51094),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(329.1721, -1845.703, 27.7481),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(348.8236, -1820.95, 28.89409),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(405.7393, -1751.321, 29.71033),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(419.092, -1735.523, 29.6077),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(431.126, -1725.489, 29.60147),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(443.3968, -1707.419, 29.70932),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(500.5444, -1697.305, 29.78924),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(489.7504, -1714.102, 29.70689),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(479.5138, -1735.695, 29.15103),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(474.531, -1757.656, 29.09263),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(472.0449, -1775.372, 29.07084),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(514.1661, -1780.767, 28.91397),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(512.4554, -1790.605, 28.91946),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(495.3504, -1823.231, 28.8697),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1386.104, -593.3531, 74.48546),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1388.688, -569.6776, 74.49651),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1373.234, -555.6323, 74.68565),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1348.252, -546.8251, 73.89164),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1328.674, -535.9703, 72.44082),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1303.114, -527.4805, 71.46065),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1251.029, -515.5263, 69.34904),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1251.53, -494.2337, 69.90687),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1259.67, -480.1006, 70.18878),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1265.8, -458.1188, 70.51708),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1262.441, -429.9128, 70.01475),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1114.436, -391.2849, 68.94825),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1060.611, -378.399, 68.23127),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1029.436, -409.1948, 65.94928),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1010.569, -423.3688, 65.34943),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(987.8107, -433.3945, 63.89069),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(967.1205, -451.7732, 62.78955),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(944.4696, -463.0904, 61.55418),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(921.8822, -477.7551, 61.08372),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(906.3219, -489.3719, 59.43621),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(878.3427, -498.0171, 58.09061),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(862.0201, -509.4406, 57.32961),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(850.4318, -532.5987, 57.92551),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(844.1064, -563.168, 57.83387),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(861.713, -583.2857, 58.15648),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(886.8668, -608.2974, 58.44508),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(902.9115, -615.5179, 58.45334),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(928.8381, -639.5946, 58.2425),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(943.8919, -653.9167, 58.42867),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(960.1845, -669.8276, 58.44982),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(970.7766, -701.1523, 58.48196),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(979.2302, -716.3808, 58.22067),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(996.9426, -729.527, 57.81573),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1229.006, -725.3837, 60.79796),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1222.652, -696.9312, 60.80688),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1221.396, -668.7957, 63.49314),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1207.183, -620.2817, 66.43862),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1203.589, -598.5269, 68.06355),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1200.961, -575.665, 69.13909),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1204.891, -557.722, 69.61517),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1241.671, -566.2078, 69.65739),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1240.613, -601.7012, 69.78268),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1265.533, -648.1609, 67.92142),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1240.613, -601.7012, 69.78268),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1271.06, -683.506, 66.03161),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1264.744, -702.8209, 64.90904),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1301.088, -574.0226, 71.73223),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1323.485, -582.9797, 73.24635),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1341.479, -597.4318, 74.70081),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1367.365, -606.3459, 74.71101),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1100.853, -411.2455, 67.55514),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1099.53, -438.7297, 67.79056),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1098.485, -464.6605, 67.31939),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1090.279, -484.3046, 65.66039),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1056.287, -448.7772, 66.25748),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1052.152, -470.6779, 63.89892),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1046.441, -497.8062, 64.07965),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1006.088, -511.34, 60.83395),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(988.0709, -526.0134, 60.69061),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(965.1794, -541.8593, 59.72737),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(919.8704, -569.9577, 58.36636),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(893.1956, -540.6093, 58.50666),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(924.3667, -526.0552, 59.78902),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(946.1273, -518.8377, 60.62553),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(970.2766, -502.2844, 62.14089),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1014.664, -469.1594, 64.50298),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1009.987, -572.5716, 60.59448),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(999.5455, -594.0562, 59.6386),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(980.1899, -627.5284, 59.23586),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1111.398, -902.0909, 3.986671),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1116.136, -895.5901, 7.796866),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1111.557, -902.1375, 7.796211),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1116.144, -895.5685, 11.79673),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-1111.565, -902.1244, 11.79673),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-15.19049, 6557.319, 33.24038),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-44.37858, 6582.261, 32.17552),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-26.50492, 6597.266, 31.86078),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(1.650597, 6612.67, 32.07962),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-41.70634, 6637.384, 31.08754),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-9.627841, 6654.21, 31.69872),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(35.26117, 6662.892, 32.19039),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-302.3925, 6327.02, 32.88723),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-280.4888, 6350.76, 32.60078),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-247.6116, 6370.122, 31.84554),
    },
    {
        MissionType = 'dropoff',
        DropOff = vec3(-227.2807, 6377.672, 31.75924),
    },
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

-- The list of models that the customer can be.
Config.CustomerPedModels = {
    `a_f_m_bevhills_02`,
    `a_f_m_bevhills_01`,
    `a_f_m_bevhills_03`,
    `a_m_m_bevhills_01`,
    `a_m_m_bevhills_02`,
    `a_f_y_bevhills_01`,
    `a_f_y_bevhills_02`,
    `a_f_y_bevhills_03`,
    `a_f_y_bevhills_04`,
    `a_m_y_bevhills_01`,
    `a_m_y_bevhills_02`,
}

Config.Notify = function(data)
    lib.notify(data)
end