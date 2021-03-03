--[[
	KD_Display
	Created by MichaelCoding25

	MIT License

	Copyright (c) 2021 MichaelCoding25

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
--]]

-- VARIABLES

local KILLS = 0
local DEATHS = 0
local KD = 0

local kdShow = true


-- COMMANDS

RegisterCommand('kd', function()
	TriggerEvent('chat:addMessage', {
		color = { 255, 0, 0},
		multiline = true,
		args = {"[Kills]", KILLS}
	})

	TriggerEvent('chat:addMessage', {
		color = { 255, 0, 0},
		multiline = true,
		args = {"[Deaths]", DEATHS}
	})
	
	TriggerEvent('chat:addMessage', {
		color = { 255, 0, 0},
		multiline = true,
		args = {"[KD]", KD}
	})
end)

RegisterCommand('kdtoggle', function()
	kdShow = (not kdShow)
end)


-- THREADS

-- Main Thread
Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/kd', 'Displays your K/D in the chat')

	TriggerEvent('chat:addSuggestion', '/kdtoggle', 'Toggles your K/D display on / off')

	-- Wait a single second before sending data NUI message
	Citizen.Wait(1000);

	SendNUIMessage({
		type = 'KD:DATA',
		position = config.position,
		kills = config.kills,
		deaths = config.deaths,
		kd = config.kd
	});

	while true do
		Citizen.Wait(1000)

		if kdShow == true then
			SendNUIMessage({
				type = 'KD:DISPLAY',
				active = true,
				kills = KILLS,
				deaths = DEATHS,
				kd = KD
			});
		else
			SendNUIMessage({
				type = 'KD:DISPLAY',
				active = false
			});
		end

	end
end)

-- Death Thread
Citizen.CreateThread(function()
	local wasDead = false

	while true do
		Citizen.Wait(0)

		if IsEntityDead(PlayerPedId()) and wasDead == false then
			Citizen.Wait(500)
			wasDead = true

			local killerPed = GetPedSourceOfDeath(PlayerPedId())
			local killerPlayer = nil

			if IsEntityAPed(killerPed) and IsPedAPlayer(killerPed) then
				killerPlayer = NetworkGetPlayerIndexFromPed(killerPed)
			elseif IsEntityAVehicle(killerPed) and IsEntityAPed(GetPedInVehicleSeat(killerPed, -1)) and IsPedAPlayer(GetPedInVehicleSeat(killerPed, -1)) then
				killerPlayer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(killerPed, -1))
			end

			if killerPlayer ~= PlayerId() and killerPlayer ~= nil then
				TriggerServerEvent(GetCurrentResourceName()..'SVKillerLog', GetPlayerServerId(killerPlayer))
			end

			DEATHS = DEATHS + 1

			if DEATHS == 0 then
				KD = KILLS
			elseif KILLS == 0 then
				KD = DEATHS * -1
			else
				KD = KILLS / DEATHS
			end
			KD = round(KD, 2)

		elseif not IsEntityDead(PlayerPedId()) and wasDead == true then
			wasDead = false
		end
	end
end)

-- Garbage Collection Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30000)
		collectgarbage()
	end
end)


-- EVENTS

RegisterNetEvent(GetCurrentResourceName()..'CLKillerLog')
AddEventHandler(GetCurrentResourceName()..'CLKillerLog', function()
	KILLS = KILLS + 1

	if DEATHS == 0 then
		KD = KILLS
	elseif KILLS == 0 then
		KD = DEATHS
	else
		KD = KILLS / DEATHS
	end
	KD = round(KD, 2)
end)


-- FUNCTIONS

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
