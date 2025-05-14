class Main {
	static final version:String = "v0.0.2";
	static function main() {
		Input.continueInput('Hi!, welcome to Extension Changer ($version)!\nPress enter to start!');

		if (Files.replacingPaths()) return; // Si falló y se presiona cualquier tecla se acaba el programa

		Input.continueInput();
	}
}
