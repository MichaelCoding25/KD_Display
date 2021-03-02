/*
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
*/

window.onload = (e) => {
	window.addEventListener('message', onMessageRecieved);
};

function onMessageRecieved(event){
	let item = event.data;

	if (item && item.type === 'KD:DISPLAY') {
		if (!item.active) {
			$("#killscontainer").hide();
			$("#deathscontainer").hide();
			$("#kdcontainer").hide();
		} else {
			$("#killscontainer").show();
			$("#deathscontainer").show();
			$("#kdcontainer").show();

			let kills2	= item.kills;
			let deaths2 = item.deaths;
			let kd2 = item.kd;

			$('#kills2').text(kills2);
			$('#deaths2').text(deaths2);
			$('#kd2').text(kd2);
		}
	}

	if (item && item.type === 'KD:DATA') {
		/* Color Customization */
		let kills = [item.kills.colorR, item.kills.colorG, item.kills.colorB, item.kills.opacity]
		let deaths = [item.deaths.colorR, item.deaths.colorG, item.deaths.colorB, item.deaths.opacity]
		let kd = [item.kd.colorR, item.kd.colorG, item.kd.colorB, item.kd.opacity]

		$('#kills1').css('color', 'rgba('+kills.join(', ')+')');
		$('#kills2').css('color', 'rgba('+kills.join(', ')+')');

		$('#deaths1').css('color', 'rgba('+deaths.join(', ')+')');
		$('#deaths2').css('color', 'rgba('+deaths.join(', ')+')');

		$('#kd1').css('color', 'rgba('+kd.join(', ')+')');
		$('#kd2').css('color', 'rgba('+kd.join(', ')+')');

		/* TODO: Positioning */
		
	}
}
