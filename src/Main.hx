class Main {
	static function main() {
		/*
		var name:String; // This was a test!!!
		name = Input.msgInput("Ingresa tu nombre!!!", String);
		Input.continueInput('Hola $name!, presiona cualquier tecla para continuar');
		*/

		if (Files.replacingPaths()) return; // Si falló y se presiona cualquier tecla se acaba el programa

		Input.continueInput();
	}
}
