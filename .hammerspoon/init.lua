local function focusDotfiles()
    local cursor = hs.application.find("Cursor")
    if cursor then
        for _, win in pairs(cursor:allWindows()) do
            if string.find(win:title(), "dotfiles") then
                win:focus()
                return
            end
        end
    end

    hs.execute("/usr/local/bin/cursor /Users/bikmaev/dotfiles")
end

hs.hotkey.bind({"rcmd"}, ";", focusDotfiles)

local function logKeyPress(event)
    pcall(function()
        local app = hs.application.frontmostApplication()
        if app and app:name() == "Cursor" then
            local flags = event:getFlags()
            local keycode = event:getKeyCode()
            local char = hs.keycodes.map[keycode] or tostring(keycode)


            local hasModifiers = flags.ctrl or flags.alt or flags.shift or flags.cmd
            local isLetter = string.match(char, "^[a-z]$")

            if not hasModifiers and isLetter then
                return
            end

            local parts = {}
            if flags.ctrl then table.insert(parts, "ctrl") end
            if flags.alt then table.insert(parts, "alt") end
            if flags.shift then table.insert(parts, "shift") end
            if flags.cmd then table.insert(parts, "cmd") end
            table.insert(parts, char)

            local file = io.open(os.getenv("HOME") .. "/dotfiles/cursor.log", "a")
            if file then
                file:write(table.concat(parts, "+") .. "\n")
                file:close()
            end
        end
    end)
    return false
end

local keyTap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, logKeyPress)
keyTap:start()

hs.hotkey.bind({}, "f10", function()
    if keyTap:isEnabled() then
        keyTap:stop()
        hs.alert.show("log disabled")
    else
        keyTap:start()
        hs.alert.show("log enabled")
    end
end)

hs.hotkey.bind({}, "f12", function()
    hs.reload()
    hs.alert.show("reloaded")
end)

hs.alert.show("reloaded")