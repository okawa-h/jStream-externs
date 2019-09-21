# JStream API externs for Haxe

This is extern for Haxe.
A tool for controlling JStream video player with Javascript for everyone.

## Example

This is extern.

If you use `jstream.loadAPI()`, loading JStream API with HTML is unnecessary.

Please refer to the following haxe code or example directory.

HTML code:

```html
<div id="video" data-video-id="MjUw"></div>
```

Haxe code:

```haxe
import js.Browser;
import js.html.Element;
import jStream.JStream;
import jStream.PlayerFactoryOBJ;

class Main {

  public static function main():Void {

    Browser.window.addEventListener('DOMContentLoaded',init);

  }

  private static function init():Void {

    var target:Element = Browser.document.getElementById('video');
    var jstream:JStream = new JStream('eqz989uscl', 'NDk2', '50');

    function onAPIReady() {

      var player:JMCPlayer = PlayerFactoryOBJ.create({
        b:jstream.BASE_URL,
        c:jstream.CONTACT_ID,
        m:target.dataset.videoId,
        s:{ wp:640,hp:480,sn:SNS.list([google,twitter]) }
      },target.id);

      player.accessor.addEventListener(EventType.landing, function(info:Event) {
        trace(player.flashVars.thumbnail_url);
        trace(info);
      });

      player.accessor.addEventListener(EventType.change_state, function(info:Event) {
        trace(info);
      });

      player.accessor.addEventListener(EventType.error, function(info:ErrorEvent) {
        trace(info);
      });

    }

    jstream.loadAPI(onAPIReady);

  }

}
```

## References

Original API document:
https://support.eq.stream.co.jp/hc/ja/sections/115001876908-%E3%83%97%E3%83%AC%E3%82%A4%E3%83%A4%E3%83%BCAPI%E3%81%AE%E4%BB%95%E6%A7%98
