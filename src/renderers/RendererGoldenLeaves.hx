package renderers;

import de.ellpeck.rockbottom.api.util.Colors;
import de.ellpeck.rockbottom.api.util.reg.ResourceName;
import de.ellpeck.rockbottom.api.IGameInstance;
import de.ellpeck.rockbottom.api.assets.IAssetManager;
import de.ellpeck.rockbottom.api.IRenderer;
import de.ellpeck.rockbottom.api.world.IWorld;
import de.ellpeck.rockbottom.api.tile.state.TileState;
import de.ellpeck.rockbottom.api.world.layer.TileLayer;
import java.NativeArray;
import de.ellpeck.rockbottom.api.render.tile.DefaultTileRenderer;
import tiles.TileGoldenLeaves;

@:nativeGen
class RendererGoldenLeaves extends DefaultTileRenderer<TileGoldenLeaves> {
	public function new(name:ResourceName) {
		super(name);
	}

	@:overload
	override function render(game:IGameInstance, manager:IAssetManager, g:IRenderer, world:IWorld, tile:TileGoldenLeaves, state:TileState, x:Int, y:Int,
			layer:TileLayer, renderX:Single, renderY:Single, scale:Single, light:NativeArray<Int>) {
		var stage = state.get(TileGoldenLeaves.STAGE).toInt();
		var color = Colors.lerp(0xFF017015, 0xFFd9ca00, stage / 10.0);
		manager.getTexture(this.texture).getPositionalVariation(x, y).draw(renderX, renderY, scale, scale, light, color);
	}
}
