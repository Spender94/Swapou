package gui.dialog {
    public class ErrorDialog {
        private var _mc:Object;
        private var _text:String;
        private var _titleArea:Object;
        private var _contentArea:Object;

        public function ErrorDialog(parent:Object) {
            _mc = yota.McTop.create(parent);
        }

        public function setText(str:String):void {
            _text = str;
        }

        public function draw():void {
            var h:int = 300;
            var w:int = 300;
            _mc.beginFill(Consts.BROWN, 100);
            _mc.lineStyle(2, Consts.LIGHT_BROWN, 100);
            _mc.moveTo(0, 0);
            _mc.lineTo(w, 0);
            _mc.lineTo(w, h);
            _mc.lineTo(0, h);
            _mc.lineTo(0, 0);
            _mc.endFill();
            _mc.x = (Consts.WIDTH - w) / 2;
            _mc.y = (Consts.HEIGHT - h) / 2;

            var border:Object = yota.McTop.create(_mc);
            border.lineStyle(2, Consts.BLACK_BROWN, 100);
            border.moveTo(15, 35);
            border.lineTo(w - 15, 35);
            border.lineTo(w - 15, h - 15);
            border.lineTo(15, h - 15);
            border.lineTo(15, 35);

            _titleArea = yota.McTop.createTextField(_mc);
            _titleArea.textWidth = w - 20;
            _titleArea.x = 10;
            _titleArea.y = 10;
            _titleArea.width = w - 20;
            _titleArea.height = 25;
            _titleArea.textColor = Consts.BLACK_BROWN;
            var tf:Object = _titleArea.getTextFormat();
            tf["color"] = Consts.BLACK_BROWN;
            tf.font = "Arial";
            tf.size = 20;
            tf.bold = true;
            _titleArea.setNewTextFormat(tf);
            _titleArea.text = Consts.ERR_DIAL_TITLE;

            _contentArea = yota.McTop.createTextField(_mc);
            _contentArea.textWidth = w - 30;
            _contentArea.textHeight = h - 50;
            _contentArea.width = w - 30;
            _contentArea.height = h - 50;
            _contentArea.x = 15;
            _contentArea.y = 45;
            _contentArea.textColor = Consts.BLACK_BROWN;
            _contentArea.multiline = true;
            _contentArea.wordWrap = true;
            tf = _contentArea.getTextFormat();
            tf["color"] = Consts.BLACK_BROWN;
            tf.font = "Arial";
            tf.align = "center";
            tf.size = 16;
            tf.leftMargin = 5;
            tf.rightMargin = 5;
            _contentArea.setNewTextFormat(tf);
            _contentArea.text = _text;

            var self:ErrorDialog = this;
            _mc.onRelease = function():void { self.onQuit(); };
        }

        public function onQuit():void {
            // default behaviour: remove dialog
            _mc.removeMovieClip();
        }
    }
}
