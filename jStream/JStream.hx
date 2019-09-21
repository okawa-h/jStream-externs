package jStream;

import js.Browser.document;
import js.html.Element;
import js.html.ScriptElement;

class JStream {

	public var UNIQUE_ID:String;
	public var CONTACT_ID:String;
	public var FILE_NO:String;
	public var BASE_URL:String;
	public var isInitAPI:Bool = false;

	public function new(uniqueId:String,contactId:String,fileNo:String) {

		UNIQUE_ID = uniqueId;
		CONTACT_ID = contactId;
		FILE_NO = fileNo;
		BASE_URL = UNIQUE_ID + '.eq.webcdn.stream.ne.jp/www$FILE_NO/$UNIQUE_ID/jmc_pub/jmc_swf/player/';

	}

	public function loadAPI(?onAPIReady:Void->Void) {

		var firstScript:Element = document.getElementsByTagName('script')[0];
		var script:ScriptElement = document.createScriptElement();
		script.onload = function() {
			isInitAPI = true;
			if (onAPIReady != null) onAPIReady();
		};
		script.src = 'https://ssl-cache.stream.ne.jp/www$FILE_NO/$UNIQUE_ID/jmc_pub/jmc_swf/player/t3/obj.js';
		firstScript.parentNode.insertBefore(script,firstScript);

	}

}