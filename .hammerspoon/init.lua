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

hs.alert.show("hammerspoon config loaded")