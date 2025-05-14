using StringTools;

class Input {
    private static function input():String {
        return Sys.stdin().readLine();
    }

    /**
     * Lee un input de teclado, y regresa el valor segun la clase `type`
     */
    public static function getInput(type:Class<Dynamic>):Dynamic {
        var dummy = input();
        var out:Dynamic;
        switch (type) {
            case Int, Float:
                out = Std.parseFloat(dummy);
            case Bool:
                out = (dummy.trim().toLowerCase() == "true") ? true: false;
            default: // Para cualquier otro, y para String!;
                out = dummy;
        }
        return out;
    }

    /**
     * Manda un mensaje, espera al input, y asigna su valor a la `variable`!
     */
    public static function msgInput(msg:String, type:Class<Dynamic>):Dynamic {
        Output.showMsg(msg + "\n");
        return getInput(type);
    }

    /**
     * Manda un mensaje, espera al input, y continua los procesos!
     */
    public static function continueInput(?msg:String = "Press enter to finish") {
        Output.addMsg(msg.length > 0 ? '\n$msg' : msg); // Para evitar posibles "bugs" visuales
        input(); // Luego de esto continua el codigo, o si no hay mas se cierra
    }
}