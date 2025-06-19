package sprites {
    public class Exit extends Sprite {
        private var _opened:Boolean = false;
        private var _openDelayed:Boolean = false;
        private var _hole:Object;

        public function Exit(data:Element) {
            super(data);
            below = true;
        }

        public function isClosed():Boolean {
            return !_opened;
        }

        override public function show():void {
            setOrientation(orientation);
            mc.stop();
        }

        public function setOrientation(d:int):void {
            switch (d) {
                case Direction.WEST:
                    mc.gotoAndStop("West");
                    break;
                case Direction.EAST:
                    mc.gotoAndStop("East");
                    break;
                case Direction.NORTH:
                    mc.gotoAndStop("North");
                    break;
                case Direction.SOUTH:
                    mc.gotoAndStop("South");
                    break;
            }
            orientation = d;
        }

        public function open():void {
            if (_opened) return;
            if (board.getOver(pos).id != Element.NONE) {
                _openDelayed = true;
                return;
            }
            _opened = true;
            _openDelayed = false;
            mc.swapDepths(mc.getDepth() + 1);
            var hole:Object = Std.attachMC(mc.parent, "jama_Exit", mc.getDepth() - 1);
            hole.stop();
            hole.x = mc.x;
            hole.y = mc.y;
            _hole = hole;
            var a:Object = new anim.OpenExitAnim(this);
            playground.getAnimManager().pushEffect(a);
        }

        public function swapLayer():void {
            board.swapLayer(this, gui.Board.OVER);
            if (orientation != Direction.NORTH) {
                mc.swapDepths(mc.getDepth() + 1);
            } else {
                mc.swapDepths(mc.getDepth() - 1);
            }
        }

        override public function canBeCrossed(sprite:Sprite, d:int):Boolean {
            if (_opened) {
                return sprite.id == Element.HERO && d != Direction.oposite(orientation);
            }
            return true;
        }

        override public function crossed(sprite:Sprite, d:int):void {
            if (_opened && sprite.id == Element.HERO) {
                playground.victory(this);
            }
        }

        override public function update(onmove:Boolean):void {
            if (_openDelayed) {
                open();
            }
        }

        public function fixDepthes():void {
            var hero:Sprite = playground.getHero();
            if (orientation == Direction.NORTH && hero.mc.getDepth() < mc.getDepth()) {
                hero.mc.swapDepths(mc.getDepth());
            }
        }
    }
}
