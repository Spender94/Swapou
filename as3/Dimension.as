package {
    public class Dimension {
        public var width:int;
        public var height:int;
        public function Dimension(w:int = 0, h:int = 0) { width = w; height = h; }
        public function clone():Dimension { return new Dimension(width, height); }
        public function toString():String { return width + "x" + height; }
    }
}
