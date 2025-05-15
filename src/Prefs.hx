class Prefs {
    public static var _loadSubdirectories:Bool = false;
    public static var _changeAllFiles:Bool = false;

    // Yeah, preferences for a File changer-
    public static final prefFile:String = "data/prefs";
    public static final prefDefault = {
        LSD: false,
        CAF: false,
    }

    /**
     * Bruh-, load the preferences
     */
    public static function loadPrefs() {
        var json = FileUtil.parseJson(prefFile);
        if (json.LSD != null) _loadSubdirectories = json.LSD;
        if (json.CAF != null) _changeAllFiles = json.CAF;
    }
}