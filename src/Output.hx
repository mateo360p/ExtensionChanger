class Output {
    /**
     * Muestra una linea en la consola 
     * @param msg La línea de mensaje!
     */
    public static function showMsg(msg:String) {
        Sys.println(msg);
    }

    /**
     * Añade un mensaje al lado del anterior
     * @param msg El mensaje!
     */
    public static function addMsg(msg:String) {
        Sys.print(msg);
    }
}