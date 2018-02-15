package ;

import js.Browser;
import js.html.Element;
import js.jStream.JStream;
import js.jStream.PlayerFactoryOBJ;

class Main {

	public static function main():Void {

		Browser.window.addEventListener('DOMContentLoaded',init);

	}

	private static function init():Void {

		var target :Element = Browser.document.getElementById('video');
		var jstream:JStream = new JStream('eqz989uscl','NDk2','50');

		function onAPIReady() {

			var player:JMCPlayer = PlayerFactoryOBJ.create({
				b:jstream.BASE_URL,
				c:jstream.CONTACT_ID,
				m:target.dataset.videoId,
				s:{ wp:640,hp:480,sn:SNS.list([google,twitter]) }
			},target.id);

			player.accessor.addEventListener(EventType.landing,function(info:Event) {
				trace(player.flashVars.thumbnail_url);
				trace(info);
			});

			player.accessor.addEventListener(EventType.change_state,function(info:Event) {
				trace(info);
			});

			player.accessor.addEventListener(EventType.error,function(info:ErrorEvent) {
				trace(info);
			});

		}

		jstream.load(onAPIReady);

	}

}
