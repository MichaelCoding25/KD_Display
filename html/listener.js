/*
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
*/

window.onload = (e) => {
	window.addEventListener("message", onMessageReceived);
};

function onMessageReceived(event){
	let item = event.data;

	if (item && item.type === "KD:DISPLAY") {
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

			$("#kills2").text(kills2);
			$("#deaths2").text(deaths2);
			$("#kd2").text(kd2);
		}
	}

	if (item && item.type === "KD:DATA") {
		/* Color Customization */
		let kills = [item.kills.colorR, item.kills.colorG, item.kills.colorB, item.kills.alpha];
		let deaths = [item.deaths.colorR, item.deaths.colorG, item.deaths.colorB, item.deaths.alpha];
		let kd = [item.kd.colorR, item.kd.colorG, item.kd.colorB, item.kd.alpha];

		$("#kills1").css("color", "rgba("+kills.join(", ")+")");
		$("#kills2").css("color", "rgba("+kills.join(", ")+")");

		$("#deaths1").css("color", "rgba("+deaths.join(", ")+")");
		$("#deaths2").css("color", "rgba("+deaths.join(", ")+")");

		$("#kd1").css("color", "rgba("+kd.join(", ")+")");
		$("#kd2").css("color", "rgba("+kd.join(", ")+")");

		/* Positioning */
		$(".kdItems").css("left", item.position.offset_left + "%");
		$(".kdItems").css("bottom", item.position.offset_bottom + "%");

		$(".deathItems").css("left", item.position.offset_left + "%");
		$(".deathItems").css("bottom", item.position.offset_bottom  + item.position.space + "%");

		$(".killItems").css("left", item.position.offset_left + "%");
		$(".killItems").css("bottom", item.position.offset_bottom + (2 * item.position.space) + "%");
	}
}
