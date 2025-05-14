class Output {
    public static var nextEnter:Bool = false;
    /**
     * Muestra una linea en la consola 
     * @param msg La línea de mensaje!
     */
    public static function showMsg(msg:String) {
        Sys.println((Output.nextEnter ? "\n" : "") + msg);
        Output.nextEnter = !nextEnter;
    }

    /**
     * Añade un mensaje al lado del anterior
     * @param msg El mensaje!
     */
    public static function addMsg(msg:String) {
        Sys.print(msg);
    }
}