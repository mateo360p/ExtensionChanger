import sys.FileSystem;

using StringTools;

class ExtensionChanger {
    /**
     * Finds files and folders inside a path!
     * @return If the code founded it
     */
    public static function replacingPaths():Bool {
        var arr:Array<String> = [];
        var folderPath:String = Input.msgInput("Insert your path: ", String);

        //------------------------------------------ Find the folder from path ------------------------------------------
        if (!FileSystem.exists(folderPath) || !FileSystem.isDirectory(folderPath)) { // If the folder wasn't founded
            trace("Invalid path!!!, does the folder exist?");
            Input.continueInput();
            return true;
        }

        Output.showMsg("Founded path!!!");
        for (file in FileSystem.readDirectory(folderPath)) arr.push(file); 
        Input.continueInput("Files inside your path: " + arr.toString());

        //------------------------------------------ Extensions ------------------------------------------
        var pre:String = "";
        if (!Prefs._changeAllFiles) { // If CAF, you don't need to put a pre ext
            var notFiles:Bool = true;
            while (notFiles) {
                pre = Input.msgInput("The replaceable file extension? ", String);
                if(!pre.contains(".")) pre = '.$pre'; // Adding the dot, if it isn't one
                var count:Int = 0;
                for (f in arr) if(f.endsWith(pre)) count++;

                if (count == 0) { // If there aren't any files with that extension
                    trace('\nThere isnt files with the extension $pre');
                    Input.continueInput("");
                } else notFiles = false;
            }
        } else Input.continueInput("Hey!, you have enabled the option to change all files!!!\nAre you sure you want to continue?");

		var post:String = Input.msgInput("What extension do you want the files to have? ", String);
        if(!post.contains(".")) post = '.$post'; // Again, adding the dot, if it isn't one

        Input.continueInput("Press enter to change the file extensions!");

        //------------------------------------------ Changing extensions ------------------------------------------
        for (file in FileSystem.readDirectory(folderPath)) {
            var filePath =  folderPath + "/" + file;
            var preDone = Prefs._changeAllFiles ? true : filePath.endsWith(pre);

            if (!FileSystem.isDirectory(filePath) && preDone) {
                var newPath:String = FileUtil.replaceExtension(filePath, post);
                if(newPath == null) { // If, for some reason-, the path is null, it just skip it!
                    trace('File $file is invalid!!!');
                    continue;
                } else if (newPath == "nulla") { // If it hasn't an extension, we add it!
                    trace('File $file doesnt have an extension, adding it anyways!!!');
                    newPath = filePath + post;
                }

                FileSystem.rename(filePath, newPath);
                trace('Renamed: $file to => $newPath');
            }
        }
        return false;
    }
}