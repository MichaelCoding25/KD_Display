--[[
	Copyright 2021 MichaelCoding25
	

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
--]]

-- VARIABLES

local KILLS = 0
local DEATHS = 0

local kdShow = true


-- COMMANDS

RegisterCommand('kd', function()
	local kd = 0
	if DEATHS ~= 0 then
		kd = KILLS / DEATHS
	else
		kd = KILLS
	end
	kd = round(kd, 2)

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
		args = {"[KD]", kd}
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

	while true do
		Citizen.Wait(500)
		
		-- TEMPORARY
		SendNUIMessage({
			type = 'KD:DISPLAY',
			active = false
		});
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
		elseif not IsEntityDead(PlayerPedId()) and wasDead == true then
			wasDead = false
		end
	end
end)


-- EVENTS

RegisterNetEvent(GetCurrentResourceName()..'CLKillerLog')
AddEventHandler(GetCurrentResourceName()..'CLKillerLog', function()
	KILLS = KILLS + 1
end)


-- FUNCTIONS

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
