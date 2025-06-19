package {
    import flash.text.StyleSheet;
    public class ExternalData {
        private var _jama:Object;
        private var _loaded:Boolean = false;
        private var _helpStyle:StyleSheet = null;
        private var _helpSections:Hash = new Hash();
        private var _xml:XML = new XML();
        public function ExternalData(main:Object) {
            _jama = main;
            _xml.ignoreWhitespace = true;
        }
        public function load():void {
            var self:ExternalData = this;
            _xml.onLoad = function(success:Boolean):void { self._onDataLoaded(success); };
            _xml.load(Consts.DATA_LOCATION);
        }
        public function isReady():Boolean { return _loaded; }
        public function isLoaded():Boolean { return _loaded; }
        public function getHelpStyle():StyleSheet { return _helpStyle; }
        public function getHelpSection(key:String):* { return _helpSections.get(key); }
        private function _onDataLoaded(success:Boolean):void {
            _loaded = true;
            if (!success) {
                var dial:gui.dialog.ErrorDialog = new gui.dialog.ErrorDialog(_jama.newLayer());
                dial.setText(Consts.LOAD_DATA_FAILED);
                dial.draw();
                _jama.exit();
                return;
            }
            var cur:XML = _xml.firstChild.firstChild;
            while (cur != null) {
                switch (cur.nodeName) {
                    case "stylesheet":
                        _newStyleSheet(cur);
                        break;
                    case "section":
                        _newHelpSection(cur);
                        break;
                }
                cur = cur.nextSibling;
            }
        }
        private function _newStyleSheet(xml:XML):void {
            _helpStyle = new StyleSheet();
            _helpStyle.parseCSS(xml.firstChild.nodeValue);
        }
        private function _newHelpSection(xml:XML):void {
            _helpSections.set(xml.get("name"), yota.XmlToHtml.process(xml));
        }
    }
}
