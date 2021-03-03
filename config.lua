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

config = {
	position = { -- The position of the text on the screen
		-- 0:100
		offset_left = 16.7; -- The offset (in percentile) from the left side of the screen. // (Default: 16.7)
		offset_bottom = 1.5; -- The offset (in percentile) from the bottom side of the screen of the lowest element. // (Default: 1.5)
		space = 2.4; -- The vertical space in between all the elements. // (Default: 2.4)
	};

	kills = { -- The Kills Text
		colorR = 255; -- Defines the intensity of red as an integer between 0 and 255. // (Default: 255)
		colorG = 255; -- Defines the intensity of green as an integer between 0 and 255. // (Default: 255)
		colorB = 255; -- Defines the intensity of blue as an integer between 0 and 255. // (Default: 255)
		alpha = 1.0; -- Defines the opacity as a number between 0.0 (fully transparent) and 1.0 (fully opaque). // (Default: 1.0)
	};

	deaths = { -- The Deaths Text
		colorR = 255; -- Defines the intensity of red as an integer between 0 and 255. // (Default: 255)
		colorG = 255; -- Defines the intensity of green as an integer between 0 and 255. // (Default: 255)
		colorB = 255; -- Defines the intensity of blue as an integer between 0 and 255. // (Default: 255)
		alpha = 1.0; -- Defines the opacity as a number between 0.0 (fully transparent) and 1.0 (fully opaque). // (Default: 1.0)
	};

	kd = { -- The KD Text
		colorR = 255; -- Defines the intensity of red as an integer between 0 and 255. // (Default: 255)
		colorG = 255; -- Defines the intensity of green as an integer between 0 and 255. // (Default: 255)
		colorB = 255; -- Defines the intensity of blue as an integer between 0 and 255. // (Default: 255)
		alpha = 1.0; -- Defines the opacity as a number between 0.0 (fully transparent) and 1.0 (fully opaque). // (Default: 1.0)
	}
}
