-- Current Language
local lang = string.sub(vim.v.lang, 1, 2)
-- Translations
local file = io.open(vim.fn.stdpath('config').."/lua/andrem222/lang/"..lang..".json", "rb")
-- Decoded translations
local jsonFile

-- Check if translation available to decode
if file then
    jsonFile = vim.json.decode(file:read("*a"))

    file:close()
end

--- This function returns the translation if available of text in the parameter
--- @param description string Description to translate
--- @return any
function Msgstr(description)
    if not jsonFile then return description end
    if not jsonFile[description] or jsonFile[description]["msgstr"] == '' then return description end

    return jsonFile[description]["msgstr"]
end
