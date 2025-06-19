package {
    public class Direction {
        public static const NORTH:int = 0;
        public static const EAST:int  = 1;
        public static const SOUTH:int = 2;
        public static const WEST:int  = 3;
        public static const NE:int    = 4;
        public static const NW:int    = 5;
        public static const SE:int    = 6;
        public static const SW:int    = 7;

        private static const _Names:Array = ["North", "East", "South", "West"];

        public static function nameOf(direction:int):String {
            if (direction >= NORTH && direction <= WEST) {
                return _Names[direction];
            }
            return "UnknownDirection:" + direction;
        }

        public static function oposite(d:int):int {
            switch (d) {
                case NORTH: return SOUTH;
                case SOUTH: return NORTH;
                case WEST: return EAST;
                case EAST: return WEST;
            }
            return -1;
        }

        public static function next(d:int):int {
            d++;
            if (d > 3) d = 0;
            return d;
        }
    }
}
