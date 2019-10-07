import tiles.ModTiles;
import de.ellpeck.rockbottom.api.util.reg.ResourceName;
import de.ellpeck.rockbottom.api.data.set.DataSet;
import de.ellpeck.rockbottom.api.assets.IAssetManager;
import de.ellpeck.rockbottom.api.event.IEventHandler;
import de.ellpeck.rockbottom.api.IApiHandler;
import de.ellpeck.rockbottom.api.IGameInstance;
import de.ellpeck.rockbottom.api.data.settings.ModConfig;
import de.ellpeck.rockbottom.api.mod.IMod;
import de.ellpeck.rockbottom.api.gui.Gui;
import java.NativeArray;
import java.lang.Class;
import java.Lib;
import java.util.logging.Logger;

class Mod implements IMod {
	public static var instance:Mod;

	private var modLogger:Logger;

	public function new() {
		instance = this;
	}

	public static function getLogger():Logger {
		return instance.modLogger;
	}

	public static function createRes(name:String):ResourceName {
		return new ResourceName(instance, name);
	}

	public function getDisplayName():String {
		return "Nature's Aura";
	}

	public function getId():String {
		return "narb";
	}

	public function getVersion():String {
		return "0.1";
	}

	public function getResourceLocation():String {
		return "assets/" + this.getId();
	}

	public function getContentLocation():String {
		return "";
	}

	public function getDescription():String {
		return "Nature's Aura but for Rock Bottom, also made in Haxe. Fun.";
	}

	public function getAuthors():NativeArray<String> {
		return Lib.nativeArray(["Ellpeck"], true);
	}

	public function getSortingPriority():Int {
		return 0;
	}

	public function getModGuiClass():Class<Gui> {
		return null;
	}

	public function getModConfig():ModConfig {
		return null;
	}

	public function isDisableable():Bool {
		return true;
	}

	public function isRequiredOnClient():Bool {
		return true;
	}

	public function isRequiredOnServer():Bool {
		return true;
	}

	public function isCompatibleWithModVersion(version:String):Bool {
		return version == this.getVersion();
	}

	public function receiveMessage(sender:IMod, messageIdentifier:String, message:DataSet):DataSet {
		return null;
	}

	public function prePreInit(game:IGameInstance, apiHandler:IApiHandler, eventHandler:IEventHandler) {
		this.modLogger = apiHandler.createLogger(this.getDisplayName());
	}

	public function preInit(game:IGameInstance, apiHandler:IApiHandler, eventHandler:IEventHandler) {
		this.modLogger.info("Starting Nature's Aura for RockBottom");
		ModTiles.dummyInit();
	}

	public function init(game:IGameInstance, apiHandler:IApiHandler, eventHandler:IEventHandler) {}

	public function postInit(game:IGameInstance, apiHandler:IApiHandler, eventHandler:IEventHandler) {}

	public function postPostInit(game:IGameInstance, apiHandler:IApiHandler, eventHandler:IEventHandler) {}

	public function preInitAssets(game:IGameInstance, assetManager:IAssetManager, apiHandler:IApiHandler) {}

	public function initAssets(game:IGameInstance, assetManager:IAssetManager, apiHandler:IApiHandler) {}

	public function postInitAssets(game:IGameInstance, assetManager:IAssetManager, apiHandler:IApiHandler) {}
}
