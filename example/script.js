// Generated by Haxe 3.4.7
(function () { "use strict";
var Main = function() { };
Main.main = function() {
	window.addEventListener("DOMContentLoaded",Main.init);
};
Main.init = function() {
	var target = window.document.getElementById("video");
	var jstream = new jStream_JStream("eqz989uscl","NDk2","50");
	var onAPIReady = function() {
		var player = jstream_t3.PlayerFactoryOBJ.create({ b : jstream.BASE_URL, c : jstream.CONTACT_ID, m : target.dataset.videoId, s : { wp : 640, hp : 480, sn : jStream__$PlayerFactoryOBJ_SNS_$Impl_$.list(["g","t"])}},target.id);
		player.accessor.addEventListener("landing",function(info) {
			console.log(player.flashVars.thumbnail_url);
			console.log(info);
		});
		player.accessor.addEventListener("change_state",function(info1) {
			console.log(info1);
		});
		player.accessor.addEventListener("error",function(info2) {
			console.log(info2);
		});
	};
	jstream.loadAPI(onAPIReady);
};
var jStream_JStream = function(uniqueId,contactId,fileNo) {
	this.isInitAPI = false;
	this.UNIQUE_ID = uniqueId;
	this.CONTACT_ID = contactId;
	this.FILE_NO = fileNo;
	this.BASE_URL = this.UNIQUE_ID + (".eq.webcdn.stream.ne.jp/www" + this.FILE_NO + "/" + this.UNIQUE_ID + "/jmc_pub/jmc_swf/player/");
};
jStream_JStream.prototype = {
	loadAPI: function(onAPIReady) {
		var _gthis = this;
		var firstScript = window.document.getElementsByTagName("script")[0];
		var script = window.document.createElement("script");
		script.onload = function() {
			_gthis.isInitAPI = true;
			if(onAPIReady != null) {
				onAPIReady();
			}
		};
		script.src = "https://ssl-cache.stream.ne.jp/www" + this.FILE_NO + "/" + this.UNIQUE_ID + "/jmc_pub/jmc_swf/player/t3/obj.js";
		firstScript.parentNode.insertBefore(script,firstScript);
	}
};
var jStream__$PlayerFactoryOBJ_SNS_$Impl_$ = {};
jStream__$PlayerFactoryOBJ_SNS_$Impl_$.list = function(list) {
	return list.join(",");
};
jStream__$PlayerFactoryOBJ_SNS_$Impl_$.facebook = "f";
jStream__$PlayerFactoryOBJ_SNS_$Impl_$.twitter = "t";
jStream__$PlayerFactoryOBJ_SNS_$Impl_$.line = "l";
jStream__$PlayerFactoryOBJ_SNS_$Impl_$.google = "g";
jStream__$PlayerFactoryOBJ_SNS_$Impl_$.mixi = "m";
Main.main();
})();
