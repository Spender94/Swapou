package {
    public class Sprite extends Element {
        public var attractedByMagnet:Boolean = false;
        public var isMoving:Boolean = false;
        public var below:Boolean = false;
        public var alive:Boolean = true;
        public var isMagnet:Boolean = false;
        public var isBadGuy:Boolean = false;
        public var mc:Object;
        public var subMc:Object;
        public var playground:Object;
        public var board:Object;
        public const IS_AVATAR:Boolean = false;

        public function Sprite(data:Element) {
            super(data);
        }

        public static function create(parent:Object, data:Element):Sprite {
            var s:Sprite;
            switch (data.id) {
                case Element.EXIT:
                    s = new sprites.Exit(data);
                    break;
                // TODO: handle other cases
                default:
                    return null;
            }
            s.mc = _createJamaMC(parent, s.id);
            s.subMc = s.mc.j;
            return s;
        }

        public function setPlayground(gamePlayground:Object):void {
            playground = gamePlayground;
            board = gamePlayground.getBoard();
        }

        public function destroy():void {
            alive = false;
            mc.removeMovieClip();
            playground.spriteDestroyed(this);
        }

        public function show():void {}
        public function redraw():void {}
        public function showEditor():void { show(); }

        public function canBeCrossed(sprite:Sprite, d:int):Boolean { return false; }
        public function crossed(sprite:Sprite, d:int):void {}
        public function canLeave(sprite:Sprite, d:int):Boolean { return true; }
        public function canMove(d:int):Boolean { return false; }
        public function move(d:int):void {}
        public function canBePushed(sprite:Sprite):Boolean { return false; }
        public function equals(s:Sprite):Boolean {
            return s.id == id && pos.equals(s.pos) && mc.getDepth() == s.mc.getDepth();
        }
        public function update(onmove:Boolean):void {}
        public function isAvatar():Boolean { return IS_AVATAR; }
        public function requiresParameter():Boolean { return false; }
        public function setParameter(p:int):int { param = p; return param; }
        public function defaultParameter():int { return -1; }

        private static function _createJamaMC(parent:Object, id:int):Object {
            if (id == Element.GHOST) {
                id = Element.HERO;
            }
            var link:String = "jama_" + Element.nameOf(id);
            var mc:Object = yota.McTop.attach(parent, link);
            if (mc == null) {
                Jama.debug("Error: Unable to find '" + link + "' linkage", "Sprite", "src/Sprite.mt", 199);
            }
            return mc;
        }
    }
}
