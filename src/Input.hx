using StringTools;

class Input {
    private static function input():String {
        return Sys.stdin().readLine();
    }

    /**
     * Reads an input from the keyboard, and returns the value according to the class `type`
     */
    public static function getInput(type:Class<Dynamic>):Dynamic {
        var dummy = input();
        var out:Dynamic;
        switch (type) {
            case Int, Float:
                out = Std.parseFloat(dummy);
            case Bool:
                out = (dummy.trim().toLowerCase() == "true") ? true: false;
            default: // For anything else, like String!
                out = dummy;
        }
        return out;
    }

    /**
     * Sends a message, waits for input, and return the value with type `type`!
     */
    public static function msgInput(msg:String, type:Class<Dynamic>):Dynamic {
        Output.showMsg(msg);
        Output.nextEnter = true;
        return getInput(type);
    }

    /**
     * Sends a message, waits for input, and continues the processes!
     */
    public static function continueInput(?msg:String = "Press enter to finish") {
        Output.nextEnter = true;
        Output.addMsg(msg.length > 0 ? '\n$msg' : msg);
        input();
    }
}