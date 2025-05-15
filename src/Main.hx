
class Main {
	static final version:String = "v0.0.3";
	static function main() {
		Input.continueInput('Hi!, welcome to Extension Changer ($version)!\nPress enter to start!');

		startPrefs();
		Prefs.loadPrefs();

		if (ExtensionChanger.replacingPaths()) return; // Si falló y se presiona cualquier tecla se acaba el programa

		Input.continueInput();
	}

	static function startPrefs() {
		if (!FileUtil.fileExists(Prefs.prefFile + ".json")) {
			FileUtil.saveJson(Prefs.prefFile, Prefs.prefDefault); // Saves the default values!
			//trace("Pref file created");
		} //else trace("Your already have a Prefs file!");
	}
}
