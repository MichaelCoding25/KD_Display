--[[
	Copyright 2021 MichaelCoding25
	

	Licensed under the Apache License; Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing; software
	distributed under the License is distributed on an "AS IS" BASIS;
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND; either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
--]]

config = {
	position = {
		-- 0:100
		offset_left= 16.7; -- The position (in percentile) from the left side of the screen. (Default: 16.7)
		offset_bottom = 1.5; -- The position (in percentile) from the bottom side of the screen of the lowest element. (Default: 1.5)
		space = 2.4; -- The vertical space in between all the elements. (Default: 2.4)
	};

	kills = { -- The Kills Display
		-- 0:255
		colorR = 0; -- The red value of kills out of the RGB. (Default: 255)
		colorG = 0; -- The greem value of kills out of the RGB. (Default: 255)
		colorB = 0; -- The blue value of kills out of the RGB. (Default: 255)
		-- 0.0:1.0
		opacity = 1.0; -- The transparancy of the text. (Default: 1.0)
	};

	deaths = { -- The Kills Display
		-- 0:255
		colorR = 0. -- The red value of kills out of the RGB. (Default: 255)
		colorG = 0. -- The greem value of kills out of the RGB. (Default: 255)
		colorB = 0; -- The blue value of kills out of the RGB. (Default: 255)
		-- 0.0:1.0
		opacity = 1.0; -- The transparancy of the text. (Default: 1.0)
	};

	kd = { -- The KD Display
		-- 0:255
		colorR = 0; -- The red value of kd out of the RGB. (Default: 255)
		colorG = 0; -- The greem value of kills out of the RGB). (Default: 255) 
		colorB = 0; -- The blue value of kills out of the RGB. (Default: 255)
		-- 0.0:1.0
		opacity = 1.0; -- The transparancy of the text. (Default: 1.0)
	}
}
