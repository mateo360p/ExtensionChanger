class Output {
    public static var nextEnter:Bool = false; // For more fancy messages
    /**
     * Show a line in the console
     * @param msg The message line!
     */
    public static function showMsg(msg:String) {
        Sys.println((Output.nextEnter ? "\n" : "") + msg);
        Output.nextEnter = !nextEnter;
    }

    /**
     * Adds a message next to the previous one
     * @param msg The message!
     */
    public static function addMsg(msg:String) {
        Sys.print(msg);
    }
}