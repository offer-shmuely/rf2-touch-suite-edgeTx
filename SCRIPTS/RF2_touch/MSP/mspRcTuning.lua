local function getDefaults()
    local defaults = {}
    defaults.rates_type = {}
    defaults.roll_rcRates = {}
    defaults.roll_rcExpo = {}
    defaults.roll_rates = {}

    defaults.pitch_rcRates = {}
    defaults.pitch_rcExpo = {}
    defaults.pitch_rates = {}

    defaults.yaw_rcRates = {}
    defaults.yaw_rcExpo = {}
    defaults.yaw_rates = {}

    defaults.collective_rcRates = {}
    defaults.collective_rcExpo = {}
    defaults.collective_rates = {}

    defaults.roll_response_time = { min = 0, max = 250 }
    defaults.roll_accel_limit = { min = 0, max = 50000, scale = 0.1 }
    defaults.pitch_response_time = { min = 0, max = 250 }
    defaults.pitch_accel_limit = { min = 0, max = 50000, scale = 0.1 }
    defaults.yaw_response_time = { min = 0, max = 250 }
    defaults.yaw_accel_limit = { min = 0, max = 50000, scale = 0.1 }
    defaults.collective_response_time = { min = 0, max = 250 }
    defaults.collective_accel_limit = { min = 0, max = 50000, scale = 0.1 }

    if rf2.apiVersion >= 12.08 then
        defaults.roll_setpoint_boost_gain = { min = 0, max = 250 }
        defaults.roll_setpoint_boost_cutoff = { min = 0, max = 250, unit = rf2.units.herz }
        defaults.pitch_setpoint_boost_gain = { min = 0, max = 250 }
        defaults.pitch_setpoint_boost_cutoff = { min = 0, max = 250, unit = rf2.units.herz }
        defaults.yaw_setpoint_boost_gain = { min = 0, max = 250 }
        defaults.yaw_setpoint_boost_cutoff = { min = 0, max = 250, unit = rf2.units.herz }
        defaults.collective_setpoint_boost_gain = { min = 0, max = 250 }
        defaults.collective_setpoint_boost_cutoff = { min = 0, max = 250, unit = rf2.units.herz }
        defaults.yaw_dynamic_ceiling_gain = { min = 0, max = 250 }
        defaults.yaw_dynamic_deadband_gain = { min = 0, max = 250 }
        defaults.yaw_dynamic_deadband_filter = { min = 0, max = 250, scale = 10, unit = rf2.units.herz }
    end

    defaults.columnHeaders = { "", "", "", "", "", "" }

    return defaults
end

local function getRateDefaults(data, rates_type)
    data.rates_type = { value = rates_type, min = 0, max = 5, table = { [0] = "NONE", "BETAFL", "RACEFL", "KISS", "ACTUAL", "QUICK"} }
    local rateName = data.rates_type.table[rates_type]
    --rf2.print("rateName: " .. rateName)
    local setRateDefaults = assert(rf2.loadScript("MSP/RATES/" .. rateName .. ".lua"))()
    setRateDefaults(data)
    setRateDefaults = nil
    collectgarbage()
    return data
end

local function getRcTuning(callback, callbackParam, data)
    data = data or getDefaults()
    local message = {
        command = 111, -- MSP_RC_TUNING
        processReply = function(self, buf)
            local rates_type = rf2.mspHelper.readU8(buf)
            local data = getRateDefaults(data, rates_type)
            data.rates_type.value = rates_type
            data.roll_rcRates.value = rf2.mspHelper.readU8(buf)
            data.roll_rcExpo.value = rf2.mspHelper.readU8(buf)
            data.roll_rates.value = rf2.mspHelper.readU8(buf)
            data.roll_response_time.value = rf2.mspHelper.readU8(buf)
            data.roll_accel_limit.value = rf2.mspHelper.readU16(buf)
            data.pitch_rcRates.value = rf2.mspHelper.readU8(buf)
            data.pitch_rcExpo.value = rf2.mspHelper.readU8(buf)
            data.pitch_rates.value = rf2.mspHelper.readU8(buf)
            data.pitch_response_time.value = rf2.mspHelper.readU8(buf)
            data.pitch_accel_limit.value = rf2.mspHelper.readU16(buf)
            data.yaw_rcRates.value = rf2.mspHelper.readU8(buf)
            data.yaw_rcExpo.value = rf2.mspHelper.readU8(buf)
            data.yaw_rates.value = rf2.mspHelper.readU8(buf)
            data.yaw_response_time.value = rf2.mspHelper.readU8(buf)
            data.yaw_accel_limit.value = rf2.mspHelper.readU16(buf)
            data.collective_rcRates.value = rf2.mspHelper.readU8(buf)
            data.collective_rcExpo.value = rf2.mspHelper.readU8(buf)
            data.collective_rates.value = rf2.mspHelper.readU8(buf)
            data.collective_response_time.value = rf2.mspHelper.readU8(buf)
            data.collective_accel_limit.value = rf2.mspHelper.readU16(buf)
            if rf2.apiVersion >= 12.08 then
                data.roll_setpoint_boost_gain.value = rf2.mspHelper.readU8(buf)
                data.roll_setpoint_boost_cutoff.value = rf2.mspHelper.readU8(buf)
                data.pitch_setpoint_boost_gain.value = rf2.mspHelper.readU8(buf)
                data.pitch_setpoint_boost_cutoff.value = rf2.mspHelper.readU8(buf)
                data.yaw_setpoint_boost_gain.value = rf2.mspHelper.readU8(buf)
                data.yaw_setpoint_boost_cutoff.value = rf2.mspHelper.readU8(buf)
                data.collective_setpoint_boost_gain.value = rf2.mspHelper.readU8(buf)
                data.collective_setpoint_boost_cutoff.value = rf2.mspHelper.readU8(buf)
                data.yaw_dynamic_ceiling_gain.value = rf2.mspHelper.readU8(buf)
                data.yaw_dynamic_deadband_gain.value = rf2.mspHelper.readU8(buf)
                data.yaw_dynamic_deadband_filter.value = rf2.mspHelper.readU8(buf)
            end
            callback(callbackParam, data)
        end,
        simulatorResponse = {
             4,     -- Rate Type (e.g., NONE, BETAFL, RACEFL, etc.)
            18,     -- roll_rcRates
            25,     -- roll_rcExpo
            32,     -- roll_rates
            20,     -- roll_response_time
            0,0,    -- roll_accel_limit
            18,     -- pitch_rcRates
            25,     -- pitch_rcExpo
            32,     -- pitch_rates
            20,     -- pitch_response_time
            0, 0,   -- pitch_accel_limit
            32,     -- yaw_rcRates
            50,     -- yaw_rcExpo
            45,     -- yaw_rates
            10,     -- yaw_response_time
            0, 0,   -- yaw_accel_limit
            56,     -- collective_rcRates
            0,      -- collective_rcExpo
            56,     -- collective_rates
            20,     -- collective_response_time
            0, 0,   -- collective_accel_limit
            0, 0, 0, 0, 0, 0, 0, 0, 30, 30, 60
        },
    }
    rf2.mspQueue:add(message)
