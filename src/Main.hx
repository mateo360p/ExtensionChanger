
class Main {
	static final version:String = "v0.0.3a"; // Its the same sht as before-
	static function main() {
		Input.continueInput('Hi!, welcome to Extension Changer ($version)!\nPress enter to start!');

		startPrefs();
		Prefs.loadPrefs();

		if (ExtensionChanger.replacingPaths()) return; // if failed and pressed enter, ends the program

		Input.continueInput();
	}

	static function startPrefs() {
		if (!FileUtil.fileExists(Prefs.prefFile + ".json")) {
			FileUtil.saveJson(Prefs.prefFile, Prefs.prefDefault); // Saves the default values!
			//trace("Pref file created");
		} //else trace("Your already have a Prefs file!");
	}
}
