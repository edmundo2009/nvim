local lang = string.sub(vim.v.lang, 1, 2)
local file = io.open(vim.fn.stdpath('config').."/lua/andrem222/lang/"..lang..".json", "rb")
local jsonFile

if file then

    jsonFile = vim.json.decode(file:read("*a"))

file:close()

end

function Msgstr(description)
    if not jsonFile[description] or jsonFile[description]["msgstr"] == '' then return description end

    return jsonFile[description]["msgstr"]
end
