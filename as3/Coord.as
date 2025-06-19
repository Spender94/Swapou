package {
    public class Coord {
        public var x:int;
        public var y:int;

        public function Coord(x:int = 0, y:int = 0) {
            this.x = x;
            this.y = y;
        }

        public function clone():Coord {
            return new Coord(x, y);
        }

        public function next(direction:int):Coord {
            switch (direction) {
                case Direction.NORTH:
                    return new Coord(x, y - 1);
                case Direction.EAST:
                    return new Coord(x + 1, y);
                case Direction.SOUTH:
                    return new Coord(x, y + 1);
                case Direction.WEST:
                    return new Coord(x - 1, y);
                case Direction.NE:
                    return new Coord(x + 1, y - 1);
                case Direction.NW:
                    return new Coord(x - 1, y - 1);
                case Direction.SE:
                    return new Coord(x + 1, y + 1);
                case Direction.SW:
                    return new Coord(x - 1, y + 1);
            }
            return new Coord(-1, -1);
        }

        public function toString():String {
            return "[" + x + ":" + y + "]";
        }

        public function equals(other:Coord):Boolean {
            return x == other.x && y == other.y;
        }

        public function directionOf(other:Coord):int {
            if (x == other.x) {
                if (y > other.y) return Direction.NORTH;
                return Direction.SOUTH;
            }
            if (x > other.x) return Direction.WEST;
            return Direction.EAST;
        }

        public function distanceOf(other:Coord):int {
            if (x == other.x) return Math.abs(y - other.y);
            if (y == other.y) return Math.abs(x - other.x);
            return -1;
        }
    }
}