end

local function setRcTuning(data)
    local message = {
        command = 204, -- MSP_SET_RC_TUNING
        payload = {},
        simulatorResponse = {}
    }
    rf2.mspHelper.writeU8(message.payload, data.rates_type.value)
    rf2.mspHelper.writeU8(message.payload, data.roll_rcRates.value)
    rf2.mspHelper.writeU8(message.payload, data.roll_rcExpo.value)
    rf2.mspHelper.writeU8(message.payload, data.roll_rates.value)
    rf2.mspHelper.writeU8(message.payload, data.roll_response_time.value)
    rf2.mspHelper.writeU16(message.payload, data.roll_accel_limit.value)
    rf2.mspHelper.writeU8(message.payload, data.pitch_rcRates.value)
    rf2.mspHelper.writeU8(message.payload, data.pitch_rcExpo.value)
    rf2.mspHelper.writeU8(message.payload, data.pitch_rates.value)
    rf2.mspHelper.writeU8(message.payload, data.pitch_response_time.value)
    rf2.mspHelper.writeU16(message.payload, data.pitch_accel_limit.value)
    rf2.mspHelper.writeU8(message.payload, data.yaw_rcRates.value)
    rf2.mspHelper.writeU8(message.payload, data.yaw_rcExpo.value)
    rf2.mspHelper.writeU8(message.payload, data.yaw_rates.value)
    rf2.mspHelper.writeU8(message.payload, data.yaw_response_time.value)
    rf2.mspHelper.writeU16(message.payload, data.yaw_accel_limit.value)
    rf2.mspHelper.writeU8(message.payload, data.collective_rcRates.value)
    rf2.mspHelper.writeU8(message.payload, data.collective_rcExpo.value)
    rf2.mspHelper.writeU8(message.payload, data.collective_rates.value)
    rf2.mspHelper.writeU8(message.payload, data.collective_response_time.value)
    rf2.mspHelper.writeU16(message.payload, data.collective_accel_limit.value)
    if rf2.apiVersion >= 12.08 then
        rf2.mspHelper.writeU8(message.payload, data.roll_setpoint_boost_gain.value)
        rf2.mspHelper.writeU8(message.payload, data.roll_setpoint_boost_cutoff.value)
        rf2.mspHelper.writeU8(message.payload, data.pitch_setpoint_boost_gain.value)
        rf2.mspHelper.writeU8(message.payload, data.pitch_setpoint_boost_cutoff.value)
        rf2.mspHelper.writeU8(message.payload, data.yaw_setpoint_boost_gain.value)
        rf2.mspHelper.writeU8(message.payload, data.yaw_setpoint_boost_cutoff.value)
        rf2.mspHelper.writeU8(message.payload, data.collective_setpoint_boost_gain.value)
        rf2.mspHelper.writeU8(message.payload, data.collective_setpoint_boost_cutoff.value)
        rf2.mspHelper.writeU8(message.payload, data.yaw_dynamic_ceiling_gain.value)
        rf2.mspHelper.writeU8(message.payload, data.yaw_dynamic_deadband_gain.value)
        rf2.mspHelper.writeU8(message.payload, data.yaw_dynamic_deadband_filter.value)
    end
    rf2.mspQueue:add(message)
end

return {
    read = getRcTuning,
    write = setRcTuning,
    getDefaults = getDefaults,
    getRateDefaults = getRateDefaults,
}
