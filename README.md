# fpt-notify

The only difference between the leaked one and this one, is that this one's
- css decrypted

here's a tutorial to add it
vrp example : 
- vrp->client->base.lua

if it dosent work, include this too
local notifyWords = {
		["Succes"] = {'succes', "success"},
		["Eroare"] = {'error', "error"},
		["Info"] = {'info', "info"}
	}

EVENT TRIGGER :
-  TriggerEvent('blc:notify', 'inform', tostring(msg), 5000, 'notify')


this is a random func !, you dont have to add a new function in your base.lua, here's a example of how you gotta paste it in a || random function || in your base.lua


	local function clearColors(str)
    local idf = string.match(str, "~.~")
    while idf do
        str = str:gsub(idf, "")
        idf = string.match(str, "~.~")
    end

    idf = string.match(str, "\\n")
    while idf do
        str = str:gsub(idf, " | ")
        idf = string.match(str, "\\n")
    end
    
    return str




	msg = clearColors(msg)

	for word, data in pairs(notifyWords) do
		if string.find(msg, word) then
			msg = msg:gsub(word.." ", ""):gsub(word..": ", "")
			nType, nTitle = table.unpack(data)
		end
	end
