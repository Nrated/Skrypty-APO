--[[ Nubski skrypt napisany przez Ero Senina : {
]]
local automanas = true
local again = 0
--po wcisnieciu tego hota skrypt zacznie manasowac
local hotkey_start = 'F1'
--a ten wylacza skrypt
local hotkey_end = 'F2'

g_keyboard.bindKeyPress(hotkey_start, function() start() end)
g_keyboard.bindKeyPress(hotkey_end, function() stop() end)


function manasuj()
	if g_game.isOnline() then
		local delay = ( math.random ( 900, 1000))
		local mana = g_game.getLocalPlayer():getMana()
		local maxmana = g_game.getLocalPlayer():getMaxMana()
		if (mana < ((maxmana / 100) * 95))  and automanas then
			local checkItem = g_game.findPlayerItem(2874, -1)
			if checkItem then
				g_game.talk('!mm')
			end
		end
		again = scheduleEvent(manasuj, delay)
	else
		removeEvent(manasuj)
	end
end

function stop()
	automanas = false
end
function start()
	automanas = true
	manasuj()
end