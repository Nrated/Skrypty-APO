--[[ Nubski skrypt napisany przez Ero Senina : {
]]
automanas = true
nextManas = 0
hotkey_manas = "F1"
g_keyboard.bindKeyPress(hotkey_manas, function() toggleAutoManas() end)

function manasuj()
	print(automanas)
	if g_game.isOnline() and automanas then
		local delay = ( math.random ( 900, 1000))
		local mana = g_game.getLocalPlayer():getMana()
		local maxmana = g_game.getLocalPlayer():getMaxMana()
		if (mana < ((maxmana / 100) * 95)) then
			local checkItem = g_game.findPlayerItem(2874, -1)
			if checkItem then
				g_game.talk('!mm')
			end
		end
		if automanas then
			nextManas = scheduleEvent(manasuj, delay)
		end
	end
end

function toggleAutoManas()
	if automanas then
		automanas = false
	else
		automanas = true
		manasuj()
	end
end
manasuj()
