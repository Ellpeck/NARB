package tiles;

import de.ellpeck.rockbottom.api.tile.state.TileProp;
import java.lang.Integer;
import java.Lib;
import de.ellpeck.rockbottom.api.render.tile.ITileRenderer;
import de.ellpeck.rockbottom.api.util.Util;
import de.ellpeck.rockbottom.api.tile.state.IntProp;
import de.ellpeck.rockbottom.api.world.IWorld;
import de.ellpeck.rockbottom.api.world.layer.TileLayer;
import de.ellpeck.rockbottom.api.util.BoundBox;
import de.ellpeck.rockbottom.api.util.reg.ResourceName;
import de.ellpeck.rockbottom.api.tile.TileBasic;
import renderers.RendererGoldenLeaves;

@:nativeGen
class TileGoldenLeaves extends TileBasic {
	public static final STAGE = new IntProp("stage", 0, 10);

	public function new(name:ResourceName) {
		super(name);
		var stages:Array<TileProp<Dynamic>> = [STAGE];
		this.addProps(Lib.nativeArray(stages, true));
	}

	@:overload
	override function updateRandomly(world:IWorld, x:Int, y:Int, layer:TileLayer) {
		/* if (Util.RANDOM.nextInt(10) != 0)
			return; */
		var state = world.getState(layer, x, y);
		var stage = state.get(STAGE).toInt();
		if (stage < 9) {
			world.setState(layer, x, y, state.prop(STAGE, stage + 1));
		}
	}

	@:overload
	override function createRenderer(param1:ResourceName):ITileRenderer<Dynamic> {
		return new RendererGoldenLeaves(param1);
	}

	@:overload
	override function isFullTile():Bool {
		return false;
	}

	@:overload
	override function getBoundBox(world:IWorld, x:Int, y:Int, layer:TileLayer):BoundBox {
		return null;
	}
}
