import sys.FileSystem;

using StringTools;

class ExtensionChanger {
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
        var pre:String = "";
        if (!Prefs._changeAllFiles) { // If CAF, you don't need to put a pre ext
            var notFiles:Bool = true;
            while (notFiles) {
                pre = Input.msgInput("The replaceable file extension? ", String);
                if(!pre.contains(".")) pre = '.$pre'; // Añadiendo el punto, si es que no hay

                var count:Int = 0;
                for (f in arr) if(f.endsWith(pre)) count++;

                if (count == 0) { /// Si no hay archivos con esa extension
                    trace('\nThere isnt files with the extension $pre');
                    Input.continueInput("");
                } else notFiles = false;
            }
        } else Input.continueInput("Hey!, you have enabled the option to change all files!!!\nAre you sure you want to continue?");

		var post:String = Input.msgInput("What extension do you want the files to have? ", String);
        if(!post.contains(".")) post = '.$post'; // Añadiendo el punto, si es que no hay

        Input.continueInput("Press enter to change the file extensions!");

        //------------------------------------------ Cambiar Extensiones ------------------------------------------
        for (file in FileSystem.readDirectory(folderPath)) {
            var filePath =  folderPath + "/" + file;
            var preDone = Prefs._changeAllFiles ? true : filePath.endsWith(pre);

            if (!FileSystem.isDirectory(filePath) && preDone) {
                var newPath:String =FileUtil.replaceExtension(filePath, post);
                if(newPath == null) { // Si por alguna razon esta raro, se salta1!
                    trace('File $file is invalid!!!');
                    continue;
                } else if (newPath == "nulla") { // Si no tiene extensión, se le añade!
                    trace('File $file doesnt have an extension, adding it anyways!!!');
                    newPath = filePath + post; // dumbass
                }

                FileSystem.rename(filePath, newPath);
                trace('Renamed: $file to => $newPath');
            }
        }
        return false;
    }
}