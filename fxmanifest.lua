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

fx_version 'cerulean'
games { 'gta5' }

author 'MichaelCoding25'
description 'Displays player kill death ratio on screen'
version 'v0.0.1'
url 'https://github.com/MichaelCoding25/KD_Display'

client_scripts {
	'kd_cli.lua'
}

server_scripts {
	'kd_srv.lua'
}


ui_page('html/index.html')

files({
	'html/index.html',
	'html/listener.js',
	'html/style.css'
})
