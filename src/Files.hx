import sys.FileSystem;

using StringTools;

class Files {
    /**
     * Lee los archivos y folderes dentro un path dado!
     * @return Si el programa encontro o no el path
     */
    public static function replacingPaths():Bool {
        var arr:Array<String> = [];
        var folderPath:String = Input.msgInput("Insert your path: ", String);

        //------------------------------------------ Hallar la ruta ------------------------------------------
        if (!FileSystem.exists(folderPath) || !FileSystem.isDirectory(folderPath)) { /// Si no se haya la carpeta
            trace("Invalid path!!!, does the folder exist?");
            Input.continueInput();
            return true;
        }

        Output.showMsg("Founded path!!!");
        for (file in FileSystem.readDirectory(folderPath)) arr.push(file); 
        Input.continueInput("Files inside your path: " + arr.toString());

        //------------------------------------------ Extensiones ------------------------------------------
        var notFiles:Bool = true;
        var pre:String = "";
        while (notFiles) {
            pre = Input.msgInput("The replaceable file extension? ", String);
            if(!pre.contains(".")) pre = '.$pre'; // Añadiendo el punto, si es que no hay

            var count:Int = 0;
            for (f in arr) if(f.endsWith(pre)) count++;

            if (count == 0) { /// Si no hay archivos con esa extension
                trace('There isnt files with the extension $pre');
                Input.continueInput("");
            } else notFiles = false;
        }

		var post:String = Input.msgInput("The new file extension? ", String);
        if(!post.contains(".")) post = '.$post'; // Añadiendo el punto, si es que no hay

        Input.continueInput("Press enter to change the file extensions!");

        //------------------------------------------ Cambiar Extensiones ------------------------------------------
        for (file in FileSystem.readDirectory(folderPath)) {
            var filePath = folderPath + "/" + file;
            if (!FileSystem.isDirectory(filePath) && filePath.endsWith(pre)) {
                var newPath:String = replaceExtension(filePath, post);
                if(newPath == null) { // Si por alguna razon esta raro, se salta1!
                    trace('File $file is invalid!!!');
                    continue;
                } else if (newPath == "nulla") { // Si no tiene extensión, se le añade!
                    trace('File $file doesnt have an extension, adding it anyways!!!');
                    newPath += post;
                }
                FileSystem.rename(filePath, newPath);
                trace('Renamed: $file to => $newPath');
            }
        }
        return false;
    }

    /**
     * Cambia la extension de `path`, si es que tiene una, por `newExt`
     * @return La nueva ruta del archivo!
     */
    public static function replaceExtension(path:String, newExt:String):String {
        if (path == null || path.length < 1) return null;

        var dotPos:Int = path.lastIndexOf("."); // Posicion del punto
        if (dotPos == -1) return "nulla";

        var noExtString:String = path.substr(0, dotPos); // Obtiene el texto antes del punto
        return '$noExtString$newExt'; // Final
    }
}