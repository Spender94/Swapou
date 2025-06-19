package yota {
    public class VersionField {
        private var _width:int;
        private var _height:int;
        private var _text:String;
        private var _pane:Object;
        private var _textArea:Object;

        public function VersionField(mc:Object, w:int, h:int, version:String) {
            _width = w;
            _height = h;
            _text = version;
            _createPane(mc);
            _createTextArea();
        }

        public function destroy():void {
            _pane.removeMovieClip();
        }

        private function _createPane(mc:Object):void {
            var depth:int = 2001;
            _pane = Std.createEmptyMC(mc, depth);
        }

        private function _createTextArea():void {
            _textArea = Std.createTextField(_pane, 2000);
            _textArea.background = true;
            _textArea.backgroundColor = 0;
            _textArea.width = 40;
            _textArea.x = (_width / 2) - 20;
            var tf:Object = _textArea.getTextFormat();
            tf["color"] = 0xEEEEFF;
            tf.bullet = false;
            tf.font = "courier";
            tf.size = 12;
            tf.leading = 0;
            _textArea.setNewTextFormat(tf);
            _textArea.text = _text;
        }

        public static const _PADDING:int = 5;
    }
}
