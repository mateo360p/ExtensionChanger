import haxe.Json;
import sys.FileSystem;
import sys.io.File;

class FileUtil {
    private static function saveContent(path:String, ?fileContent:String = '')
		return File.saveContent(path, fileContent);

	/**
	 * Returns if there exists a file in that `path`
	 */

	public static function fileExists(path:String):Bool
		return FileSystem.exists(path);

	/**
	 * Gets the content of a file
	 * @param path of the file, with extension!
	 */
	public static function getFileContent(path:String):String
		return File.getContent(path);

	/**
	 * Extracts a json structure
	 * @param json Name of the file, NO extension
	 * @return the content!
	 */
	public static function parseJson(json:String):Dynamic
		return Json.parse(getFileContent('$json.json'));

	/**
	 * Saves a json structure
	 * @param name of the file, NO extension
	 * @param structure of the json
	 */
	public static function saveJson(name:String, structure:Dynamic) {
		var json:String = Json.stringify(structure, null, "   ");

		var barPos:Int = name.lastIndexOf("/"); // Bar pos
        var directories:String;
		var file:String;

        if (barPos == -1) {
			directories = ""; // No dirs
			file = name; // File name is the name itself
		} else {
        	directories = name.substr(0, barPos); // Dirs
			file = name.substr(barPos + 1, name.length); // File Name
		}
		saveFile('$file.json', directories, json); // All da shi to fixed a weird thing!
	}

	/**
	 * Saves a file!, if the `folder` doesn't exist, the code creates it
	 * @param name The file Name, WITH EXTENSION!
	 * @param folder Folder in which the file will be
	 * @param fileContent Content inside the file
	 */
	public static function saveFile(name:String, ?folder:String = '', ?fileContent:String = '') {
        if(folder == null) folder = "";

        var usableFolder:Bool = (folder.length > 0);

		if(usableFolder) {
            if(!fileExists(folder)) FileSystem.createDirectory(folder);
            name = '/$name';
        }

		saveContent(folder + name, fileContent);
	}

	/**
     * Sets the extension of `path`, if it has one, to `newExt`.

	 * C:Dummy.txt -> C:Dummy.hx (For example).
     */
    public static function replaceExtension(path:String, newExt:String):String {
        if (path == null || path.length < 1) return null;

        var dotPos:Int = path.lastIndexOf("."); // Dot pos
        if (dotPos == -1) return "nulla";

        var noExtString:String = path.substr(0, dotPos); // Gets the text before the dot
        return '$noExtString$newExt'; // End
    }
}