package js.jStream;

import haxe.extern.EitherType;

@:enum abstract Availability(String) from String to String {
	var on :String = 'on';
	var off:String = 'off';
}

@:enum abstract Responsive(String) from String to String {
	var fit:String = 'fit';
	var off:String = 'off';
}

@:enum abstract DefaultQuality(Int) from Int to Int {
	var Low     :Int = 1;
	var Standard:Int = 2;
	var High    :Int = 3;
	var HD      :Int = 4;
	var FullHD  :Int = 5;
}

@:enum abstract WaterMarkDesign(Int) from Int to Int {
	var square:Int = 1;
	var circle:Int = 2;
}

@:enum abstract FooterAlign(String) from String to String {
	var left  :String = 'left';
	var center:String = 'center';
	var right :String = 'right';
}

@:enum abstract SNS(String) from String to String {
	var facebook:String = 'f';
	var twitter :String = 't';
	var line    :String = 'l';
	var google  :String = 'g';
	var mixi    :String = 'm';
	public static function list(list:Array<SNS>) {
		return list.join(',');
	}
}

typedef Setting = {
	b  :String,
	c  :String,
	m  :String,
	?t :Int,
	?ot:String,
	?s :SettingInfo,
	?o :Dynamic
}

typedef SettingInfo = {
	wp:Int,
	hp:Int,
	?rp:Responsive,
	?dq:Int,
	?pb:Availability,
	?wm:Availability,
	?wd:WaterMarkDesign,
	?cp:Availability,
	?vc:Availability,
	?sb:Availability,
	?fs:Availability,
	?ft:String,
	?fa:FooterAlign,
	?ti:Availability,
	?is:Availability,
	?ip:Availability,
	?el:Availability,
	?tg:Availability,
	?il:Availability,
	?mb:Availability,
	?rb:Availability,
	?sn:String
}
 
@:native('jstream_t3.PlayerFactoryOBJ')
extern class PlayerFactoryOBJ {

	public static function create(setting:Setting,target:String):JMCPlayer;
	public static function version():String;

}

typedef EQPlayerModel = {
	thumbnail_url:String,
	title:String
}

typedef MobileAgentList = {
	Android1  :Bool,
	Android2  :Bool,
	Android3  :Bool,
	Android4  :Bool,
	BlackBerry:Bool,
	Firefox   :Bool,
	Windows   :Bool,
	WindowsPC :Bool,
	iOSP      :Bool,
	iOST      :Bool
}

extern class JMCPlayer {

	public var accessor:EQPlayerAccessAPI;

	public var fieldID:String;
	public var objectID:String;
	public var targetElementID:String;

	public var flashVars:EQPlayerModel;

	public var isMobile:MobileAgentList;

}

@:enum abstract EventType(String) from String to String {
	var landing     :String = 'landing';
	var change_state:String = 'change_state';
	var buffering   :String = 'buffering';
	var playing     :String = 'playing';
	var progress    :String = 'progress';
	var paused      :String = 'paused';
	var seek_start  :String = 'seek_start';
	var complete    :String = 'complete';
	var error       :String = 'error';
}

@:enum abstract State(String) from String to String {
	var landing   :String = 'landing';
	var buffering :String = 'buffering';
	var playing   :String = 'playing';
	var paused    :String = 'paused';
	var seek_start:String = 'seek_start';
	var complete  :String = 'complete';
	var error     :String = 'error';
}

@:enum abstract ErrorCode(String) from String to String {
	var MetaInfoLoadError       :String = 'MetaInfo.LoadError';
	var PlayerSettingsLoadError :String = 'PlayerSettings.LoadError';
	var ServiceSettingsLoadError:String = 'ServiceSettings.LoadError';
	var ServerMediaError        :String = 'Server.MediaError';
	var ViewLimitDisabled       :String = 'ViewLimit.Disabled';
	var FlashPlayerVersionError :String = 'FlashPlayer.VersionError';
}

typedef Event = {
	currentTarget:Dynamic,
	data:Dynamic,
	type:EventType
}

typedef ErrorEvent = {
	code   :ErrorCode,
	message:String,
	subject:String,
	type   :State
}

extern class EQPlayerAccessAPI {

	public var progressRate:Int;
	public var state:State;

	public function addEventListener(type:EventType,callback:EitherType<Event->Void,ErrorEvent->Void>):Void;
	public function removeEventListener(type:EventType,callback:EitherType<Event->Void,ErrorEvent->Void>):Void;

	public function play():Void;
	public function pause():Void;

	public function getCurrentTime():Float;
	public function setCurrentTime(time:Float):Void;

	public function getTotalTime():Float;

	public function changeQuality(quality:DefaultQuality):Void;

	public function mute(enabled:Bool):Bool;
	public function isMuted():Bool;

	public function setVolume(vol:Int):Void;
	public function getVolume():Int;

}
