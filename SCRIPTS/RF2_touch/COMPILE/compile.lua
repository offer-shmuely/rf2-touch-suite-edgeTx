-- ui.lua is quite big and compiling it later might throw an 'out of memory' error
collectgarbage()
local baseDir = "/SCRIPTS/RF2_touch/"
assert(loadScript(baseDir.."ui.lua", 'c'))

local i = 1
local scripts = assert(loadScript(baseDir.."COMPILE/scripts.lua"))
collectgarbage()

local function deleteOrTruncateFile(filepath)
    local file = io.open(filepath, "r")
    if file then
        io.close(file)
        if del then
            -- EdgeTX 2.9+: delete file
            del(filepath)
            return
        end
        -- Older EdgeTX/OpenTX: truncate file
        file = io.open(filepath, "w")
        io.close(file)
    end
end

-- The rf2tlm mixer script has been incorporated in rf2bg.lua and is now stored in RF2.
-- Leaving rf2tlm.lua in MIXES will conflict with rf2bg.lua if enabled.
deleteOrTruncateFile("/SCRIPTS/MIXES/rf2tlm.lua")
deleteOrTruncateFile("/SCRIPTS/MIXES/rf2tlm.luac")

local function compile()
    local script = scripts(i)
    i = i + 1
    if script then
        if string.sub(script, 1, 13) == "/SCRIPTS/RF2/" then
            script = "/SCRIPTS/RF2_touch/" .. string.sub(script, 14)
        end

        if script == baseDir.."ui.lua" then return 0 end
        lcd.clear()
        lcd.drawText(2, 2, "Compiling...", SMLSIZE)
        lcd.drawText(2, 22, script, SMLSIZE)
        assert(loadScript(script, 'tcd'))
        collectgarbage()
        return 0
    end
    local file = io.open(baseDir.."COMPILE/scripts_compiled.lua", 'w')
    io.write(file, "return true")
    io.close(file)
    assert(loadScript(baseDir.."COMPILE/scripts_compiled.lua", 'c'))
    return 1
end

return compile
