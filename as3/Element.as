package {
    public class Element {
        public static const GHOST:int = -2;
        public static const NONE:int = -1;
        public static const EXIT:int = 0;
        public static const HERO:int = 1;
        public static const BOX:int = 2;
        public static const FRUIT:int = 3;
        public static const PIN:int = 4;
        public static const ARCHER:int = 5;
        public static const SPIDER:int = 6;
        public static const WATER:int = 7;
        public static const WALL:int = 8;
        public static const MAGNET:int = 9;
        public static const GMAGNET:int = 10;
        public static const ONE_WAY:int = 11;
        public static const BOMB:int = 12;
        public static const WINKLE:int = 13;
        public static const PEEBLE:int = 14;
        public static const RUNE:int = 15;
        public static const KOHL:int = 16;
        public static const LOUKI:int = 17;
        public static const LURKER:int = 18;
        public static const JADE:int = 19;
        public static const ONE_WAY_STRICT:int = 20;
        public static const EYE:int = 21;
        public static const BRIDGE:int = 22;

        private static var _NAMES:Array = [];
        private static var _TITLES:Array = [];

        public var id:int;
        public var pos:Coord;
        public var param:int;
        public var orientation:int;

        public function Element(copy:Element = null) {
            if (copy) {
                this.id = copy.id;
                this.pos = copy.pos.clone();
                this.param = copy.param;
                this.orientation = copy.orientation;
            } else {
                this.id = NONE;
                this.pos = new Coord(0, 0);
                this.param = -1;
                this.orientation = 0;
            }
        }

        public static function init():void {
            _register(EXIT, "Exit", "Sortie", true);
            _register(HERO, "Hero", "Hero", true);
            _register(FRUIT, "Fruit", "Fruit", true);
            _register(BOX, "Box", "Caisse", true);
            _register(WALL, "Wall", "Mur", true);
            _register(WATER, "Water", "Eau", true);
            _register(BRIDGE, "Bridge", "Pont foutu", true);
            _register(PEEBLE, "Peeble", "Cailloux", true);
            _register(RUNE, "Rune", "Rune", true);
            _register(ONE_WAY, "OneWay", "Voie unique", true);
            _register(ONE_WAY_STRICT, "OneWayStrict", "Voie unique stricte", true);
            _register(MAGNET, "Magnet", "Aimant", true);
            _register(GMAGNET, "GoldMagnet", "Aimant en or", true);
            _register(BOMB, "Bomb", "BoBombe", true);
            _register(LOUKI, "Louki", "Louki", true);
            _register(KOHL, "Kohl", "Kohl", true);
            _register(WINKLE, "Winkle", "Winkle", true);
            _register(ARCHER, "Archer", "Electrificator", true);
            _register(SPIDER, "Spider", "Araignee", true);
            _register(LURKER, "Lurker", "Lurker", true);
            _register(PIN, "Pin", "Interrupteur", false);
            _register(GHOST, "Ghost", "Fantome", false);
            _register(JADE, "Jade", "Jade", true);
            _register(EYE, "Eye", "Zoeil", true);
        }

        public function toString():String {
            if (this.id == NONE) {
                return "None";
            }
            return _NAMES[this.id];
        }

        public function setOrientation(orientation:int):void {
            this.orientation = orientation;
        }

        public static function nameOf(id:int):String {
            return _NAMES[id];
        }

        public static function titleOf(id:int):String {
            return _TITLES[id];
        }

        public static function idOf(name:String):int {
            for (var i:int = 0; i < _NAMES.length; i++) {
                if (_NAMES[i] == name) {
                    return i;
                }
            }
            if (name == _NAMES[NONE]) return NONE;
            if (name == _NAMES[GHOST]) return GHOST;
            return -999;
        }

        private static function _register(id:int, linkName:String, title:String, inEditor:Boolean):void {
            _NAMES[id] = linkName;
            _TITLES[id] = title;
            if (inEditor) {
                editor.SpriteOrder.IDS.push(id);
            }
        }
    }
}
