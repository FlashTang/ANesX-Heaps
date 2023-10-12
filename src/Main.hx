
import openfl.utils.ByteArray;
import haxe.io.Bytes;
import hxd.net.BinaryLoader;
import h3d.mat.Texture;
import h2d.Tile;
import hxd.BitmapData;
import h2d.Bitmap;

class Main extends hxd.App {
    override function init() {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "Hello World !";

        
		// var bmd:BitmapData = new BitmapData(256,240);
      
        // var tile:Tile = Tile.fromBitmap(bmd);
        
        var bm:Bitmap = new Bitmap();
        bm.scale(2);
        s2d.addChild(bm);
        var vm:VM = new VM();
        vm.connectTV(bm);
        vm.reset();

        var loader:BinaryLoader = new BinaryLoader("./马里奥.nes");
        loader.onLoaded = function (e:Bytes) {
            vm.insertCartridge(e.getData());
           
        }
        loader.onError = function (e) {
            trace(e);
        }
        loader.load();

    


    }
    static function main() {
        new Main();
    }
}