local function combineLists(colorscheme, defaults)
    local combinedList = {}
    for key, value in pairs(colorscheme) do
        if value ~= "" or value ~= nil then
            combinedList[key] = value
        else
            combinedList[key] = defaults[key]
        end
    end
    return combinedList
end

local colorscheme = require("tokyonight.colors").setup()

local color_defaults = {
    bg_float = "#202328",
    fg_float = "#bbc2cf",
    red = "#ec5f67",
    blue = "#51afef",
    darkblue = "#081633",
    cyan = "#008080",
    yellow = "#ECBE7B",
    orange = "#FF8800",
    green = "#98be65",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    magenta2 = "",
    purple = "",
    black = "",
    error = "",
    warning = "",
    hint = "",
    info = "",
    git_add = "#266d6a",
    git_change = "#536c9e",
    git_delete = "#b2555b",
}

return combineLists(colorscheme, color_defaults)
