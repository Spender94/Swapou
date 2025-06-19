package {
    public class Hash {
        private var _items:Object = {};
        public function Hash() {}
        public function get(key:*):* { return _items[key]; }
        public function set(key:*, value:*):void { _items[key] = value; }
    }
}
