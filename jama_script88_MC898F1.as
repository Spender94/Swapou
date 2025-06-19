//----------------------------------------------------------------------
//Symbol 898 MovieClip [code] Frame 1
//----------------------------------------------------------------------
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelsPane = function (parent) {
        this._parent = parent;
        this._layer = yota.McTop.create(parent);
        this._layer._y = 50;
        this._levels = new Array();
    };
    editlist.LevelsPane.prototype.addLevel = function (lvl) {
        var _local_3 = this._createLevelLine(lvl);
        _local_3.getMovieClip()._y = (this._levels.length - 1) * _local_3.getMovieClip()._height;
        this._levels.push(_local_3);
    };
    editlist.LevelsPane.prototype.clear = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._levels.length ; _local_2++) {
            this._levels[_local_2].getMovieClip().removeMovieClip();
        }
        this._levels = new Array();
    };
    editlist.LevelsPane.prototype._createLevelLine = function (level) {
        var _local_3 = new editlist.LevelSlot(this._layer, level);
        _local_3.onSelected = Std.callback(this, "onSlotSelected");
        return(_local_3);
    };
    Element = function (copy) {
        if (copy != null) {
            this.id = copy.id;
            this.pos = copy.pos.clone();
            this.param = copy.param;
            this.orientation = copy.orientation;
        } else {
            this.id = -1;
            this.pos = new Coord(0, 0);
            this.param = -1;
            this.orientation = 0;
        }
    };
    Element.init = function () {
        Element._register(Element.EXIT, "Exit", "Sortie", true);
        Element._register(Element.HERO, "Hero", "Hero", true);
        Element._register(Element.FRUIT, "Fruit", "Fruit", true);
        Element._register(Element.BOX, "Box", "Caisse", true);
        Element._register(Element.WALL, "Wall", "Mur", true);
        Element._register(Element.WATER, "Water", "Eau", true);
        Element._register(Element.BRIDGE, "Bridge", "Pont foutu", true);
        Element._register(Element.PEEBLE, "Peeble", "Cailloux", true);
        Element._register(Element.RUNE, "Rune", "Rune", true);
        Element._register(Element.ONE_WAY, "OneWay", "Voie unique", true);
        Element._register(Element.ONE_WAY_STRICT, "OneWayStrict", "Voie unique stricte", true);
        Element._register(Element.MAGNET, "Magnet", "Aimant", true);
        Element._register(Element.GMAGNET, "GoldMagnet", "Aimant en or", true);
        Element._register(Element.BOMB, "Bomb", "BoBombe", true);
        Element._register(Element.LOUKI, "Louki", "Louki", true);
        Element._register(Element.KOHL, "Kohl", "Kohl", true);
        Element._register(Element.WINKLE, "Winkle", "Winkle", true);
        Element._register(Element.ARCHER, "Archer", "Electrificator", true);
        Element._register(Element.SPIDER, "Spider", "Araignée", true);
        Element._register(Element.LURKER, "Lurker", "Lurker", true);
        Element._register(Element.PIN, "Pin", "Interrupteur", false);
        Element._register(Element.GHOST, "Ghost", "Fantome", false);
        Element._register(Element.JADE, "Jade", "Jade", true);
        Element._register(Element.EYE, "Eye", "Zoeil", true);
    };
    Element.prototype.toString = function () {
        if (this.id == Element.NONE) {
            return("None");
        }
        return(Element._NAMES[this.id]);
    };
    Element.prototype.setOrientation = function (orientation) {
        this.orientation = orientation;
    };
    Element.nameOf = function (id) {
        return(Element._NAMES[id]);
    };
    Element.titleOf = function (id) {
        return(Element._TITLES[id]);
    };
    Element.idOf = function (name) {
        var _local_3 = 0;
        for ( ; _local_3 < Element._NAMES.length ; _local_3++) {
            if (Element._NAMES[_local_3] == name) {
                return(_local_3);
            }
        }
        if (name == Element._NAMES[Element.NONE]) {
            return(Element.NONE);
        }
        if (name == Element._NAMES[Element.GHOST]) {
            return(Element.GHOST);
        }
        return(-999);
    };
    Element._register = function (id, linkName, title, inEditor) {
        Element._NAMES[id] = linkName;
        Element._TITLES[id] = title;
        if (inEditor) {
            editor.SpriteOrder.IDS.push(id);
        }
    };
    Element.GHOST = -2;
    Element.NONE = -1;
    Element.EXIT = 0;
    Element.HERO = 1;
    Element.BOX = 2;
    Element.FRUIT = 3;
    Element.PIN = 4;
    Element.ARCHER = 5;
    Element.SPIDER = 6;
    Element.WATER = 7;
    Element.WALL = 8;
    Element.MAGNET = 9;
    Element.GMAGNET = 10;
    Element.ONE_WAY = 11;
    Element.BOMB = 12;
    Element.WINKLE = 13;
    Element.PEEBLE = 14;
    Element.RUNE = 15;
    Element.KOHL = 16;
    Element.LOUKI = 17;
    Element.LURKER = 18;
    Element.JADE = 19;
    Element.ONE_WAY_STRICT = 20;
    Element.EYE = 21;
    Element.BRIDGE = 22;
    Element._NAMES = [];
    Element._TITLES = [];
    Sprite = function (data) {
        super(data);
        this.attractedByMagnet = false;
        this.isMoving = false;
        this.below = false;
        this.alive = true;
        this.isMagnet = false;
        this.isBadGuy = false;
    };
    Sprite.prototype.__proto__ = Element.prototype;
    Sprite.prototype.__constructor__ = Element;
    Sprite.create = function (parent, data) {
        var _local_4 = null;
        switch (data.id) {
            case Element.HERO : 
                _local_4 = new sprite.Hero(data);
                break;
            case Element.BOX : 
                _local_4 = new sprite.Box(data);
                break;
            case Element.ARCHER : 
                _local_4 = new sprite.Archer(data);
                break;
            case Element.BOMB : 
                _local_4 = new sprite.Bomb(data);
                break;
            case Element.FRUIT : 
                _local_4 = new sprite.Fruit(data);
                break;
            case Element.LURKER : 
                _local_4 = new sprite.Lurker(data);
                break;
            case Element.MAGNET : 
                _local_4 = new sprite.Magnet(data);
                break;
            case Element.GMAGNET : 
                _local_4 = new sprite.GoldMagnet(data);
                break;
            case Element.PEEBLE : 
                _local_4 = new sprite.Peeble(data);
                break;
            case Element.RUNE : 
                _local_4 = new sprite.Rune(data);
                break;
            case Element.SPIDER : 
                _local_4 = new sprite.Spider(data);
                break;
            case Element.WALL : 
                _local_4 = new sprite.Wall(data);
                break;
            case Element.WATER : 
                _local_4 = new sprite.Water(data);
                break;
            case Element.WINKLE : 
                _local_4 = new sprite.Winkle(data);
                break;
            case Element.KOHL : 
                _local_4 = new sprite.Kohl(data);
                break;
            case Element.LOUKI : 
                _local_4 = new sprite.Louki(data);
                break;
            case Element.EXIT : 
                _local_4 = new sprite.Exit(data);
                break;
            case Element.GHOST : 
                _local_4 = new sprite.Ghost(data);
                break;
            case Element.ONE_WAY : 
                _local_4 = new sprite.OneWay(data);
                break;
            case Element.JADE : 
                _local_4 = new sprite.Jade(data);
                break;
            case Element.ONE_WAY_STRICT : 
                _local_4 = new sprite.OneWayStrict(data);
                break;
            case Element.EYE : 
                _local_4 = new sprite.Eye(data);
                break;
            case Element.BRIDGE : 
                _local_4 = new sprite.Bridge(data);
                break;
            default : 
                return(null);
        }
        _local_4.mc = Sprite._createJamaMC(parent, _local_4.id);
        _local_4.subMc = _local_4.mc.j;
        return(_local_4);
    };
    Sprite.prototype.setPlayground = function (aGamePlayground) {
        this.playground = aGamePlayground;
        this.board = aGamePlayground.getBoard();
    };
    Sprite.prototype.destroy = function () {
        this.alive = false;
        this.mc.removeMovieClip();
        this.playground.spriteDestroyed(this);
    };
    Sprite.prototype.show = function () {
    };
    Sprite.prototype.redraw = function () {
    };
    Sprite.prototype.showEditor = function () {
        this.show();
    };
    Sprite.prototype.canBeCrossed = function (sprite, d) {
        return(false);
    };
    Sprite.prototype.crossed = function (sprite, d) {
    };
    Sprite.prototype.canLeave = function (sprite, d) {
        return(true);
    };
    Sprite.prototype.canMove = function (d) {
        return(false);
    };
    Sprite.prototype.move = function (d) {
    };
    Sprite.prototype.canBePushed = function (sprite) {
        return(false);
    };
    Sprite.prototype.equals = function (s) {
        return(((s.id == this.id) && (this.pos.equals(s.pos))) && (this.mc.getDepth() == s.mc.getDepth()));
    };
    Sprite.prototype.update = function (onmove) {
    };
    Sprite.prototype.isAvatar = function () {
        return(this.IS_AVATAR);
    };
    Sprite.prototype.requiresParameter = function () {
        return(false);
    };
    Sprite.prototype.setParameter = function (p) {
        this.param = p;
        return(this.param);
    };
    Sprite.prototype.defaultParameter = function () {
        return(-1);
    };
    Sprite._createJamaMC = function (parent, id) {
        if (id == Element.GHOST) {
            id = Element.HERO;
        }
        var _local_4 = "jama_" + Element.nameOf(id);
        var _local_5 = yota.McTop.attach(parent, _local_4);
        if (_local_5 == null) {
            Jama.debug(("Error: Unable to find '" + _local_4) + "' linkage", "Sprite", "src/Sprite.mt", 199);
        }
        return(_local_5);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Exit = function (data) {
        super(data);
        this.below = true;
        this._opened = false;
    };
    sprite.Exit.prototype.__proto__ = Sprite.prototype;
    sprite.Exit.prototype.__constructor__ = Sprite;
    sprite.Exit.prototype.isClosed = function () {
        return(!this._opened);
    };
    sprite.Exit.prototype.show = function () {
        this.setOrientation(this.orientation);
        this.mc.stop();
    };
    sprite.Exit.prototype.setOrientation = function (d) {
        switch (d) {
            case Direction.WEST : 
                this.mc.gotoAndStop("West");
                break;
            case Direction.EAST : 
                this.mc.gotoAndStop("East");
                break;
            case Direction.NORTH : 
                this.mc.gotoAndStop("North");
                break;
            case Direction.SOUTH : 
                this.mc.gotoAndStop("South");
                break;
        }
        this.orientation = d;
    };
    sprite.Exit.prototype.open = function () {
        if (this._opened) {
            return(undefined);
        }
        if (this.board.getOver(this.pos).id != Element.NONE) {
            this._openDelayed = true;
            return(undefined);
        }
        this._opened = true;
        this._openDelayed = false;
        this.mc.swapDepths(this.mc.getDepth() + 1);
        var _local_2 = Std.attachMC(this.mc._parent, "jama_Exit", this.mc.getDepth() - 1);
        _local_2.stop();
        _local_2._x = this.mc._x;
        _local_2._y = this.mc._y;
        this._hole = _local_2;
        var _local_3 = new anim.OpenExitAnim(this);
        this.playground.getAnimManager().pushEffect(_local_3);
    };
    sprite.Exit.prototype.swapLayer = function () {
        this.board.swapLayer(this, gui.Board.OVER);
        if (this.orientation != Direction.NORTH) {
            this.mc.swapDepths(this.mc.getDepth() + 1);
        } else {
            this.mc.swapDepths(this.mc.getDepth() - 1);
        }
    };
    sprite.Exit.prototype.canBeCrossed = function (sprite, d) {
        if (this._opened) {
            return((sprite.id == Element.HERO) && (d != Direction.oposite(this.orientation)));
        }
        return(true);
    };
    sprite.Exit.prototype.crossed = function (sprite, d) {
        if (this._opened && (sprite.id == Element.HERO)) {
            this.playground.victory(this);
        }
    };
    sprite.Exit.prototype.update = function (onmove) {
        if (this._openDelayed) {
            this.open();
        }
    };
    sprite.Exit.prototype.fixDepthes = function () {
        var _local_2 = this.playground.getHero();
        switch (this.orientation) {
            case Direction.NORTH : 
                if (_local_2.mc.getDepth() < this.mc.getDepth()) {
                    _local_2.mc.swapDepths(this.mc.getDepth());
                }
                break;
            case Direction.SOUTH : 
                break;
            case Direction.EAST : 
                break;
            case Direction.WEST : 
                break;
        }
    };
    ExternalData = function (main) {
        this._jama = main;
        this._loaded = false;
        this._helpStyle = null;
        this._helpSections = new Hash();
        this._xml = new XML(null);
        this._xml.ignoreWhite = true;
    };
    ExternalData.prototype.load = function () {
        var self = this;
        this._xml.onLoad = function (success) {
            self._onDataLoaded(success);
        };
        this._xml.load(Consts.DATA_LOCATION);
    };
    ExternalData.prototype.isReady = function () {
        return(this._loaded);
    };
    ExternalData.prototype.isLoaded = function () {
        return(this._loaded);
    };
    ExternalData.prototype.getHelpStyle = function () {
        return(this._helpStyle);
    };
    ExternalData.prototype.getHelpSection = function (key) {
        return(this._helpSections.get(key));
    };
    ExternalData.prototype._onDataLoaded = function (success) {
        this._loaded = true;
        if (!success) {
            var _local_3 = new gui.dialog.ErrorDialog(this._jama.newLayer());
            _local_3.setText(Consts.LOAD_DATA_FAILED);
            _local_3.draw();
            this._jama.exit();
            return(undefined);
        }
        var _local_4 = this._xml.firstChild.firstChild;
        while (_local_4 != null) {
            switch (_local_4.nodeName) {
                case "stylesheet" : 
                    this._newStyleSheet(_local_4);
                    break;
                case "section" : 
                    this._newHelpSection(_local_4);
                    break;
            }
            _local_4 = _local_4.nextSibling;
        }
    };
    ExternalData.prototype._newStyleSheet = function (xml) {
        this._helpStyle = new StyleSheet();
        this._helpStyle.parseCSS(xml.firstChild.nodeValue);
    };
    ExternalData.prototype._newHelpSection = function (xml) {
        this._helpSections.set(xml.get("name"), yota.XmlToHtml.process(xml));
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.dialog) {
        gui.dialog = new Object();
    }
    gui.dialog.ErrorDialog = function (parent) {
        this._mc = yota.McTop.create(parent);
    };
    gui.dialog.ErrorDialog.prototype.setText = function (str) {
        this._text = str;
    };
    gui.dialog.ErrorDialog.prototype.draw = function () {
        var _local_2 = 300;
        var _local_3 = 300;
        this._mc.beginFill(Consts.BROWN, 100);
        this._mc.lineStyle(2, Consts.LIGHT_BROWN, 100);
        this._mc.moveTo(0, 0);
        this._mc.lineTo(_local_3, 0);
        this._mc.lineTo(_local_3, _local_2);
        this._mc.lineTo(0, _local_2);
        this._mc.lineTo(0, 0);
        this._mc.endFill();
        this._mc._x = (Consts.WIDTH - _local_3) / 2;
        this._mc._y = (Consts.HEIGHT - _local_2) / 2;
        var _local_4 = yota.McTop.create(this._mc);
        _local_4.lineStyle(2, Consts.BLACK_BROWN, 100);
        _local_4.moveTo(15, 35);
        _local_4.lineTo(_local_3 - 15, 35);
        _local_4.lineTo(_local_3 - 15, _local_2 - 15);
        _local_4.lineTo(15, _local_2 - 15);
        _local_4.lineTo(15, 35);
        this._titleArea = yota.McTop.createTextField(this._mc);
        this._titleArea.textWidth = _local_3 - 20;
        this._titleArea._x = 10;
        this._titleArea._y = 10;
        this._titleArea._width = _local_3 - 20;
        this._titleArea._height = 25;
        this._titleArea.textColor = Consts.BLACK_BROWN;
        var _local_5 = this._titleArea.getTextFormat();
        _local_5["color"] = Consts.BLACK_BROWN;
        _local_5.font = "Arial";
        _local_5.size = 20;
        _local_5.bold = true;
        this._titleArea.setNewTextFormat(_local_5);
        this._titleArea.text = Consts.ERR_DIAL_TITLE;
        this._contentArea = yota.McTop.createTextField(this._mc);
        this._contentArea.textWidth = _local_3 - 30;
        this._contentArea.textHeight = _local_2 - 50;
        this._contentArea._width = _local_3 - 30;
        this._contentArea._height = _local_2 - 50;
        this._contentArea._x = 15;
        this._contentArea._y = 45;
        this._contentArea.textColor = Consts.BLACK_BROWN;
        this._contentArea.multiline = true;
        this._contentArea.wordWrap = true;
        _local_5 = this._contentArea.getTextFormat();
        _local_5["color"] = Consts.BLACK_BROWN;
        _local_5.font = "Arial";
        _local_5.align = "center";
        _local_5.size = 16;
        _local_5.leftMargin = 5;
        _local_5.rightMargin = 5;
        this._contentArea.setNewTextFormat(_local_5);
        this._contentArea.text = this._text;
        var self = this;
        this._mc.onRelease = function () {
            self.onQuit();
        };
    };
    if (!yota) {
        yota = new Object();
    }
    yota.VersionField = function (mc, w, h, version) {
        this._width = w;
        this._height = h;
        this._text = version;
        this._createPane(mc);
        this._createTextArea();
    };
    yota.VersionField.prototype.destroy = function () {
        this._pane.removeMovieClip();
    };
    yota.VersionField.prototype._createPane = function (mc) {
        var _local_3 = 2001;
        this._pane = Std.createEmptyMC(mc, _local_3);
    };
    yota.VersionField.prototype._createTextArea = function () {
        var _local_2 = this._width;
        var _local_3 = this._height;
        this._textArea = Std.createTextField(this._pane, 2000);
        this._textArea.background = true;
        this._textArea.backgroundColor = 0;
        this._textArea._width = 40;
        this._textArea._x = (this._width / 2) - 20;
        var _local_4 = this._textArea.getTextFormat();
        _local_4["color"] = 15658751 /* 0xEEEEFF */;
        _local_4.bullet = false;
        _local_4.font = "courier";
        _local_4.size = 12;
        _local_4.leading = 0;
        this._textArea.setNewTextFormat(_local_4);
        this._textArea.text = this._text;
    };
    yota.VersionField._PADDING = 5;
    if (!editor) {
        editor = new Object();
    }
    editor.Editor = function (parent, state, level) {
        this._groundmode = false;
        this._cursor = null;
        this._editorState = state;
        this._layer = yota.McTop.create(parent);
        this._playground = new editor.Playground(this._layer, level.size);
        this._interface = new editor.Panel(state._jama, this, this._layer);
        this._interface.setTitle(level.title);
        this._key = new yota.Keyboard(yota.Keyboard.UP);
        this._playground.setLevel(level);
    };
    editor.Editor.prototype.isModified = function () {
        return(this._playground.isModified());
    };
    editor.Editor.prototype.setModified = function () {
        this._playground.setModified();
    };
    editor.Editor.prototype.saved = function () {
        this._playground.saved();
        if (this._cursor != null) {
            switch (this._cursor.type) {
                case editor.Editor.SPRITE_CURSOR : 
                    this._startSpriteCursor(this._cursor.getSprite().id, this._cursor.getSprite().orientation, this._cursor.getSprite().param);
                    break;
                case editor.Editor.DELETE_CURSOR : 
                    this._startDeleteCursor();
                    break;
                case editor.Editor.SELECT_CURSOR : 
                    this._startSelectCursor();
                    break;
            }
        }
    };
    editor.Editor.prototype.getState = function () {
        return(this._editorState);
    };
    editor.Editor.prototype.update = function (tmod) {
        this._processInputs();
        return(this._interface.update(tmod));
    };
    editor.Editor.prototype.getKeyboard = function () {
        return(this._key);
    };
    editor.Editor.prototype.destroy = function () {
        this._layer.removeMovieClip();
        this._key.destroy();
    };
    editor.Editor.prototype.getLayer = function () {
        return(this._layer);
    };
    editor.Editor.prototype.getData = function () {
        return(this._editorState.getJama().data());
    };
    editor.Editor.prototype.setLevel = function (level) {
        this._playground.setLevel(level);
    };
    editor.Editor.prototype.getLevel = function () {
        return(this._playground.toLevel());
    };
    editor.Editor.prototype._processInputs = function () {
        var _local_2 = this._key.next();
        if (_local_2 == Key.ESCAPE) {
            if (this._cursor != null) {
                this._cursor.hide();
            }
            Jama.delCursor(this._cursor);
            this._editorState.quitLevel();
            return(undefined);
        } else if (_local_2 == Key.SPACE) {
            this._groundmode = !this._groundmode;
            this._interface.toggleVisibility();
            if (!this._interface.isVisible()) {
                var _local_3 = this._interface.getSelectedSprite();
                this._startSpriteCursor(_local_3.id, _local_3.orientation, _local_3.param);
            } else {
                if (this._cursor != null) {
                    this._cursor.hide();
                }
                Jama.delCursor(this._cursor);
            }
        } else if (_local_2 == Key.DELETEKEY) {
            this._startDeleteCursor();
        } else if (_local_2 == Key.INSERT) {
            this._startSelectCursor();
        } else if (_local_2 == Key.END) {
            var _local_4 = this._interface.getSelectedSprite();
            this._startSpriteCursor(_local_4.id, _local_4.orientation, _local_4.param);
        } else if (this._interface.isVisible() && (this._interface.hasMouse())) {
            this._interface.handleKey(_local_2);
        } else if (this._cursor != null) {
            this._cursor.handleKey(_local_2);
        }
        if (this._interface.hasMouse()) {
            if (this._cursor != null) {
                this._cursor.hide();
            }
            Jama.delCursor(this._cursor);
        } else if (((this._cursor != null) && (!this._cursor.isVisible())) && (Jama.mouseInGame())) {
            this._cursor.show();
            Jama.setCursor(this._cursor);
        }
    };
    editor.Editor.prototype._startSelectCursor = function () {
        this._cursor = new editor.SelectCursor(this._layer);
        var cb = Std.callback(this, "_selectSprite");
        this._cursor.onRelease = function () {
            cb();
        };
    };
    editor.Editor.prototype._selectSprite = function () {
        var _local_2 = this._playground.getSpriteUnderCursor();
        if (_local_2 == null) {
            return(undefined);
        }
        this._playground.delSpriteUnderCursor();
        this._startSpriteCursor(_local_2.id, _local_2.orientation, _local_2.param);
        this._interface.setSelectedSprite(_local_2.id, _local_2.orientation, _local_2.param);
    };
    editor.Editor.prototype._startSpriteCursor = function (id, orientation, param) {
        var self = this;
        var cursor = (new editor.SpriteCursor(this._layer, id, orientation, param));
        cursor.onSpriteChange = function (s) {
            self._interface.setSelectedSprite(s.id, s.orientation, s.param);
        };
        this._cursor = cursor;
        var playground = this._playground;
        cursor.onRelease = function () {
            playground.addSprite(cursor.getSprite());
        };
    };
    editor.Editor.prototype._startDeleteCursor = function () {
        this._cursor = new editor.DeleteCursor(this._layer);
        var playground = this._playground;
        this._cursor.onRelease = function () {
            playground.delSpriteUnderCursor();
        };
    };
    editor.Editor.SPRITE_CURSOR = 1;
    editor.Editor.DELETE_CURSOR = 2;
    editor.Editor.SELECT_CURSOR = 3;
    if (!gui) {
        gui = new Object();
    }
    gui.Cursor = function () {
    };
    Dimension = function (w, h) {
        this.width = w;
        this.height = h;
    };
    Dimension.prototype.clone = function () {
        return(new Dimension(this.width, this.height));
    };
    Dimension.prototype.toString = function () {
        return((this.width + "x") + this.height);
    };
    if (!editor) {
        editor = new Object();
    }
    editor.Cursor = function (mc) {
        if (editor.Cursor.CURRENT != null) {
            editor.Cursor.CURRENT.destroy();
        }
        this._cursor = mc;
        this._cursor.startDrag();
        this._cursor._visible = false;
        this._cursor.onRelease = Std.callback(this, "_onRelease");
        editor.Cursor.CURRENT = this;
        Jama.setCursor(this);
    };
    editor.Cursor.prototype.handleKey = function (k) {
    };
    editor.Cursor.prototype.onRelease = function () {
    };
    editor.Cursor.prototype.hide = function () {
        this._cursor._visible = false;
        Mouse.show();
    };
    editor.Cursor.prototype.show = function () {
        this._cursor._visible = true;
        Mouse.hide();
    };
    editor.Cursor.prototype.isVisible = function () {
        return(this._cursor._visible);
    };
    editor.Cursor.prototype.destroy = function () {
        this._cursor.stopDrag();
        this._cursor.removeMovieClip();
        Mouse.show();
        if (editor.Cursor.CURRENT == this) {
            editor.Cursor.CURRENT = null;
        }
        Jama.delCursor(this);
    };
    editor.Cursor.prototype._onRelease = function () {
        this.onRelease();
    };
    editor.Cursor.CURRENT = null;
    if (!editor) {
        editor = new Object();
    }
    editor.SpriteCursor = function (parent, id, orientation, param) {
        this.type = editor.Editor.SPRITE_CURSOR;
        this._sprite = null;
        var _local_7 = yota.McTop.create(parent);
        _local_7.beginFill(Consts.BACKGROUND, 100);
        _local_7.moveTo(0, 0);
        _local_7.lineTo(Consts.SPRITE_WIDTH, 0);
        _local_7.lineTo(Consts.SPRITE_WIDTH, Consts.SPRITE_HEIGHT);
        _local_7.lineTo(0, Consts.SPRITE_HEIGHT);
        _local_7.lineTo(0, 0);
        _local_7.endFill();
        _local_7._x = parent._xmouse - 12;
        _local_7._y = parent._ymouse - 12;
        super(_local_7);
        this._drawSprite(id, orientation, param);
    };
    editor.SpriteCursor.prototype.__proto__ = editor.Cursor.prototype;
    editor.SpriteCursor.prototype.__constructor__ = editor.Cursor;
    editor.SpriteCursor.prototype._drawSprite = function (id, orientation, param) {
        if (this._sprite != null) {
            this._sprite.mc.removeMovieClip();
            this._sprite = null;
        }
        var _local_5 = new Element(null);
        _local_5.id = id;
        _local_5.param = param;
        _local_5.orientation = orientation;
        this._sprite = Sprite.create(this._cursor, _local_5);
        this._sprite.show();
        this._sprite.setOrientation(orientation);
        if (this._sprite.requiresParameter()) {
            if (param == -1) {
                this._sprite.setParameter(this._sprite.defaultParameter());
            } else {
                this._sprite.setParameter(param);
            }
        }
    };
    editor.SpriteCursor.prototype.handleKey = function (key) {
        switch (key) {
            case Key.UP : 
                if (this._sprite.requiresParameter()) {
                    this._sprite.setParameter(this._sprite.param + 1);
                } else {
                    this._sprite.setOrientation(Direction.NORTH);
                }
                break;
            case Key.DOWN : 
                if (this._sprite.requiresParameter()) {
                    this._sprite.setParameter(this._sprite.param - 1);
                } else {
                    this._sprite.setOrientation(Direction.SOUTH);
                }
                break;
            case Key.LEFT : 
                if (!this._sprite.requiresParameter()) {
                    this._sprite.setOrientation(Direction.WEST);
                }
                break;
            case Key.RIGHT : 
                if (!this._sprite.requiresParameter()) {
                    this._sprite.setOrientation(Direction.EAST);
                }
                break;
            case Key.PGUP : 
                var _local_3 = editor.SpriteOrder.nextId(this._sprite.id);
                if (_local_3 != this._sprite.id) {
                    this._drawSprite(_local_3, Direction.SOUTH, -1);
                }
                break;
            case Key.PGDN : 
                var _local_4 = editor.SpriteOrder.prevId(this._sprite.id);
                if (_local_4 != this._sprite.id) {
                    this._drawSprite(_local_4, Direction.SOUTH, -1);
                }
                break;
            default : 
                return(undefined);
        }
        this.onSpriteChange(this._sprite);
    };
    editor.SpriteCursor.prototype.getSprite = function () {
        return(this._sprite);
    };
    Direction = function () {
    };
    Direction.nameOf = function (direction) {
        if ((direction <= Direction.WEST) && (direction >= Direction.NORTH)) {
            return(Direction._Names[direction]);
        }
        return("UnknownDirection:" + direction);
    };
    Direction.oposite = function (d) {
        switch (d) {
            case Direction.NORTH : 
                return(Direction.SOUTH);
            case Direction.SOUTH : 
                return(Direction.NORTH);
            case Direction.WEST : 
                return(Direction.EAST);
            case Direction.EAST : 
                return(Direction.WEST);
        }
        return(-1);
    };
    Direction.next = function (d) {
        d++;
        if (d > 3) {
            d = 0;
        }
        return(d);
    };
    Direction.NORTH = 0;
    Direction.EAST = 1;
    Direction.SOUTH = 2;
    Direction.WEST = 3;
    Direction.NE = 4;
    Direction.NW = 5;
    Direction.SE = 6;
    Direction.SW = 7;
    Direction._Names = ["North", "East", "South", "West"];
    Anim = function () {
    };
    if (!anim) {
        anim = new Object();
    }
    anim.BridgeFallAnim = function (bridge) {
        this._bridge = bridge;
    };
    anim.BridgeFallAnim.prototype.update = function (tmod) {
        this._bridge.mc.gotoAndPlay("break");
        return(false);
    };
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelListController = function () {
    };
    State = function () {
    };
    if (!playlist) {
        playlist = new Object();
    }
    playlist.State = function (mainjama, clone) {
        this._jama = mainjama;
        this._layer = this._jama.newLayer();
        this._view = yota.McTop.create(this._layer);
        this._list = new playlist.PlayList(this._view);
        this._list.setListControl(this);
        this._list.onLevelPlayRequest = Std.callback(this, "_onPlayRequest");
        this._list.onSortRequest = Std.callback(this, "_onSortRequest");
        this._list.onSearchRequest = Std.callback(this, "_onSearchRequest");
        this._list.onLevelPropertiesRequest = Std.callback(this, "_onPropRequest");
        if (clone == null) {
            this._tabState = new playlist.TabState();
            this._tabState.mainState = true;
            this._tabState.title = "Niveaux";
            this._list.addTabState(this._tabState);
        } else {
            var _local_4 = clone._list.getStates();
            var _local_5 = 0;
            for ( ; _local_5 < _local_4.length ; _local_5++) {
                this._list.addTabState(_local_4[_local_5]);
            }
            this._list.setCurrentState(clone._list.getCurrentTabState());
            this._tabState = this._list.getCurrentTabState();
        }
        this._inputLock = false;
        this._updateLevelList();
    };
    playlist.State.prototype.update = function (tmod) {
        this._tabState = this._list.getCurrentTabState();
        this._list.update(tmod);
        if (this._orderPane == null) {
            if (Key.isDown(Key.ESCAPE)) {
                this._jama.setState(new menu.State(this._jama));
            }
        } else {
            this._orderPane.update(tmod);
        }
    };
    playlist.State.prototype.nextPage = function () {
        var _local_2 = (this._tabState.currentPage + 1) * playlist.State.MAX_LEVELS_PER_PAGE;
        if (_local_2 >= this._tabState.totalLevels) {
            return(undefined);
        }
        this._tabState.currentPage++;
        this._updateLevelList();
    };
    playlist.State.prototype.fastForward = function () {
        if (this._tabState.isAtEnd()) {
            return(undefined);
        }
        this._tabState.currentPage = this._tabState.currentPage + 10;
        if (this._tabState.currentPage >= this._tabState.totalPages) {
            this._tabState.currentPage = this._tabState.totalPages - 1;
        }
        this._updateLevelList();
    };
    playlist.State.prototype.previousPage = function () {
        if (this._tabState.currentPage == 0) {
            return(undefined);
        }
        this._tabState.currentPage--;
        this._updateLevelList();
    };
    playlist.State.prototype.fastRewind = function () {
        if (this._tabState.isAtBegin()) {
            return(undefined);
        }
        this._tabState.currentPage = this._tabState.currentPage - 10;
        if (this._tabState.currentPage < 0) {
            this._tabState.currentPage = 0;
        }
        this._updateLevelList();
    };
    playlist.State.prototype._onSortRequest = function () {
        this._orderPane = new playlist.OrderPane(this._layer);
        this._orderPane.onSubmit = Std.callback(this, "_orderPaneSubmit");
        this._orderPane.onCancel = Std.callback(this, "_orderPaneCancel");
        this._inputLock = true;
    };
    playlist.State.prototype._updateLevelList = function () {
        var self = this;
        var _local_2 = this._tabState.currentPage * playlist.State.MAX_LEVELS_PER_PAGE;
        var _local_3 = playlist.State.MAX_LEVELS_PER_PAGE;
        Jama.wait();
        var _local_4 = function (xml) {
            Jama.endWait();
            self._tabState.totalLevels = Std.parseInt(xml.get("c"), 10);
            var _local_3 = new Array();
            var _local_4 = xml.firstChild;
            while (_local_4 != null) {
                _local_3.push(LevelEntry.createFromXml(_local_4));
                _local_4 = _local_4.nextSibling;
            }
            self._tabState.levels = _local_3;
            self._list.setLevels(_local_3);
            self._tabState.totalPages = Math.ceil(self._tabState.totalLevels / playlist.State.MAX_LEVELS_PER_PAGE);
            self._list.setPaginate(self._tabState.currentPage + 1, self._tabState.totalPages);
        };
        if ((this._tabState.searchString != null) && (this._tabState.searchString != "")) {
            this._jama.network().searchLevels(this._tabState.searchString, _local_2, _local_3, _local_4);
        } else {
            this._jama.network().listLevels(_local_2, _local_3, _local_4);
        }
    };
    playlist.State.prototype._orderPaneSubmit = function () {
        this._orderPane.destroy();
        this._orderPane = null;
        var self = this;
        var _local_2 = function (xml) {
            self._updateLevelList();
        };
        this._jama.network().saveParameters(_local_2);
    };
    playlist.State.prototype._onSearchRequest = function (search) {
        if (search == null) {
            return(undefined);
        }
        if (search.length <= 0) {
            return(undefined);
        }
        var _local_3 = new playlist.TabState();
        _local_3.title = search;
        _local_3.searchString = search;
        this._tabState = _local_3;
        this._list.addTabState(_local_3);
        this._updateLevelList();
    };
    playlist.State.prototype._orderPaneCancel = function () {
        this._orderPane.destroy();
        this._orderPane = null;
    };
    playlist.State.prototype._onPlayRequest = function (entry) {
        Jama.wait();
        this._jama.network().getLevel(entry.id, Std.callback(this, "_onLevelReceived"));
    };
    playlist.State.prototype._onLevelReceived = function (xml) {
        Jama.endWait();
        var _local_3 = Level.createFromXml(xml);
        var _local_4 = new game.State(this._jama, _local_3);
        _local_4.setBackState(this);
        this._jama.setState(_local_4);
    };
    playlist.State.prototype._onPropRequest = function (entry) {
        if (entry.validated) {
            var _local_3 = new editlist.LevelInfo(this._layer, entry);
        }
    };
    playlist.State.MAX_LEVELS_PER_PAGE = 15;
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelInfo = function (root, level) {
        this._mc = yota.McTop.attach(root, "jama_gui_LevelInfo");
        this._mc.stop();
        this._mc.title = level.title;
        this._mc.author = level.author;
        this._mc["date"] = level["date"];
        this._mc.nbrPlays = level.nbrPlays;
        this._mc.nbrVictories = level.nbrVictories;
        this._mc.value = level.value;
        this._mc.onRelease = Std.callback(this, "destroy");
    };
    editlist.LevelInfo.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    if (!editor) {
        editor = new Object();
    }
    editor.SpriteOrder = function () {
    };
    editor.SpriteOrder.getIndex = function (id) {
        var _local_3 = 0;
        for ( ; _local_3 < editor.SpriteOrder.IDS.length ; _local_3++) {
            if (editor.SpriteOrder.IDS[_local_3] == id) {
                return(_local_3);
            }
        }
        return(-1);
    };
    editor.SpriteOrder.getId = function (idx) {
        return(editor.SpriteOrder.IDS[idx]);
    };
    editor.SpriteOrder.nextId = function (id) {
        var _local_3 = editor.SpriteOrder.getIndex(id);
        _local_3++;
        if (_local_3 >= editor.SpriteOrder.IDS.length) {
            return(id);
        }
        return(editor.SpriteOrder.IDS[_local_3]);
    };
    editor.SpriteOrder.prevId = function (id) {
        var _local_3 = editor.SpriteOrder.getIndex(id);
        _local_3--;
        if (_local_3 < 0) {
            return(id);
        }
        return(editor.SpriteOrder.IDS[_local_3]);
    };
    editor.SpriteOrder.nextIndex = function (idx) {
        idx++;
        if (idx >= editor.SpriteOrder.IDS.length) {
            return(editor.SpriteOrder.IDS.length - 1);
        }
        return(idx);
    };
    editor.SpriteOrder.prevIndex = function (idx) {
        idx--;
        if (idx < 0) {
            return(0);
        }
        return(idx);
    };
    editor.SpriteOrder.IDS = [];
    if (!adventure) {
        adventure = new Object();
    }
    adventure.Select = function (layer) {
        this._layer = yota.McTop.create(layer);
        yota.Mc.fillSquare(this._layer, Consts.BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
        yota.McTop.attach(this._layer, "jama_Menu_Glyph")._x = Consts.WIDTH;
        this._waves = yota.McTop.attach(this._layer, "jama_Menu_Bande");
        this._waves._x = 0;
        this._waves._y = 0;
        this._mc = yota.McTop.attach(this._layer, "jama_gui_AdventureSelect");
        this._mc._x = Consts.WIDTH / 2;
        this._mc._y = Consts.HEIGHT / 2;
        this._mc.prev.onRelease = Std.callback(this, "onNext");
        this._mc.next.onRelease = Std.callback(this, "onPrev");
        this._mc.btnPlay.onRelease = Std.callback(this, "onPlay");
        this._baseTextY = this._mc.title._y + (this._mc.title._height / 2);
        this.setTitle("prout");
        this.disablePrev();
        this.enableNext();
        this._mc.star1.gotoAndStop("available");
        this._mc.star2.gotoAndStop("available");
        this._mc.star3.gotoAndStop("available");
        this._mc.completed.gotoAndStop("yes");
    };
    adventure.Select.prototype.destroy = function () {
        this._layer.removeMovieClip();
    };
    adventure.Select.prototype.setJockers = function (t) {
        this._mc.star1.gotoAndStop("used");
        this._mc.star2.gotoAndStop("used");
        this._mc.star3.gotoAndStop("used");
        if (t > 0) {
            this._mc.star1.gotoAndStop("available");
        }
        if (t > 1) {
            this._mc.star2.gotoAndStop("available");
        }
        if (t > 2) {
            this._mc.star3.gotoAndStop("available");
        }
    };
    adventure.Select.prototype.setJockerUsed = function (b) {
        var _local_3 = ((!b) ? "yes" : "no");
        this._mc.completed.gotoAndStop(_local_3);
    };
    adventure.Select.prototype.update = function (tmod) {
        this._waves._y--;
        if (this._waves._y < -31) {
            this._waves._y = this._waves._y + 31;
        }
    };
    adventure.Select.prototype.setTitle = function (title) {
        var _local_3 = this._mc.title;
        _local_3.text = title;
        _local_3._y = this._baseTextY - (0.5 * _local_3.textHeight);
        this._mc.moveTo(0, _local_3._y);
        this._mc.lineTo(300, _local_3._y);
    };
    adventure.Select.prototype.disablePrev = function () {
        this._mc.prev.gotoAndStop("disabled");
        this._mc.prev._alpha = 50;
        this._mc.prev.onRelease = null;
    };
    adventure.Select.prototype.enablePrev = function () {
        this._mc.prev.gotoAndStop("enabled");
        this._mc.prev._alpha = 100;
        this._mc.prev.onRelease = Std.callback(this, "onPrev");
    };
    adventure.Select.prototype.disableNext = function () {
        this._mc.next.gotoAndStop("disabled");
        this._mc.next._alpha = 50;
        this._mc.next.onRelease = null;
    };
    adventure.Select.prototype.enableNext = function () {
        this._mc.next.gotoAndStop("enabled");
        this._mc.next._alpha = 100;
        this._mc.next.onRelease = Std.callback(this, "onNext");
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Water = function (data) {
        super(data);
        this.below = true;
        this._containsBox = false;
        this._watterBelow = false;
    };
    sprite.Water.prototype.__proto__ = Sprite.prototype;
    sprite.Water.prototype.__constructor__ = Sprite;
    sprite.Water.prototype.show = function () {
        var _local_2 = ["1", "5", "9", "13", "2", "6", "10", "14", "3", "7", "11", "15", "4", "8", "12", "16"];
        var _local_3 = sprite.Water.isWaterBased(this.board.getBelow(this.pos.next(Direction.NORTH)));
        var _local_4 = sprite.Water.isWaterBased(this.board.getBelow(this.pos.next(Direction.SOUTH)));
        var _local_5 = sprite.Water.isWaterBased(this.board.getBelow(this.pos.next(Direction.WEST)));
        var _local_6 = sprite.Water.isWaterBased(this.board.getBelow(this.pos.next(Direction.EAST)));
        var _local_7 = (_local_3 ? 1 : 0);
        _local_7 = _local_7 + (_local_6 ? 2 : 0);
        _local_7 = _local_7 + (_local_4 ? 4 : 0);
        _local_7 = _local_7 + (_local_5 ? 8 : 0);
        this.subMc.gotoAndStop(_local_2[_local_7]);
        this._watterBelow = _local_4;
    };
    sprite.Water.isWaterBased = function (s) {
        return((s.id == Element.WATER) || (s.id == Element.BRIDGE));
    };
    sprite.Water.prototype.hasWaterBelow = function () {
        return(this._watterBelow);
    };
    sprite.Water.prototype.isFilledWithBox = function () {
        return(this._containsBox);
    };
    sprite.Water.prototype.canBeCrossed = function (sprite, d) {
        if (sprite.id == Element.WINKLE) {
            return(true);
        }
        if (sprite.id == Element.BOX) {
            return(true);
        }
        if (this._containsBox) {
            return(true);
        }
        return(false);
    };
    sprite.Water.prototype.crossed = function (sprite, d) {
        if ((sprite.id == Element.BOX) && (!this._containsBox)) {
            this._fillWithBox(sprite);
        }
    };
    sprite.Water.prototype._fillWithBox = function (box) {
        var _local_3 = new anim.BoxFallInWaterAnim(this, box);
        this.playground.getAnimManager().pushEffect(_local_3);
        this._containsBox = true;
        box.setInWater(true);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Bridge = function (data) {
        super(data);
        this.below = true;
        this._broken = false;
        this._crossed = false;
    };
    sprite.Bridge.prototype.__proto__ = sprite.Water.prototype;
    sprite.Bridge.prototype.__constructor__ = sprite.Water;
    sprite.Bridge.prototype.show = function () {
        if (this._broken) {
            this.mc.gotoAndStop("2");
        }
        sprite_Water_show.call(this);
    };
    sprite.Bridge.prototype.isBroken = function () {
        return(this._broken);
    };
    sprite.Bridge.prototype.canBeCrossed = function (sprite, d) {
        if (this._broken) {
            return(sprite_Water_canBeCrossed.call(this, sprite, d));
        }
        return(true);
    };
    sprite.Bridge.prototype.crossed = function (sprite, d) {
        Jama.debug("bridge crossed by " + Element.nameOf(sprite.id), "sprite.Bridge", "src/sprite/Bridge.mt", 34);
        if (this._broken) {
            sprite_Water_crossed.call(this, sprite, d);
        }
        if (sprite.id == Element.HERO) {
            this._crossed = true;
        }
    };
    sprite.Bridge.prototype.update = function (onMove) {
        if (this._crossed && (!this._broken)) {
            if (this.board.get(this.pos) == this) {
                this._broken = true;
                this.playground.getAnimManager().push(this.fallAnim(), 0);
            }
        }
    };
    sprite.Bridge.prototype.fallAnim = function () {
        return(new anim.BridgeFallAnim(this));
    };
    sprite_Water_crossed = sprite.Water.prototype.crossed;
    sprite_Water_canBeCrossed = sprite.Water.prototype.canBeCrossed;
    sprite_Water_show = sprite.Water.prototype.show;
    Coord = function (xP, yP) {
        this.x = xP;
        this.y = yP;
    };
    Coord.prototype.clone = function () {
        return(new Coord(this.x, this.y));
    };
    Coord.prototype.next = function (direction) {
        switch (direction) {
            case Direction.NORTH : 
                return(new Coord(this.x, this.y - 1));
            case Direction.EAST : 
                return(new Coord(this.x + 1, this.y));
            case Direction.SOUTH : 
                return(new Coord(this.x, this.y + 1));
            case Direction.WEST : 
                return(new Coord(this.x - 1, this.y));
            case Direction.NE : 
                return(new Coord(this.x + 1, this.y - 1));
            case Direction.NW : 
                return(new Coord(this.x - 1, this.y - 1));
            case Direction.SE : 
                return(new Coord(this.x + 1, this.y + 1));
            case Direction.SW : 
                return(new Coord(this.x - 1, this.y + 1));
        }
        return(new Coord(-1, -1));
    };
    Coord.prototype.toString = function () {
        return(((("[" + this.x) + ":") + this.y) + "]");
    };
    Coord.prototype.equals = function (other) {
        return((this.x == other.x) && (this.y == other.y));
    };
    Coord.prototype.directionOf = function (other) {
        if (this.x == other.x) {
            if (this.y > other.y) {
                return(Direction.NORTH);
            }
            return(Direction.SOUTH);
        }
        if (this.x > other.x) {
            return(Direction.WEST);
        }
        return(Direction.EAST);
    };
    Coord.prototype.distanceOf = function (other) {
        if (this.x == other.x) {
            return(int(Math.abs(this.y - other.y)));
        }
        if (this.y == other.y) {
            return(int(Math.abs(this.x - other.x)));
        }
        return(-1);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Spider = function (data) {
        super(data);
        this.isBadGuy = true;
        this._inCocoon = true;
    };
    sprite.Spider.prototype.__proto__ = Sprite.prototype;
    sprite.Spider.prototype.__constructor__ = Sprite;
    sprite.Spider.prototype.show = function () {
        this.mc.stop();
    };
    sprite.Spider.prototype.setOrientation = function (d) {
        this.orientation = d;
        if (!this._inCocoon) {
            this.mc.gotoAndStop(Direction.nameOf(d));
            this.mc.s.gotoAndStop("1");
        }
    };
    sprite.Spider.prototype.update = function (onmove) {
        if (this._inCocoon) {
            if (this.playground.isExitOpen()) {
                this._leaveCocoon();
            } else {
                return(undefined);
            }
        }
        var _local_3 = Direction.NORTH;
        for ( ; _local_3 <= Direction.SOUTH ; _local_3++) {
            var _local_4 = this.pos.next(_local_3);
            var _local_5 = this.board.get(_local_4);
            if (_local_5.alive && (this._canKill(_local_5))) {
                this._kill(_local_5);
                return(undefined);
            }
        }
        var _local_6 = this._updateWithTarget(this.playground.getHero()) || (this._updateWithTarget(this.playground.getCurrentAvatar()));
    };
    sprite.Spider.prototype.canBePushed = function (s) {
        return((s.id == Element.HERO) && (this._inCocoon == true));
    };
    sprite.Spider.prototype.isInCocoon = function () {
        return(this._inCocoon);
    };
    sprite.Spider.prototype.canMove = function (d) {
        var _local_3 = this.pos.next(d);
        return(this.board.isValid(_local_3) && (this.board.get(_local_3).canBeCrossed(this, d)));
    };
    sprite.Spider.prototype.move = function (d) {
        var _local_3 = this.pos.next(d);
        var _local_4 = this.board.get(_local_3);
        _local_4.crossed(this, d);
        this.playground.move(this.pos, d, null);
    };
    sprite.Spider.prototype.beginMove = function () {
        if (!this._inCocoon) {
            this.mc.s.gotoAndPlay("1");
        }
    };
    sprite.Spider.prototype.endMove = function () {
        if (!this._inCocoon) {
            this.mc.s.gotoAndStop("1");
        }
    };
    sprite.Spider.prototype._canKill = function (target) {
        return(((target.id == Element.HERO) || (target.id == Element.LOUKI)) || (target.id == Element.KOHL));
    };
    sprite.Spider.prototype._updateWithTarget = function (target) {
        if (((target.pos.x == this.pos.x) || (target.pos.y == this.pos.y)) && (this._canKill(target))) {
            this._tryToKill(target);
            return(true);
        }
        return(false);
    };
    sprite.Spider.prototype._tryToKill = function (a) {
        var _local_3 = this.pos.directionOf(a.pos);
        this.setOrientation(_local_3);
        if (a.attractedByMagnet) {
            return(undefined);
        }
        var _local_4 = this.pos.clone();
        var _local_5 = this.pos.clone();
        var _local_6 = 0;
        do {
            _local_5 = _local_5.next(_local_3);
            var _local_7 = this.board.get(_local_5);
            if (!this.board.isValid(_local_5)) {
                return(undefined);
            }
            if (this._canKill(_local_7) && (_local_7.alive)) {
                if (_local_6 > 0) {
                    var _local_8 = this._createMovement(_local_4, _local_6);
                    this.playground.getAnimManager().pushEffect(_local_8);
                }
                this._kill(_local_7);
                return(undefined);
            } else if (_local_7.canBeCrossed(this, _local_3)) {
                _local_6++;
                _local_4 = _local_4.next(_local_3);
            } else {
                if (_local_6 > 0) {
                    var _local_9 = this._createMovement(_local_4, _local_6);
                    this.playground.getAnimManager().pushEffect(_local_9);
                }
                return(undefined);
            }
        } while  (true);
    };
    sprite.Spider.prototype._kill = function (a) {
        var _local_3 = new anim.FlashAnim(this.playground.getFXLayer());
        this.playground.getAnimManager().pushEffect(_local_3);
        a.die();
    };
    sprite.Spider.prototype._createMovement = function (dest, dist) {
        this.board.set(dest, this);
        var _local_4 = new anim.MoveAnim(this, this.playground.toGuiCoord(dest), 5 * dist);
        return(new anim.SpiderMove(this, _local_4));
    };
    sprite.Spider.prototype._leaveCocoon = function () {
        this._inCocoon = false;
        var _local_2 = new anim.OpenSpiderCocoonAnim(this);
        this.playground.getAnimManager().pushEffect(_local_2);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.AnimationController = function () {
        this._stack = new Array();
    };
    anim.AnimationController.prototype.update = function (tmod) {
        if (this._stack.length == 0) {
            return(false);
        }
        var _local_3 = this._stack[0];
        if (_local_3.update(tmod)) {
            return(true);
        } else {
            this._stack.shift();
        }
        return(this._stack.length > 0);
    };
    anim.AnimationController.prototype.push = function (anim) {
        this._stack.push(anim);
    };
    anim.AnimationController.prototype.isEmpty = function () {
        return(this._stack.length == 0);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.OpenExitAnim = function (exit) {
        this._exit = exit;
        this._anim = new anim.ManualAnim(this._exit.mc, this._exit.mc._currentframe, this._exit.mc._currentframe + 14);
    };
    anim.OpenExitAnim.prototype.update = function (tmod) {
        var _local_3 = this._anim.update(tmod);
        if (!_local_3) {
            this._exit.swapLayer();
        }
        return(_local_3);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.ManualAnim = function (mc, start, end) {
        this._mc = mc;
        this._started = false;
        this._step = start;
        this._end = end;
    };
    anim.ManualAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._mc.gotoAndStop(this._step);
            this._started = true;
            return(true);
        }
        this._step = this._step + tmod;
        if (this._step > this._end) {
            this._mc.gotoAndStop(this._end);
            return(false);
        }
        this._mc.gotoAndStop(Math.round(this._step));
        return(this._step < this._end);
    };
    if (!statlist) {
        statlist = new Object();
    }
    statlist.StatList = function (layer) {
        this._layer = layer;
    };
    statlist.StatList.prototype.setListControl = function (c) {
        this._controller = c;
    };
    statlist.StatList.prototype.update = function (tmod) {
    };
    statlist.StatList.prototype.destroy = function () {
        this._view.removeMovieClip();
        this._view = null;
    };
    statlist.StatList.prototype.draw = function () {
        var self = this;
        this._mc = yota.McTop.attach(this._layer, "jama_gui_list");
        this._mc.gotoAndStop("3");
        this._mc.butNext.onRelease = function () {
            self.onButtonActivated(statlist.StatList.BTN_NEXT);
        };
        this._mc.butPrev.onRelease = function () {
            self.onButtonActivated(statlist.StatList.BTN_PREV);
        };
        this._view = yota.McTop.create(this._layer);
        this._statsPane = new statlist.StatsPane(this._view);
        this._selectMode = new gui.component.Select(this._view);
        this._selectMode.getMovieClip()._y = Consts.HEIGHT - 20;
        this._selectMode.getMovieClip()._x = 8;
        this._selectMode.addItem("Joueurs");
        this._selectMode.addItem("Createurs");
        this._selectMode.addItem("Niveaux");
        this._selectMode.addItem("Mes niveaux");
        this._selectMode.draw();
        this._selectMode.onChanged = function (mode) {
            self._controller.changeMode(mode);
        };
    };
    statlist.StatList.prototype.setStats = function (page, totpages, list) {
        if (page == 0) {
            page = 1;
        }
        if (totpages == 0) {
            totpages = 1;
        }
        this._mc.fieldPage.text = (page + " / ") + totpages;
        this._statsPane.clear();
        var _local_5 = 0;
        for ( ; _local_5 < list.length ; _local_5++) {
            this._statsPane.addStat(list[_local_5]);
        }
    };
    statlist.StatList.prototype.onButtonActivated = function (id) {
        switch (id) {
            case statlist.StatList.BTN_NEXT : 
                if (Key.isDown(Key.CONTROL)) {
                    this._controller.fastForward();
                } else {
                    this._controller.nextPage();
                }
                break;
            case statlist.StatList.BTN_PREV : 
                if (Key.isDown(Key.CONTROL)) {
                    this._controller.fastRewind();
                } else {
                    this._controller.previousPage();
                }
                break;
        }
    };
    statlist.StatList.BTN_NEXT = 1;
    statlist.StatList.BTN_PREV = 2;
    if (!anim) {
        anim = new Object();
    }
    anim.ArcherShotAnim = function (archer, dest) {
        this._started = false;
        this._archer = archer;
        this._ox = archer.mc._x + 15;
        this._oy = archer.mc._y;
        this._tx = dest.x + 15;
        this._ty = dest.y + 15;
        this._x1 = this._ox;
        this._y1 = this._oy;
        this._x2 = this._tx;
        this._y2 = this._ty;
        if (this._x2 < this._x1) {
            var _local_4 = this._x2;
            this._x2 = this._x1;
            this._x1 = _local_4;
        }
        if (this._y2 < this._y1) {
            var _local_5 = this._y2;
            this._y2 = this._y1;
            this._y1 = _local_5;
        }
        this._steps = 40;
        this._layer = yota.McTop.create(archer.playground.getLayer());
        this._layer._x = archer.playground._horizontalPadding();
        this._layer._y = archer.playground._verticalPadding();
    };
    anim.ArcherShotAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._archer.mc.gotoAndStop("3");
            this._started = true;
        }
        this._drawLines();
        this._steps = this._steps - tmod;
        var _local_3 = this._steps <= 0;
        if (_local_3) {
            this._layer.removeMovieClip();
            this._archer.mc.gotoAndStop("1");
        }
        return(!_local_3);
    };
    anim.ArcherShotAnim.prototype._drawLines = function () {
        var _local_2 = Math.abs(this._x2 - this._x1);
        var _local_3 = Math.abs(this._y2 - this._y1);
        var _local_4 = _local_2 / 4;
        var _local_5 = _local_3 / 4;
        this._layer.clear();
        this._drawLine(1, 16772846, 80, [{x:this._ox, y:this._oy}, {x:this._tx, y:this._ty}]);
        var _local_6 = 1;
        var _local_7 = new Array();
        _local_7.push({x:this._ox, y:this._oy});
        var _local_8 = 1;
        for ( ; _local_8 <= 3 ; _local_8++) {
            var _local_9 = (this._x2 - (_local_8 * _local_4)) + ((Math.random() * 10) * _local_6);
            var _local_10 = (this._y2 - (_local_8 * _local_5)) + ((Math.random() * 10) * _local_6);
            _local_7.push({x:_local_9, y:_local_10});
            _local_6 = 1 - _local_6;
        }
        _local_7.push({x:this._tx, y:this._ty});
        this._drawLine(2, 16755200, 70, _local_7);
        _local_7 = new Array();
        _local_7.push({x:this._ox, y:this._oy});
        var _local_11 = 1;
        for ( ; _local_11 <= 3 ; _local_11++) {
            var _local_12 = (this._x2 - (_local_11 * _local_4)) + ((Math.random() * 10) * _local_6);
            var _local_13 = (this._y2 - (_local_11 * _local_5)) + ((Math.random() * 10) * _local_6);
            _local_7.push({x:_local_12, y:_local_13});
            _local_6 = 1 - _local_6;
        }
        _local_7.push({x:this._tx, y:this._ty});
        this._drawLine(2, 16772608, 60, _local_7);
    };
    anim.ArcherShotAnim.prototype._drawLine = function (height, color, alpha, points) {
        this._layer.lineStyle(height, color, alpha);
        this._layer.moveTo(points[0].x, points[0].y);
        var _local_6 = 1;
        for ( ; _local_6 < points.length ; _local_6++) {
            this._layer.lineTo(points[_local_6].x, points[_local_6].y);
        }
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Avatar = function (data) {
        super(data);
        this.IS_AVATAR = true;
    };
    sprite.Avatar.prototype.__proto__ = Sprite.prototype;
    sprite.Avatar.prototype.__constructor__ = Sprite;
    sprite.Avatar.prototype.show = function () {
        this.mc.stop();
        this.setOrientation(Direction.SOUTH);
    };
    sprite.Avatar.prototype.setOrientation = function (d) {
        if (this.attractedByMagnet) {
            return(undefined);
        }
        this.orientation = d;
        this.subMc.gotoAndStop(String(d + 1));
    };
    sprite.Avatar.prototype.wakeUp = function () {
        this.playground.getAnimManager().pushEffect(new anim.AvatarWakeUpAnim(this, this.playground.getCurrentAvatar()));
    };
    sprite.Avatar.prototype.canMove = function (d) {
        var _local_3 = this.board.getBelow(this.pos);
        if (!_local_3.canLeave(this, d)) {
            return(false);
        }
        var _local_4 = this.board.get(this.pos.next(d));
        var _local_5 = this.board.getBelow(this.pos.next(d));
        if (!_local_5.canBeCrossed(this, d)) {
            return(false);
        }
        return(((_local_4.id == Element.NONE) || (_local_4.canBeCrossed(this, d))) || (_local_4.canBePushed(this) && (_local_4.canMove(d))));
    };
    sprite.Avatar.prototype.move = function (d) {
        var _local_3 = this.board.get(this.pos.next(d));
        var _local_4 = this.board.getBelow(this.pos.next(d));
        if (_local_3.canBeCrossed(this, d)) {
            _local_3.crossed(this, d);
            this.playground.move(this.pos, d, null);
            if (_local_3 != _local_4) {
                _local_4.crossed(this, d);
            }
            return(undefined);
        }
        if (_local_3.canBePushed(this) && (_local_3.canMove(d))) {
            _local_3.move(d);
            this.playground.move(this.pos, d, null);
            _local_4.crossed(this, d);
            return(undefined);
        }
    };
    Burnable = function () {
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Hero = function (data) {
        super(data);
        this._sleeping = false;
    };
    sprite.Hero.prototype.__proto__ = sprite.Avatar.prototype;
    sprite.Hero.prototype.__constructor__ = sprite.Avatar;
    sprite.Hero.prototype.createFlyAnim = function () {
        return(new anim.FlyAnim(this.mc.j));
    };
    sprite.Hero.prototype.victory = function () {
        this.subMc.gotoAndPlay("victory");
    };
    sprite.Hero.prototype.burn = function () {
        if (this._sleeping) {
            this.wakeUp();
        }
        var _local_2 = this.playground.getCurrentAvatar();
        if (((_local_2 != null) && (_local_2.id == Element.GHOST)) && (_local_2.alive)) {
            _local_2.mc._visible = false;
        }
        this.mc.gotoAndStop("burn");
        return(new anim.HeroBurn(this));
    };
    sprite.Hero.prototype.endBurn = function () {
        this.mc.stop();
        this.subMc.stop();
        this.failure();
    };
    sprite.Hero.prototype.die = function () {
        if (this._sleeping) {
            this.wakeUp();
        }
        this.alive = false;
        this.playground.getAnimManager().pushEffect(new anim.ManualAnim(this.subMc, 15, 24));
        this.playground.getAnimManager().pushEffect(new anim.ManualAnim(this.subMc, 15, 24));
        var _local_2 = Std.callback(this, "failure");
        this.playground.getAnimManager().pushEffect(new anim.CallbackAnim(_local_2));
    };
    sprite.Hero.prototype.canStartGhost = function () {
        var _local_2 = this.board.getBelow(this.pos);
        return(_local_2.id != Element.RUNE);
    };
    sprite.Hero.prototype.failure = function () {
        this.playground.defeat();
    };
    sprite.Hero.prototype.sleep = function () {
        this._sleeping = true;
        this.mc.gotoAndPlay("sleep");
    };
    sprite.Hero.prototype.wakeUp = function () {
        this._sleeping = false;
        this.mc.gotoAndStop("1");
        this.setOrientation(this.orientation);
    };
    if (!menu) {
        menu = new Object();
    }
    menu.Menu = function (layer) {
        this._layer = layer;
        this._items = new Array();
        this._layerTitle = null;
        this._layerGlyph = null;
        this._layerBande = null;
        this._drawBackground();
        this._drawWaves();
        this._drawGlyph();
        this._drawTitle();
        this._drawItems();
    };
    menu.Menu.prototype.update = function (tmod) {
        this._scrollBande(tmod);
        this._updateItems(tmod);
    };
    menu.Menu.prototype.getSelectedId = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._items.length ; _local_2++) {
            if (this._items[_local_2].isSelected()) {
                return(this._items[_local_2].getId());
            }
        }
        return(0);
    };
    menu.Menu.prototype._drawBackground = function () {
        var _local_2 = yota.McTop.create(this._layer);
        _local_2.beginFill(13220225, 100);
        _local_2.moveTo(0, 0);
        _local_2.lineTo(Consts.WIDTH * 1, 0);
        _local_2.lineTo(Consts.WIDTH * 1, Consts.HEIGHT * 1);
        _local_2.lineTo(0, Consts.HEIGHT * 1);
        _local_2.lineTo(0, 0);
        _local_2.endFill();
    };
    menu.Menu.prototype._drawWaves = function () {
        this._layerBande = yota.McTop.attach(this._layer, "jama_Menu_Bande");
        this._layerBande._x = 0;
        this._layerBande._y = 0;
    };
    menu.Menu.prototype._drawGlyph = function () {
        this._layerGlyph = yota.McTop.attach(this._layer, "jama_Menu_Glyph");
        this._layerGlyph._x = Consts.WIDTH;
        this._layerGlyph._y = 0;
    };
    menu.Menu.prototype._drawTitle = function () {
        this._layerTitle = yota.McTop.attach(this._layer, "jama_Menu_Title");
        this._layerTitle._x = Consts.WIDTH / 2;
        this._layerTitle._y = 82;
    };
    menu.Menu.prototype._drawItems = function () {
        var _local_2 = [1, 2, 4, 5, 6, 7];
        var _local_3 = 0;
        for ( ; _local_3 < _local_2.length ; _local_3++) {
            var _local_4 = new menu.MenuItem(this._layer, _local_2[_local_3], _local_3);
            this._items.push(_local_4);
        }
    };
    menu.Menu.prototype._scrollBande = function (tmod) {
        this._layerBande._y--;
        if (this._layerBande._y < -31) {
            this._layerBande._y = this._layerBande._y + 31;
        }
    };
    menu.Menu.prototype._updateItems = function (tmod) {
        var _local_3 = 0;
        for ( ; _local_3 < this._items.length ; _local_3++) {
            this._items[_local_3].update(tmod);
        }
    };
    menu.Menu.prototype._createItem = function (id) {
        var _local_3 = yota.McTop.attach(this._layer, "jama_Menu_ButtonBackground");
        _local_3.gotoAndStop(Std.toString(id));
        var _local_4 = yota.McTop.attach(_local_3, "jama_Menu_Button");
        _local_4.id = id;
        _local_4.text.gotoAndStop(id);
        return(_local_3);
    };
    if (!playlist) {
        playlist = new Object();
    }
    playlist.Tab = function (tabPane, state) {
        this.state = state;
        this._mc = yota.McTop.attach(tabPane, "jama_gui_Tab");
        this._mc.title.text = state.title;
        this._mc.onRelease = Std.callback(this, "_onActivate");
    };
    playlist.Tab.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    playlist.Tab.prototype._onActivate = function () {
        this.onActivate(this);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.FlyAnim = function (mc) {
        this._levitationHeight = 0;
        this._mc = mc;
    };
    anim.FlyAnim.prototype.update = function (tmod) {
        this._levitationHeight = this._levitationHeight + (tmod / 5);
        if (this._levitationHeight > 3.14) {
            this._levitationHeight = this._levitationHeight - 6.28;
        }
        this._mc._y = -1 + (Math.cos(this._levitationHeight) * 2);
        return(true);
    };
    if (!editor) {
        editor = new Object();
    }
    editor.Panel = function (j, editor, layer) {
        this._jama = j;
        this._editor = editor;
        this._helpScrollDirection = 0;
        this._spriteIndex = 0;
        this._help = false;
        this._mc = yota.McTop.create(layer);
        this._mode = editor.Panel.MINIMAL;
        this._backGround = yota.McTop.attach(this._mc, "jama_gui_LevelDesignBack");
        this._createTitleBar();
        this._createMenuBar();
        this._createSpriteBar();
        this._helpField = yota.McTop.createTextField(this._mc);
        this._helpField._x = 27;
        this._helpField._y = 185;
        this._helpField._width = 327;
        this._helpField._height = 153;
        this._helpField.multiline = true;
        this._helpField.wordWrap = true;
        this._helpField.html = true;
        this._helpField.htmlText = "";
        this._helpField.mouseWheelEnabled = true;
        this._mc.showSection = Std.callback(this, "requestHelpContent");
        var self = this;
        this._helpArrowUp = yota.McTop.attach(this._mc, "jama_gui_ScrollArrow");
        this._helpArrowUp._rotation = 90;
        this._helpArrowUp.onPress = function () {
            self.scroll(-1);
        };
        this._helpArrowUp.onRelease = function () {
            self.scroll(0);
        };
        this._helpArrowUp._x = 367;
        this._helpArrowUp._y = 200;
        this._helpArrowDw = yota.McTop.attach(this._mc, "jama_gui_ScrollArrow");
        this._helpArrowDw._rotation = 270;
        this._helpArrowDw.onPress = function () {
            self.scroll(1);
        };
        this._helpArrowDw.onRelease = function () {
            self.scroll(0);
        };
        this._helpArrowDw._x = 367;
        this._helpArrowDw._y = 329;
        this.changeMode(this._mode);
    };
    editor.Panel.prototype.setTitle = function (t) {
        var _local_3 = this._titleBar.levelTitle;
        _local_3.text = t;
        _local_3.selectable = false;
    };
    editor.Panel.prototype.toggleVisibility = function () {
        if ((this._mode == editor.Panel.FULL) || (this._mode == editor.Panel.MEDIUM)) {
            this.changeMode(editor.Panel.MINIMAL);
        } else if (this._help) {
            this.changeMode(editor.Panel.FULL);
        } else {
            this.changeMode(editor.Panel.MEDIUM);
        }
    };
    editor.Panel.prototype.isVisible = function () {
        return(this._mode != editor.Panel.MINIMAL);
    };
    editor.Panel.prototype.hasMouse = function () {
        return(this._titleBar._ymouse >= 0);
    };
    editor.Panel.prototype.changeMode = function (newMode) {
        this._mode = newMode;
        switch (this._mode) {
            case editor.Panel.MINIMAL : 
                this._backGround.gotoAndStop("1");
                this._menuBar._visible = false;
                this._spriteBar._visible = false;
                this._spritesPane._visible = false;
                this._helpField._visible = false;
                this._selection._visible = false;
                this._helpArrowUp._visible = false;
                this._helpArrowDw._visible = false;
                this._titleBar._y = 368;
                break;
            case editor.Panel.MEDIUM : 
                this._backGround.gotoAndStop("2");
                this._menuBar._visible = true;
                this._spriteBar._visible = true;
                this._spritesPane._visible = true;
                this._selection._visible = true;
                this._helpField._visible = false;
                this._helpArrowUp._visible = false;
                this._helpArrowDw._visible = false;
                this._titleBar._y = 269;
                this._menuBar._y = 285;
                this._spriteBar._y = 314;
                this._spritesPane._y = (this._spriteBar._y + (this._spriteBar._height / 2)) - 10;
                this._spritesMask._y = this._spriteBar._y + (this._spriteBar._height / 2);
                this._selection._x = this._spriteBar._x + (this._spriteBar._width / 2);
                this._selection._y = this._spriteBar._y + (this._spriteBar._height / 2);
                break;
            case editor.Panel.FULL : 
                this._backGround.gotoAndStop("3");
                this._menuBar._visible = true;
                this._spriteBar._visible = true;
                this._spritesPane._visible = true;
                this._selection._visible = true;
                this._helpField._visible = true;
                this._helpArrowUp._visible = true;
                this._helpArrowDw._visible = true;
                this._titleBar._y = 64;
                this._menuBar._y = 80;
                this._spriteBar._y = 106;
                this._helpField._y = 185;
                this._spritesPane._y = (this._spriteBar._y + (this._spriteBar._height / 2)) - 10;
                this._spritesMask._y = this._spriteBar._y + (this._spriteBar._height / 2);
                this._selection._x = this._spriteBar._x + (this._spriteBar._width / 2);
                this._selection._y = this._spriteBar._y + (this._spriteBar._height / 2);
                break;
        }
    };
    editor.Panel.prototype.update = function (tmod) {
        if (this._helpScrollDirection != 0) {
            this._helpField.scroll = this._helpField.scroll + this._helpScrollDirection;
            return(true);
        }
        return(false);
    };
    editor.Panel.prototype.handleKey = function (k) {
        switch (k) {
            case Key.PGDN : 
                this.scrollSpritesLeft();
                break;
            case Key.PGUP : 
                this.scrollSpritesRight();
                break;
        }
    };
    editor.Panel.prototype.getSelectedSprite = function () {
        return(this._sprites[this._spriteIndex]);
    };
    editor.Panel.prototype.scrollSpritesLeft = function () {
        if ((this._spriteIndex - 1) >= 0) {
            this._spriteIndex--;
            this._refreshSprites();
            this._updateHelp();
        }
    };
    editor.Panel.prototype.scrollSpritesRight = function () {
        if ((this._spriteIndex + 1) < this._sprites.length) {
            this._spriteIndex++;
            this._refreshSprites();
            this._updateHelp();
        }
    };
    editor.Panel.prototype.setSelectedSprite = function (id, orient, param) {
        var _local_5 = 0;
        for ( ; _local_5 < this._sprites.length ; _local_5++) {
            if (this._sprites[_local_5].id == id) {
                this._sprites[_local_5].setOrientation(orient);
                this._sprites[_local_5].setParameter(param);
                this._spriteIndex = _local_5;
                this._refreshSprites();
                this._updateHelp();
                return(undefined);
            }
        }
    };
    editor.Panel.prototype.turnSprite = function () {
        var _local_2 = this.getSelectedSprite();
        _local_2.setOrientation(Direction.next(_local_2.orientation));
        this.updateEditorSprite();
    };
    editor.Panel.prototype.cycleSprite = function () {
        var _local_2 = this.getSelectedSprite();
        _local_2.setParameter(_local_2.param + 1);
        this.updateEditorSprite();
    };
    editor.Panel.prototype.toggleHelp = function () {
        if (this._mode == editor.Panel.FULL) {
            this._help = false;
            this.changeMode(editor.Panel.MEDIUM);
        } else {
            this._help = true;
            this.changeMode(editor.Panel.FULL);
            this._updateHelp();
        }
    };
    editor.Panel.prototype._updateHelp = function () {
        if (this._mode == editor.Panel.FULL) {
            this._helpField.styleSheet = this._jama.data().getHelpStyle();
            this._helpField.htmlText = this._jama.data().getHelpSection(Element.nameOf(this.getSelectedSprite().id));
            this._helpField.scroll = 1;
        }
    };
    editor.Panel.prototype.scroll = function (d) {
        this._helpScrollDirection = d;
        this._helpField.scroll = this._helpField.scroll + d;
    };
    editor.Panel.prototype._createTitleBar = function () {
        this._titleBar = yota.McTop.attach(this._mc, "jama_gui_LevelDesign_TitleBar");
        var self = this;
        var _local_2 = this._titleBar;
        _local_2.butMode.onRelease = Std.callback(this, "toggleVisibility");
        _local_2.butFlag2.gotoAndStop(1);
        _local_2.butFlag2.onRelease = function () {
            var _local_2 = self.getSelectedSprite();
            self._editor._startSpriteCursor(_local_2.id, _local_2.orientation, _local_2.param);
        };
        _local_2.butFlag1.gotoAndStop(2);
        _local_2.butFlag1.onRelease = function () {
            self._editor._startSelectCursor();
        };
        _local_2.butFlag0.gotoAndStop(3);
        _local_2.butFlag0.onRelease = function () {
            self._editor._startDeleteCursor();
        };
    };
    editor.Panel.prototype._createMenuBar = function () {
        this._menuBar = yota.McTop.attach(this._mc, "jama_gui_LevelDesign_MenuBar");
        var _local_2 = this._editor.getState();
        var _local_3 = this._menuBar;
        _local_3.butSave.onRelease = Std.callback(_local_2, "saveLevel");
        _local_3.butSubmit.onRelease = Std.callback(_local_2, "validateLevel");
        _local_3.butTest.onRelease = Std.callback(_local_2, "testLevel");
        _local_3.butQuit.onRelease = Std.callback(_local_2, "quitLevel");
    };
    editor.Panel.prototype._createSpriteBar = function () {
        this._spriteBar = yota.McTop.attach(this._mc, "jama_gui_LevelDesign_SpriteBar");
        var _local_2 = this;
        var _local_3 = this._spriteBar;
        _local_3.butLeft.onRelease = Std.callback(this, "scrollSpritesLeft");
        _local_3.butRight.onRelease = Std.callback(this, "scrollSpritesRight");
        this._spritesPane = yota.McTop.create(this._mc);
        this._spritesPane._x = this._spriteBar._x;
        this._drawSprites();
        this._spritesMask = yota.McTop.attach(this._mc, "jama_gui_barMask");
        this._spritesMask._x = (5 + this._spriteBar._x) + (this._spriteBar._width / 2);
        this._spritesPane.setMask(this._spritesMask);
        this._selection = yota.McTop.attach(this._mc, "jama_gui_lens");
        this._selection.butTurn.onRelease = Std.callback(this, "turnSprite");
        this._selection.butCycle.onRelease = Std.callback(this, "cycleSprite");
        this._selection.butHelp.onRelease = Std.callback(this, "toggleHelp");
    };
    editor.Panel.prototype._drawSprites = function () {
        this._sprites = new Array();
        var _local_2 = 0;
        for ( ; _local_2 < editor.SpriteOrder.IDS.length ; _local_2++) {
            if (Jama.getPlayer().canUseItem(editor.SpriteOrder.IDS[_local_2]) || (Jama.DEBUG)) {
                this._sprites.push(this._createSprite(editor.SpriteOrder.IDS[_local_2]));
            }
        }
        this._refreshSprites();
    };
    editor.Panel.prototype._refreshSprites = function () {
        var _local_2 = this._spriteIndex - 3;
        var _local_3 = this._spriteIndex + 3;
        var _local_4 = 0;
        for ( ; _local_4 < this._sprites.length ; _local_4++) {
            this._sprites[_local_4].mc._x = -100;
        }
        var _local_5 = this._spriteBar._width / 7;
        var _local_6 = (_local_5 - Consts.SPRITE_WIDTH) / 2;
        var _local_7 = 0;
        var _local_8 = _local_2;
        for ( ; _local_8 <= _local_3 ; _local_8++) {
            if ((_local_8 >= 0) && (_local_8 < this._sprites.length)) {
                this._sprites[_local_8].mc._x = _local_6 + (_local_7 * _local_5);
            }
            _local_7++;
        }
        this.updateEditorSprite();
    };
    editor.Panel.prototype.updateEditorSprite = function () {
        var _local_2 = this.getSelectedSprite();
        this._editor._startSpriteCursor(_local_2.id, _local_2.orientation, _local_2.param);
    };
    editor.Panel.prototype._createSprite = function (id) {
        var _local_3 = new Element(null);
        _local_3.id = id;
        var _local_4 = Sprite.create(this._spritesPane, _local_3);
        _local_4.showEditor();
        return(_local_4);
    };
    editor.Panel.prototype.requestHelpContent = function (key) {
        this._helpField.styleSheet = this._jama.data().getHelpStyle();
        this._helpField.htmlText = this._jama.data().getHelpSection(key);
        this._helpField.scroll = 1;
    };
    editor.Panel.prototype.onMouseOut = function () {
        this.changeMode(editor.Panel.MINIMAL);
    };
    editor.Panel.MINIMAL = 1;
    editor.Panel.MEDIUM = 2;
    editor.Panel.FULL = 3;
    editor.Panel.CURSOR_SPRITE = 0;
    editor.Panel.CURSOR_SELECT = 1;
    editor.Panel.CURSOR_DELETE = 2;
    Consts = function () {
    };
    Consts.updateListOrderCompressed = function () {
        Consts.listOrderCompressed = "";
        var _local_2 = 0;
        for ( ; _local_2 < Consts.listOrder.length ; _local_2++) {
            Consts.listOrderCompressed = Consts.listOrderCompressed + Consts.listOrder[_local_2]["key"];
        }
    };
    Consts.orderName = function (k) {
        switch (k) {
            case "a" : 
                return("auteur");
            case "v" : 
                return("difficulté");
            case "t" : 
                return("titre");
            case "d" : 
                return("date");
            case "s" : 
                return("status");
        }
        return(null);
    };
    Consts.setParams = function (str) {
        var _local_3 = str.split(":");
        if (_local_3.length < 3) {
            return(undefined);
        }
        var _local_4 = _local_3.pop();
        var _local_5 = new Array();
        var _local_6 = 0;
        for ( ; _local_6 < _local_4.length ; _local_6++) {
            var _local_7 = _local_4.charAt(_local_6);
            _local_5.push({label:Consts.orderName(_local_7.toLowerCase()), key:_local_7});
        }
        Consts.listOrder = _local_5;
        Consts.updateListOrderCompressed();
        Consts.showBeginFade = _local_3[0] == "1";
        Consts.showVictoFade = _local_3[1] == "1";
        if (_local_3[2] != null) {
            Consts.showInfoEsc = _local_3[2] == "1";
        }
    };
    Consts.getParams = function () {
        var _local_2 = "";
        _local_2 = _local_2 + (Consts.showBeginFade ? 1 : 0);
        _local_2 = _local_2 + ":";
        _local_2 = _local_2 + (Consts.showVictoFade ? 1 : 0);
        _local_2 = _local_2 + ":";
        _local_2 = _local_2 + (Consts.showInfoEsc ? 1 : 0);
        _local_2 = _local_2 + ":";
        _local_2 = _local_2 + Consts.listOrderCompressed;
        return(_local_2);
    };
    Consts.ALLOW_MULTI_MAGNETS = true;
    Consts.DATA_LOCATION = "/xml/jama/data.xml";
    Consts.HEIGHT = 384;
    Consts.WIDTH = 384;
    Consts.SPRITE_HEIGHT = 32;
    Consts.SPRITE_WIDTH = 32;
    Consts.MAX_LEVEL_HEIGHT = 11;
    Consts.MAX_LEVEL_WIDTH = 12;
    Consts.BLACK_BROWN = 6442280 /* 0x624D28 */;
    Consts.DARK_BROWN = 12163430 /* 0xB99966 */;
    Consts.BROWN = 13220225 /* 0xC9B981 */;
    Consts.LIGHT_BROWN = 14338204 /* 0xDAC89C */;
    Consts.DARK_GREEN = 4227200 /* 0x408080 */;
    Consts.BACKGROUND = Consts.DARK_GREEN;
    Consts.COUNTER_COLOR = 16777215 /* 0xFFFFFF */;
    Consts.showBeginFade = true;
    Consts.showVictoFade = true;
    Consts.showTooltips = true;
    Consts.showInfoEsc = true;
    Consts.listOrder = [{label:"auteur", key:"A"}, {label:"valeur", key:"v"}, {label:"titre de niveau", key:"T"}, {label:"date", key:"d"}, {label:"status", key:"S"}];
    Consts.listOrderCompressed = "AvTdS";
    Consts.SUPPR_CONFIRM = "Supprimer le level ";
    Consts.ERR_DIAL_TITLE = "JamaJama erreur";
    Consts.IDENT_ERROR = "Erreur d'identification !";
    Consts.CONNECTION_FAILED = "Impossible de se connecter au serveur jama! Revenez vous plus tard.";
    Consts.LOAD_DATA_FAILED = "Impossible de trouver le fichier data! Revenez plus tard.";
    Consts.QUIT_EDITION = "Sauver avant de quitter ?";
    Consts.EMPTY_LEVEL_TITLE = "... vide ...";
    Consts.WITHOUT_TITLE = "sans nom";
    Consts.VALIDATE_WARNING = "Gagnez le niveau pour le valider, il sera alors jouable par les autres joueurs.";
    if (!state) {
        state = new Object();
    }
    state.Waiting = function (parent) {
        this._objects = new Array();
        this._layer = parent;
        var _local_3 = yota.McTop.create(this._layer);
        _local_3.beginFill(13220225, 100);
        _local_3.moveTo(0, 0);
        _local_3.lineTo(Consts.WIDTH * 1, 0);
        _local_3.lineTo(Consts.WIDTH * 1, Consts.HEIGHT * 1);
        _local_3.lineTo(0, Consts.HEIGHT * 1);
        _local_3.lineTo(0, 0);
        _local_3.endFill();
        var _local_4 = yota.McTop.attach(this._layer, "jama_Menu_Glyph");
        _local_4._x = Consts.WIDTH;
        _local_4._y = 0;
    };
    state.Waiting.prototype.waitFor = function (o) {
        this._objects.push(o);
    };
    state.Waiting.prototype.update = function (tmod) {
        var _local_3 = 0;
        for ( ; _local_3 < this._objects.length ; _local_3++) {
            if (!this._objects[_local_3].isReady()) {
                return(undefined);
            }
        }
        this.onReady();
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Archer = function (data) {
        super(data);
        this.isBadGuy = true;
    };
    sprite.Archer.prototype.__proto__ = Sprite.prototype;
    sprite.Archer.prototype.__constructor__ = Sprite;
    sprite.Archer.prototype.show = function () {
        this.mc.gotoAndStop("default");
        this.subMc.stop();
    };
    sprite.Archer.prototype.setOrientation = function (d) {
        this.orientation = d;
    };
    sprite.Archer.prototype.update = function (onmove) {
        var _local_3 = ((this._updateDirection(Direction.NORTH) || (this._updateDirection(Direction.EAST))) || (this._updateDirection(Direction.SOUTH))) || (this._updateDirection(Direction.WEST));
    };
    sprite.Archer.prototype.burn = function () {
        this.mc.counter = 2;
        this.mc.gotoAndPlay("burn");
        return(null);
    };
    sprite.Archer.prototype.endBurn = function () {
        this.alive = true;
        this.board.set(this.pos, this);
    };
    sprite.Archer.prototype._updateDirection = function (d) {
        var _local_3 = this.pos.next(d);
        while (this.board.isValid(_local_3)) {
            var _local_4 = this.board.get(_local_3);
            if (((_local_4.id == Element.HERO) || (_local_4.id == Element.LOUKI)) || (_local_4.id == Element.KOHL)) {
                this._shot(_local_4);
                return(true);
            } else if ((_local_4.id == Element.WINKLE) && (_local_4.isInWater())) {
            } else if (_local_4.below == false) {
                return(false);
            }
            _local_3 = _local_3.next(d);
        }
        return(false);
    };
    sprite.Archer.prototype._canKill = function (target) {
        if (((target.id != Element.HERO) && (target.id != Element.LOUKI)) && (target.id != Element.KOHL)) {
            return(false);
        }
        var _local_3 = this.pos.directionOf(target.pos);
        var _local_4 = this.pos.next(_local_3);
        while (!_local_4.equals(target.pos)) {
            var _local_5 = this.board.get(_local_4);
            if ((_local_5.id == Element.WINKLE) && (_local_5.isInWater())) {
            } else if (_local_5.below == false) {
                return(false);
            }
            _local_4 = _local_4.next(_local_3);
        }
        return(true);
    };
    sprite.Archer.prototype._updateWithTarget = function (target) {
        if (((target.pos.x == this.pos.x) || (target.pos.y == this.pos.y)) && (this._canKill(target))) {
            this._shot(target);
            return(false);
        }
        return(true);
    };
    sprite.Archer.prototype._shot = function (a) {
        if (!a.alive) {
            return(undefined);
        }
        var _local_3 = this.pos.distanceOf(a.pos);
        var _local_4 = new anim.ArcherShotAnim(this, this.playground.toGuiCoord(a.pos));
        var _local_5 = new anim.ParallelAnimations();
        _local_5.push(_local_4, 0);
        _local_5.push(new anim.BurnSprite(a), 0);
        this.playground.getAnimManager().pushEffect(_local_5);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Rune = function (data) {
        super(data);
        this.below = true;
    };
    sprite.Rune.prototype.__proto__ = Sprite.prototype;
    sprite.Rune.prototype.__constructor__ = Sprite;
    sprite.Rune.prototype.canBeCrossed = function (sprite, d) {
        return(sprite.id != Element.GHOST);
    };
    Escapeable = function () {
        this._escapeRequested = false;
    };
    Escapeable.prototype.checkEscape = function () {
        if (Key.isDown(Key.ESCAPE)) {
            this._escapeRequested = true;
            return(false);
        } else {
            return(this._escapeRequested);
        }
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.State = function (mainjama) {
        super();
        this._jama = mainjama;
        this._packs = new Array();
        this._packs.push(new adventure.TutorialPack());
        this.restored();
    };
    adventure.State.prototype.__proto__ = Escapeable.prototype;
    adventure.State.prototype.__constructor__ = Escapeable;
    adventure.State.prototype.getLevel = function () {
        var _local_2 = new Level();
        _local_2.parse(this._levels[this._index].content);
        return(_local_2);
    };
    adventure.State.prototype.getPack = function () {
        return(this._pack);
    };
    adventure.State.prototype.getPackId = function () {
        return(this._packId);
    };
    adventure.State.prototype.getLevelId = function () {
        return(this._index);
    };
    adventure.State.prototype.restored = function () {
        var _local_2 = this._index;
        this._layer = this._jama.newLayer();
        this._packSelect = new adventure.PackSelect(this._layer, this._packs);
        this._packSelect.onPackSelected = Std.callback(this, "_onPackSelected");
        if (this._pack != null) {
            this._onPackSelected(this._pack);
        }
        if (_local_2 != null) {
            this.setIndex(_local_2);
        }
    };
    adventure.State.prototype.update = function (tmod) {
        if (this.checkEscape()) {
            if (this._select == null) {
                this._jama.setState(new menu.State(this._jama));
            } else {
                this._jama.setState(new adventure.State(this._jama));
            }
            return(undefined);
        }
        if (this._select != null) {
            this._select.update(tmod);
        }
        if (this._packSelect != null) {
            this._packSelect.update(tmod);
        }
    };
    adventure.State.prototype._onPackSelected = function (pack) {
        this._packSelect.destroy();
        this._packId = -1;
        var _local_3 = 0;
        for ( ; _local_3 < this._packs.length ; _local_3++) {
            if (this._packs[_local_3] == pack) {
                this._packId = _local_3;
            }
        }
        if (this._packId == -1) {
            this._jama.setState(new menu.State(this._jama));
        }
        this._pack = pack;
        this._levels = this._pack.levels;
        var _local_4 = 0;
        for ( ; _local_4 < this._levels.length ; _local_4++) {
            if (Jama.getPlayer().adventureSave.hasCompletedLevel(this._packId, _local_4)) {
                this._levels[_local_4].completed = true;
            }
        }
        var _local_5 = -1;
        var _local_6 = 0;
        var _local_7 = 0;
        for ( ; _local_7 < this._levels.length ; _local_7++) {
            if (this._levels[_local_7].completed) {
                _local_6++;
                _local_5 = _local_7;
            }
        }
        this._lastCompleted = _local_5;
        var _local_8 = 3;
        if (_local_5 > -1) {
            _local_8 = 3 - (_local_5 - _local_6);
        }
        this._jokers = _local_8;
        this._index = 0;
        this._select = new adventure.Select(this._layer);
        this._select.disablePrev();
        this._select.enableNext();
        this._select.setTitle(this._levels[this._index].title);
        this._select.onPrev = Std.callback(this, "_previousLevel");
        this._select.onNext = Std.callback(this, "_nextLevel");
        this._select.onPlay = Std.callback(this, "_playLevel");
        this._select.setJockers(_local_8);
        this._select.setJockerUsed(!this._levels[this._index].completed);
    };
    adventure.State.prototype.setIndex = function (i) {
        if (i > this._levels.length) {
            i = this._levels.length - 1;
        }
        if (i < 0) {
            i = 0;
        }
        while ((i > this._index) && (this._jokers > 0)) {
            this._nextLevel();
        }
        while (i < this._index) {
            this._previousLevel();
        }
    };
    adventure.State.prototype._nextLevel = function () {
        this._index++;
        if (this._index >= this._levels.length) {
            this._index--;
            return(undefined);
        }
        if ((this._jokers - 1) < 0) {
            this._index--;
            return(undefined);
        }
        if (this._index > this._lastCompleted) {
            this._jokers--;
            this._select.setJockers(this._jokers);
        }
        this._updateLevels();
    };
    adventure.State.prototype._previousLevel = function () {
        this._index--;
        if (this._index < 0) {
            this._index++;
            return(undefined);
        }
        if ((this._index + 1) > this._lastCompleted) {
            this._jokers++;
            this._select.setJockers(this._jokers);
        }
        this._updateLevels();
    };
    adventure.State.prototype._updateLevels = function () {
        if ((this._index - 1) < 0) {
            this._select.disablePrev();
        } else {
            this._select.enablePrev();
        }
        if ((this._index + 1) >= this._levels.length) {
            this._select.disableNext();
        } else {
            this._select.enableNext();
        }
        this._select.setJockerUsed(!this._levels[this._index].completed);
        this._select.setTitle(this._levels[this._index].title);
    };
    adventure.State.prototype._playLevel = function () {
        this._jama.setState(new adventure.PlayState(this._jama, this));
    };
    if (!playlist) {
        playlist = new Object();
    }
    playlist.TabState = function () {
        this.totalLevels = 0;
        this.currentPage = 0;
        this.totalPages = 1;
        this.mainState = false;
        this.levels = new Array();
    };
    playlist.TabState.prototype.isAtBegin = function () {
        return((this.currentPage + 1) == 1);
    };
    playlist.TabState.prototype.isAtEnd = function () {
        return((this.currentPage + 1) == this.totalPages);
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.dialog) {
        gui.dialog = new Object();
    }
    gui.dialog.EscapeDialog = function (parent, j) {
        this._jama = j;
        this._layer = yota.McTop.create(parent);
        yota.Mc.fillSquare(this._layer, Consts.BLACK_BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
        this._mc = yota.McTop.attach(this._layer, "jama_gui_EscapeDialog");
        this._mc._x = Consts.WIDTH / 2;
        this._mc._y = Consts.HEIGHT / 2;
        this._mc.done.label = "Ok";
        this._mc.done.onRelease = Std.callback(this, "_onDone");
        var checkbox = this._mc.checkbox;
        checkbox.label = "ne plus montrer ce message";
        checkbox.stop();
        checkbox.btn.onRelease = function () {
            checkbox.gotoAndStop(String(3 - checkbox._currentframe));
        };
    };
    gui.dialog.EscapeDialog.prototype._onDone = function () {
        var _local_2 = this._mc.checkbox._currentframe == 2;
        if (_local_2) {
            Consts.showInfoEsc = false;
            Jama.wait();
            var self = this;
            this._jama.network().saveParameters(function (xml) {
                Jama.endWait();
                self.destroy();
                self.onClose();
            });
        } else {
            this.destroy();
            this.onClose();
        }
    };
    gui.dialog.EscapeDialog.prototype.destroy = function () {
        this._layer.removeMovieClip();
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Bomb = function (data) {
        super(data);
        this._touched = false;
        if (this.param == -1) {
            this.param = this.defaultParameter();
        }
        this._countDown = this.param;
        this.isBadGuy = true;
    };
    sprite.Bomb.prototype.__proto__ = Sprite.prototype;
    sprite.Bomb.prototype.__constructor__ = Sprite;
    sprite.Bomb.prototype.requiresParameter = function () {
        return(true);
    };
    sprite.Bomb.prototype.defaultParameter = function () {
        return(5);
    };
    sprite.Bomb.prototype.setParameter = function (p) {
        if ((p > 9) || (p <= 0)) {
            p = 1;
        }
        this.param = p;
        this._countDown = p;
        this._showCountDown();
        return(this._countDown);
    };
    sprite.Bomb.prototype.show = function () {
        this.mc.stop();
        this._counter = yota.McTop.attach(this.mc, "jama_fx_BombCounter");
        this._counter._x = 16;
        this._showCountDown();
    };
    sprite.Bomb.prototype.update = function (onmove) {
        if (onmove && (this._touched)) {
            this._countDown--;
            if (this._countDown <= 0) {
                this.explode();
            } else {
                this._showCountDown();
            }
        }
    };
    sprite.Bomb.prototype.touchByDeflagration = function () {
        this.alive = false;
        this.initDeflagration();
    };
    sprite.Bomb.prototype.canMove = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        if (!this.board.isValid(_local_4)) {
            return(false);
        }
        return(this.board.get(_local_4).canBeCrossed(_local_3, d));
    };
    sprite.Bomb.prototype.canBePushed = function (s) {
        return((s.id == Element.HERO) || (s.id == Element.WINKLE));
    };
    sprite.Bomb.prototype.move = function (d) {
        if (!this._touched) {
            this._touch();
        }
        this.playground.move(this.pos, d, null);
    };
    sprite.Bomb.prototype.burn = function () {
        return(null);
    };
    sprite.Bomb.prototype.endBurn = function () {
        this.destroy();
    };
    sprite.Bomb.prototype._touch = function () {
        this._touched = true;
        this._countDown = this.param;
        if (this._countDown <= 0) {
            this._countDown = 2;
        }
        this.mc.gotoAndPlay("2");
    };
    sprite.Bomb.prototype._showCountDown = function () {
        if (this._countDown > 0) {
            this._counter.gotoAndStop(String(this._countDown));
        }
    };
    sprite.Bomb.prototype.initDeflagration = function () {
        this.alive = false;
        this._chainedBombs = new Array();
        this._cursors = new Array();
        var _local_2 = Direction.NORTH;
        for ( ; _local_2 <= Direction.WEST ; _local_2++) {
            this._cursors.push(this.pos.clone());
        }
        this._progressing = true;
    };
    sprite.Bomb.prototype.nextDeflagrationStep = function (anims, delay) {
        if (!this._progressing) {
            return(false);
        }
        this._progressing = false;
        var _local_4 = new Array();
        if (this._cursors != null) {
            var _local_5 = Direction.NORTH;
            for ( ; _local_5 <= Direction.WEST ; _local_5++) {
                if (this._cursors[_local_5] != null) {
                    var _local_6 = this._cursors[_local_5].next(_local_5);
                    var _local_7 = (_local_6.y * 100) + _local_6.x;
                    if (sprite.Bomb._FLAMES[_local_7] == 1) {
                        this._cursors[_local_5] = null;
                    } else if ((_local_6 != null) && (this.board.isValid(_local_6))) {
                        var _local_8 = this.board.get(_local_6);
                        if ((((_local_8.id == Element.NONE) || (_local_8.id == Element.PEEBLE)) || (_local_8.id == Element.RUNE)) || ((_local_8.id == Element.WATER) && (_local_8.isFilledWithBox()))) {
                            this._progressing = true;
                            anims.push(this._createFlames(_local_6), delay);
                        } else if (_local_8.id == Element.GHOST) {
                            this._progressing = true;
                            anims.push(this._createFlames(_local_6), delay);
                            sprite.Bomb._FLAMES[_local_7] = 1;
                        } else if (_local_8.id == Element.BOMB) {
                            if (_local_8.alive) {
                                _local_8.alive = false;
                                _local_8.touchByDeflagration();
                                _local_4.push(_local_8);
                                anims.push(this._createFlames(_local_6), delay);
                                anims.push(this._burnSprite(_local_8), delay);
                                _local_8._burnBrigeBelow(anims);
                                sprite.Bomb._FLAMES[_local_7] = 1;
                            }
                            _local_6 = null;
                        } else if (_local_8.id == Element.BRIDGE) {
                            var _local_9 = _local_8;
                            if (!_local_9.isBroken()) {
                                this._progressing = true;
                                anims.push(this._createFlames(_local_6), delay);
                                anims.push(_local_9.fallAnim(), delay + 1);
                                _local_9._broken = true;
                                sprite.Bomb._FLAMES[_local_7] = 1;
                            } else {
                                _local_6 = null;
                            }
                        } else if (_local_8.burn != null) {
                            this._progressing = true;
                            if (_local_8.alive) {
                                _local_8.alive = false;
                                anims.push(this._createFlames(_local_6), delay);
                                anims.push(this._burnSprite(_local_8), delay);
                                _local_6 = null;
                            }
                        } else {
                            _local_6 = null;
                        }
                        this._cursors[_local_5] = _local_6;
                    }
                }
            }
        }
        if (!this._progressing) {
            this._cursors = null;
        }
        var _local_10 = 0;
        for ( ; _local_10 < this._chainedBombs.length ; _local_10++) {
            this._progressing = this._chainedBombs[_local_10].nextDeflagrationStep(anims, delay) || (this._progressing);
        }
        var _local_11 = 0;
        for ( ; _local_11 < _local_4.length ; _local_11++) {
            _local_4[_local_11].initDeflagration();
            this._chainedBombs.push(_local_4[_local_11]);
            this._progressing = true;
        }
        return(this._progressing);
    };
    sprite.Bomb.prototype.explode = function () {
        sprite.Bomb._FLAMES = new Array();
        this.initDeflagration();
        this._burnBomb();
        var _local_2 = 3;
        var _local_3 = new anim.ParallelAnimations();
        this._progressing = true;
        while (this._progressing) {
            this.nextDeflagrationStep(_local_3, _local_2);
            _local_2 = _local_2 + 3;
        }
        this.playground.getAnimManager().pushEffect(_local_3);
        var _local_4 = Std.callback(this.playground, "refresh");
        var _local_5 = new anim.CallbackAnim(_local_4);
        this.playground.getAnimManager().pushEffect(_local_5);
    };
    sprite.Bomb.prototype._createFlames = function (c) {
        var _local_3 = this.playground.getGround();
        var _local_4 = this.playground.toGuiCoord(c);
        return(new anim.BombFlames(_local_3, _local_4, this.board.getOverDepthFX(c)));
    };
    sprite.Bomb.prototype._burnSprite = function (s) {
        this.board.erase(s);
        return(new anim.BurnSprite(s));
    };
    sprite.Bomb.prototype._burnBomb = function () {
        var _local_2 = this.playground.getGround();
        var _local_3 = new anim.ParallelAnimations();
        _local_3.push(new anim.BombFlames(_local_2, this.playground.toGuiCoord(this.pos), this.board.getOverDepthFX(this.pos)), 0);
        _local_3.push(new anim.BurnSprite(this), 0);
        this.playground.getAnimManager().pushEffect(_local_3);
        this._burnBrigeBelow(_local_3);
    };
    sprite.Bomb.prototype._burnBrigeBelow = function (anims) {
        var _local_3 = this.board.getBelow(this.pos);
        if (_local_3.id == Element.BRIDGE) {
            var _local_4 = _local_3;
            _local_4._broken = true;
            anims.push(_local_4.fallAnim(), 1);
        }
    };
    if (!anim) {
        anim = new Object();
    }
    anim.SteppedAnim = function (animMC) {
        this._anim = animMC;
        this.reset();
    };
    anim.SteppedAnim.prototype.reset = function () {
        this._step = this._anim._currentframe;
        this._steps = this._anim._totalframes;
    };
    anim.SteppedAnim.prototype.update = function (tmod) {
        this._step = this._step + tmod;
        if (this._step > this._steps) {
            this._anim.gotoAndStop(this._steps);
            return(false);
        }
        this._anim.gotoAndStop(Math.round(this._step));
        return(this._step < this._steps);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.WinkleEnterWaterAnim = function (winkle) {
        super(winkle.subMc);
        this._winkle = winkle;
        this._started = false;
    };
    anim.WinkleEnterWaterAnim.prototype.__proto__ = anim.SteppedAnim.prototype;
    anim.WinkleEnterWaterAnim.prototype.__constructor__ = anim.SteppedAnim;
    anim.WinkleEnterWaterAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._winkle.mc.gotoAndStop("enterWater");
            this._anim.gotoAndStop("1");
            this.reset();
        }
        return(anim_SteppedAnim_update.call(this, tmod));
    };
    anim_SteppedAnim_update = anim.SteppedAnim.prototype.update;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Eye = function (data) {
        super(data);
        this.below = true;
        this.isBadGuy = true;
        this._opened = false;
    };
    sprite.Eye.prototype.__proto__ = Sprite.prototype;
    sprite.Eye.prototype.__constructor__ = Sprite;
    sprite.Eye.prototype.show = function () {
        if (this._opened) {
            this.mc.gotoAndStop("Open");
        } else {
            this.mc.gotoAndStop("Close");
        }
    };
    sprite.Eye.prototype.canBeCrossed = function (s, d) {
        return((s.id == Element.BOX) || (s.id == Element.HERO));
    };
    sprite.Eye.prototype.canMove = function (d) {
        var _local_3 = this.pos.next(d);
        return(this.board.isValid(_local_3) && (this.board.get(_local_3).canBeCrossed(this, d)));
    };
    sprite.Eye.prototype.move = function (d) {
        var _local_3 = this.pos.next(d);
        var _local_4 = this.board.get(_local_3);
        _local_4.crossed(this, d);
        this.playground.move(this.pos, d, null);
    };
    sprite.Eye.prototype.update = function (onMove) {
        if (this.board.getOver(this.pos).id == Element.BOX) {
            return(undefined);
        }
        var _local_3 = this.playground.getCurrentAvatar();
        if (_local_3.id != Element.GHOST) {
            if (this._opened) {
                this._opened = false;
                this.show();
            }
            return(undefined);
        }
        if (!this._opened) {
            this._opened = true;
            this.show();
        }
        if (this._tryToKill(_local_3, this.playground.getHero())) {
            return(undefined);
        }
        this._tryToKill(this.playground.getHero(), _local_3);
    };
    sprite.Eye.prototype._tryToKill = function (avatar, other) {
        var _local_4 = -1;
        if (avatar.pos.x == this.pos.x) {
            _local_4 = ((avatar.pos.y < this.pos.y) ? (Direction.NORTH) : (Direction.SOUTH));
        } else if (avatar.pos.y == this.pos.y) {
            _local_4 = ((avatar.pos.x < this.pos.x) ? (Direction.WEST) : (Direction.EAST));
        } else {
            return(false);
        }
        var _local_5 = this.pos.next(_local_4);
        while (this.board.isValid(_local_5)) {
            var _local_6 = this.board.get(_local_5);
            if (_local_6 == avatar) {
                this._shot(avatar, other);
                return(true);
            } else if (_local_6.below) {
            } else {
                return(false);
            }
            _local_5 = _local_5.next(_local_4);
        }
        return(false);
    };
    sprite.Eye.prototype._shot = function (a, b) {
        if (!a.alive) {
            return(undefined);
        }
        a.alive = false;
        b.alive = false;
        var _local_4 = this.pos.distanceOf(a.pos);
        var _local_5 = new anim.EyeShotAnim(this, this.playground.toGuiCoord(a.pos));
        var _local_6 = new anim.ParallelAnimations();
        _local_6.push(_local_5, 0);
        _local_6.push(new anim.BurnSprite(a), 0);
        _local_6.push(new anim.BurnSprite(b), 0);
        this.playground.getAnimManager().pushEffect(_local_6);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.OpenSpiderCocoonAnim = function (spider) {
        this._spider = spider;
        this._started = false;
        this._fx = yota.McTop.attach(this._spider.mc, "jama_fx_cocon");
        this._fx.stop();
        this._fx._visible = false;
    };
    anim.OpenSpiderCocoonAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._fx._visible = true;
            this._spider.setOrientation(this._spider.orientation);
            this._anim = new anim.SteppedAnim(this._fx);
        }
        var _local_3 = this._anim.update(tmod);
        if (!_local_3) {
            this._fx.removeMovieClip();
        }
        return(_local_3);
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.dialog) {
        gui.dialog = new Object();
    }
    gui.dialog.Login = function (parent) {
        this._parent = parent;
        this._drawWindow();
    };
    gui.dialog.Login.prototype.destroy = function () {
        this._win.removeMovieClip();
    };
    gui.dialog.Login.prototype.getLogin = function () {
        return(this._win.login.text);
    };
    gui.dialog.Login.prototype.getPassword = function () {
        return(this._win.password.text);
    };
    gui.dialog.Login.prototype._drawWindow = function () {
        this._win = yota.McTop.attach(this._parent, "jama_gui_LoginDialog");
        this._win._x = (Consts.WIDTH - this._win._width) / 2;
        this._win._y = (Consts.HEIGHT - this._win._height) / 2;
        var self = this;
        this._win.submit.onRelease = function () {
            self.onSubmit();
        };
        this._win.submit.label = "entrer";
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.PlayState = function (main, state) {
        this._jama = main;
        this._state = state;
        this.onRestart();
    };
    adventure.PlayState.prototype.update = function (tmod) {
        if (!this._ended) {
            this._gameManager.update(tmod);
        }
    };
    adventure.PlayState.prototype.onVictory = function () {
        this._ended = true;
        var _local_2 = Jama.getPlayer();
        _local_2.adventureSave.setLevelCompleted(this._state.getPackId(), this._state.getLevelId());
        var me = this;
        var _local_3 = function (xml) {
            me._jama.setState(me._state);
            me._state.restored();
            Jama.endWait();
        };
        Jama.wait();
        if (_local_2.adventureSave.modified()) {
            this._jama.network().saveAdventure(_local_3);
        } else {
            _local_3(null);
        }
    };
    adventure.PlayState.prototype.onDefeat = function () {
        this._ended = true;
        this._jama.setState(this._state);
        this._state.restored();
    };
    adventure.PlayState.prototype.onRestart = function () {
        this._ended = true;
        this._layer = this._jama.newLayer();
        this._level = this._state.getLevel();
        this._playGround = new gui.GamePlayground(this._layer, this._level);
        this._gameManager = new game.GameManager(this._playGround);
        this._gameManager.onVictory = Std.callback(this, "onVictory");
        this._gameManager.onDefeat = Std.callback(this, "onDefeat");
        this._gameManager.onAbandon = Std.callback(this, "onDefeat");
        this._gameManager.onRestart = Std.callback(this, "onRestart");
        this._ended = false;
    };
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelCursor = function (parent) {
        this._layer = yota.McTop.create(parent);
        this._layer._y = 50;
        this._cursor = yota.McTop.create(this._layer);
        yota.Mc.fillSquare(this._cursor, Consts.DARK_BROWN, 0, 0, 384, 20);
        this._cursor._alpha = 60;
        this._cursor._visible = false;
    };
    editlist.LevelCursor.prototype.setY = function (y) {
        this._cursor._y = y;
        this._cursor._visible = true;
    };
    editlist.LevelCursor.prototype.hide = function () {
        this._cursor._visible = false;
    };
    Jama = function (rootMC) {
        switch (Jama.RELEASE) {
            case Jama.LOCAL : 
                Consts.DATA_LOCATION = "xml/jama/data.xml";
                Jama.DEBUG = true;
                break;
            case Jama.MOLDAVE : 
                Jama.DEBUG = true;
                Jama.GAMECLI = true;
                break;
            case Jama.FRUTIPARC : 
                Jama.GAMECLI = true;
                Jama.FCLI = true;
                break;
        }
        Jama._ROOT_MC = rootMC;
        Timer.wantedFPS = 40;
        if (Jama.DEBUG) {
            Jama._LOG = new yota.Log(rootMC);
        }
        if (Jama.BETA) {
            var _local_3 = "B:" + Jama.BVERSION.substr(3, Jama.BVERSION.length - 4);
            var _local_4 = new yota.VersionField(rootMC, Consts.WIDTH, Consts.HEIGHT, _local_3);
        }
        this._paused = false;
        this._started = false;
        Element.init();
        Jama.wait();
        var _local_5 = this;
        this._currentLayer = null;
        this._data = new ExternalData(this);
        this._netClient = new NetClient(this);
        if (Jama.GAMECLI) {
            Jama.debug("GAME CLIENT MODE", "Jama", "src/Jama.mt", 80);
            this._gameClient = new frusion.gameclient.GameClient();
            this._gameClient.onPause = Std.callback(this, "_onPause");
            this._gameClient.onGameClose = Std.callback(this, "_onClose");
            this._gameClient.onGameReset = Std.callback(this, "_onReset");
            this._netClient.setGameClient(this._gameClient);
            this._gameClient.serviceConnect();
        } else if (Jama.FCLI) {
            Jama.debug("FRUSION CLIENT MODE", "Jama", "src/Jama.mt", 89);
            this._frusion = new frusion.client.FrusionClient();
            this._frusion.registerPauseCallback({execute:Std.callback(this, "_onPause")});
            this._frusion.registerCloseCallback({execute:Std.callback(this, "_onClose")});
            this._frusion.registerResetCallback({execute:Std.callback(this, "_onReset")});
            this._netClient.setFrusionClient(this._frusion);
            this._frusion.getService();
        }
        this._netClient.enableDebug();
        var _local_6 = new state.Waiting(this.newLayer());
        _local_6.onReady = Std.callback(_local_5, "_start");
        _local_6.waitFor(this._netClient);
        _local_6.waitFor(this._data);
        this._state = _local_6;
        this._data.load();
        this._netClient.connect(Jama.JAMA_HOST, Jama.JAMA_PORT);
    };
    Jama.prototype.setState = function (state) {
        this._state = state;
    };
    Jama.prototype.data = function () {
        return(this._data);
    };
    Jama.prototype.network = function () {
        return(this._netClient);
    };
    Jama.setPlayer = function (p) {
        Jama._PLAYER = p;
    };
    Jama.getPlayer = function () {
        return(Jama._PLAYER);
    };
    Jama.wait = function () {
        if (Jama._WAIT_CURSOR == null) {
            Jama._WAIT_CURSOR = new gui.WaitCursor(Jama._ROOT_MC);
        }
    };
    Jama.endWait = function () {
        if (Jama._WAIT_CURSOR != null) {
            Jama._WAIT_CURSOR.destroy();
            Jama._WAIT_CURSOR = null;
        }
    };
    Jama.prototype.newLayer = function () {
        if (this._currentLayer != null) {
            this._currentLayer.removeMovieClip();
        }
        this._currentLayer = Std.createEmptyMC(Jama._ROOT_MC, 500);
        return(this._currentLayer);
    };
    Jama.prototype.exit = function () {
        Jama._ROOT_MC.gotoAndStop("4");
    };
    Jama.setCursor = function (c) {
        Mouse.hide();
        Jama._CURSOR = c;
    };
    Jama.delCursor = function (d) {
        Jama._CURSOR = null;
        Mouse.show();
    };
    Jama.debug = function (str) {
        if (Jama.DEBUG) {
            Jama._LOG.trace("DBG: " + str);
        }
    };
    Jama.error = function (err) {
        if (Jama.DEBUG) {
            Jama._LOG.trace("ERR: " + err);
        }
    };
    Jama.mouseInGame = function () {
        return((((Jama._ROOT_MC._ymouse >= 0) && (Jama._ROOT_MC._ymouse <= Consts.HEIGHT)) && (Jama._ROOT_MC._xmouse >= 0)) && (Jama._ROOT_MC._xmouse <= Consts.WIDTH));
    };
    Jama.prototype.loop = function () {
        Timer.update();
        if (!this._paused) {
            this._state.update(Timer.tmod);
            if (Jama._CURSOR != null) {
                this._updateCursor();
            }
        }
    };
    Jama.prototype._updateCursor = function () {
        var _local_2 = !Jama.mouseInGame();
        if ((!_local_2) && (!Jama._CURSOR.isVisible())) {
            Jama._CURSOR.show();
            Mouse.hide();
            return(undefined);
        }
        if (_local_2 && (Jama._CURSOR.isVisible())) {
            Jama._CURSOR.hide();
            Mouse.show();
            return(undefined);
        }
    };
    Jama.prototype._start = function () {
        Jama.endWait();
        this._started = true;
        this._state = new menu.State(this);
    };
    Jama.prototype._onPause = function () {
        this._paused = this._frusion.pauseStatus;
    };
    Jama.prototype._onClose = function () {
        if (Jama.FCLI) {
            this._frusion.closeService();
        }
        if (Jama.GAMECLI) {
            this._gameClient.closeService();
        }
    };
    Jama.prototype._onReset = function () {
        if (this._started) {
            Jama.delCursor(null);
            this.setState(new menu.State(this));
        }
    };
    Jama.JAMA_HOST = "192.168.1.2";
    Jama.JAMA_PORT = 3010;
    Jama.VERSION = "1.1.5";
    Jama.BVERSION = "$B:56$";
    Jama.LOCAL = 0;
    Jama.MOLDAVE = 1;
    Jama.FRUTIPARC = 2;
    Jama.RELEASE = Jama.FRUTIPARC;
    Jama.BETA = false;
    Jama.DEBUG = false;
    Jama.GAMECLI = false;
    Jama.FCLI = false;
    Jama._LOG = null;
    if (!game) {
        game = new Object();
    }
    game.TestState = function (main, editState, saved) {
        this._abandoning = false;
        this._jama = main;
        this._modified = !saved;
        this._editState = editState;
        this._restart();
    };
    game.TestState.prototype.update = function (tmod) {
        if (!this._abandoning) {
            this._gameManager.update(tmod);
        } else if (!Key.isDown(Key.ESCAPE)) {
            this._backToEditor();
        }
    };
    game.TestState.prototype._backToEditor = function () {
        this._jama.setState(this._editState);
        this._editState.draw();
        if (this._modified) {
            this._editState.setModified();
        }
    };
    game.TestState.prototype._abandon = function () {
        this._abandoning = true;
    };
    game.TestState.prototype._restart = function () {
        var _local_2 = new gui.GamePlayground(this._jama.newLayer(), this._editState.getLevel());
        this._gameManager = new game.GameManager(_local_2);
        this._gameManager.onVictory = Std.callback(this, "_backToEditor");
        this._gameManager.onDefeat = Std.callback(this, "_backToEditor");
        this._gameManager.onAbandon = Std.callback(this, "_abandon");
        this._gameManager.onRestart = Std.callback(this, "_restart");
    };
    if (!menu) {
        menu = new Object();
    }
    menu.State = function (main) {
        this._jama = main;
        this._menu = new menu.Menu(this._jama.newLayer());
    };
    menu.State.prototype.update = function (tmod) {
        this._menu.update(tmod);
        var _local_3 = this._menu.getSelectedId();
        if (_local_3 != 0) {
            this.indexSelected(_local_3);
        }
    };
    menu.State.prototype.indexSelected = function (index) {
        var _local_3 = null;
        switch (index) {
            case menu.State.CHALLENGE : 
                _local_3 = new playlist.State(this._jama, null);
                break;
            case menu.State.ADVENTURE : 
                _local_3 = new adventure.State(this._jama);
                break;
            case menu.State.EDITOR : 
                if (Jama.getPlayer().canCreateLevel) {
                    _local_3 = new editlist.State(this._jama);
                } else {
                    _local_3 = new misc.CannotCreateLevelState(this._jama);
                }
                break;
            case menu.State.STATS : 
                _local_3 = new statlist.State(this._jama);
                break;
            case menu.State.HELP : 
                _local_3 = new help.State(this._jama);
                break;
            case menu.State.OPTIONS : 
                _local_3 = new options.State(this._jama);
                break;
        }
        if (_local_3 != null) {
            this._jama.setState(_local_3);
        }
    };
    menu.State.CHALLENGE = 1;
    menu.State.ADVENTURE = 2;
    menu.State.ARENA = 3;
    menu.State.EDITOR = 4;
    menu.State.STATS = 5;
    menu.State.HELP = 6;
    menu.State.OPTIONS = 7;
    menu.State.TEST = 9;
    Replay = function () {
    };
    Replay.MOVE_NORTH = Direction.NORTH;
    Replay.MOVE_EAST = Direction.EAST;
    Replay.MOVE_SOUTH = Direction.SOUTH;
    Replay.MOVE_WEST = Direction.WEST;
    Replay.START_GHOST = 4;
    Replay.STOP_GHOST = 5;
    if (!anim) {
        anim = new Object();
    }
    anim.FadeAnim = function (playground, coord, fadeIn) {
        this._playground = playground;
        this._layer = yota.McTop.create(playground.getFadeLayer());
        this._ground = null;
        this._drawGround(this._layer);
        this._circle1 = yota.McTop.attach(this._layer, "jama_fx_circle1");
        this._circle2 = yota.McTop.attach(this._layer, "jama_fx_circle2");
        this._circle1._x = coord.x;
        this._circle1._y = coord.y;
        this._circle1._width = Consts.WIDTH * 3;
        this._circle1._height = Consts.HEIGHT * 3;
        this._circle2._x = this._circle1._x;
        this._circle2._y = this._circle1._y;
        this._circle2._width = Consts.WIDTH * 3;
        this._circle2._height = Consts.HEIGHT * 3;
        playground.getLayer().setMask(this._circle1);
        this._counter = 80;
        this._state = anim.FadeAnim._BIG_FADE_IN;
    };
    anim.FadeAnim.prototype.update = function (tmod) {
        switch (this._state) {
            case anim.FadeAnim._BIG_FADE_IN : 
                this._counter = this._counter - tmod;
                this._circle1._width = this._circle1._width - (tmod * 15);
                this._circle1._yscale = this._circle1._xscale;
                this._circle2._xscale = this._circle1._xscale;
                this._circle2._yscale = this._circle1._yscale;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._counter <= 0) {
                    this._state = anim.FadeAnim._SMALL_FADE_OUT;
                    this._counter = 30;
                }
                return(true);
            case anim.FadeAnim._SMALL_FADE_OUT : 
                this._counter = this._counter - tmod;
                this._circle1._width = this._circle1._width + (tmod * 2);
                this._circle1._yscale = this._circle1._xscale;
                this._circle2._xscale = this._circle1._xscale;
                this._circle2._yscale = this._circle1._yscale;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._counter <= 0) {
                    this._counter = 17;
                    this._state = anim.FadeAnim._WAIT_FOR_FADE;
                }
                return(true);
            case anim.FadeAnim._WAIT_FOR_FADE : 
                this._counter = this._counter - tmod;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._counter <= 0) {
                    this._counter = 17;
                    this._state = anim.FadeAnim._SMALL_FADE;
                }
                return(true);
            case anim.FadeAnim._SMALL_FADE : 
                this._counter = this._counter - tmod;
                this._circle1._width = this._circle1._width - (tmod * 10);
                this._circle1._yscale = this._circle1._xscale;
                this._circle2._xscale = this._circle1._xscale;
                this._circle2._yscale = this._circle1._yscale;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._counter <= 0) {
                    this._playground.getLayer().setMask(null);
                    this._circle1.removeMovieClip();
                    this._circle2.removeMovieClip();
                    this._drawGround(this._playground.getLayer());
                    this._state = anim.FadeAnim._WAIT_END;
                    this._counter = 50;
                }
                return(true);
            case anim.FadeAnim._WAIT_END : 
                this._counter = this._counter - tmod;
                if (this._counter <= 0) {
                    return(false);
                }
                return(true);
        }
        return(false);
    };
    anim.FadeAnim.prototype._drawGround = function (where) {
        if (this._ground != null) {
            this._ground.removeMovieClip();
        }
        this._ground = yota.McTop.create(where);
        this._ground._x = 0;
        this._ground._y = 0;
        yota.Mc.fillSquare(this._ground, Consts.LIGHT_BROWN, 0, 0, Consts.HEIGHT, Consts.WIDTH);
    };
    anim.FadeAnim._BIG_FADE_IN = 1;
    anim.FadeAnim._SMALL_FADE_OUT = 2;
    anim.FadeAnim._SMALL_FADE = 3;
    anim.FadeAnim._WAIT_FOR_FADE = 4;
    anim.FadeAnim._WAIT_END = 5;
    if (!anim) {
        anim = new Object();
    }
    anim.DefeatAnim = function (exit) {
        this._exit = exit;
        var _local_4 = exit.playground.toGlobalGuiCoord(exit.pos);
        _local_4.x = _local_4.x + (Consts.SPRITE_WIDTH / 2);
        _local_4.y = _local_4.y + (Consts.SPRITE_HEIGHT / 2);
        super(exit.playground, _local_4, false);
        this._started = false;
    };
    anim.DefeatAnim.prototype.__proto__ = anim.FadeAnim.prototype;
    anim.DefeatAnim.prototype.__constructor__ = anim.FadeAnim;
    anim.DefeatAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            if (!Consts.showVictoFade) {
                return(false);
            }
        }
        return(anim_FadeAnim_update.call(this, tmod));
    };
    anim_FadeAnim_update = anim.FadeAnim.prototype.update;
    if (!anim) {
        anim = new Object();
    }
    anim.SpiderMove = function (spider, anim) {
        this._spider = spider;
        this._anim = anim;
        this._started = false;
    };
    anim.SpiderMove.prototype.update = function (tmod) {
        if (!this._started) {
            this._spider.beginMove();
            this._started = true;
        }
        var _local_3 = this._anim.update(tmod);
        if (!_local_3) {
            this._spider.endMove();
        }
        return(_local_3);
    };
    Timer = function () {
    };
    Timer.update = function () {
        Timer.frameCount++;
        var _local_2 = Std.getTimer();
        Timer.deltaT = (_local_2 - Timer.oldTime) / 1000;
        Timer.oldTime = _local_2;
        if (Timer.deltaT < Timer.maxDeltaTime) {
            Timer.calc_tmod = (Timer.calc_tmod * Timer.tmod_factor) + (((1 - Timer.tmod_factor) * Timer.deltaT) * Timer.wantedFPS);
        } else {
            Timer.deltaT = 1 / Timer.wantedFPS;
        }
        Timer.tmod = Timer.calc_tmod;
    };
    Timer.fps = function () {
        return(Timer.wantedFPS / Timer.tmod);
    };
    Timer.wantedFPS = 32;
    Timer.maxDeltaTime = 0.5;
    Timer.oldTime = Std.getTimer();
    Timer.tmod_factor = 0.95;
    Timer.calc_tmod = 1;
    Timer.tmod = 1;
    Timer.deltaT = 1;
    Timer.frameCount = 0;
    if (!yota) {
        yota = new Object();
    }
    yota.CbeeClient = function () {
        super();
        this._identified = false;
        this._debug = false;
        this._commandCallbacks = new Hash();
        this._requests = new Array();
        this._requestId = 0;
        this._lastActivity = 0;
        this._pingIntervalId = 0;
        this._frusionClient = null;
        this._gameClient = null;
        this.setPingInterval(100);
        this.bind("c", this, this._xmlTime);
        this.bind("d", this, this._xmlIp);
        this.bind("e", this, this._xmlPing);
        this.bind("k", this, this._xmlIdent);
    };
    yota.CbeeClient.prototype.__proto__ = XMLSocket.prototype;
    yota.CbeeClient.prototype.__constructor__ = XMLSocket;
    yota.CbeeClient.prototype.setPingInterval = function (seconds) {
        if (this._pingIntervalId != 0) {
            Std.getGlobal("clearInterval")(this._pingIntervalId);
        }
        this._pingInterval = seconds * 1000;
        var _local_3 = Std.callback(this, "keepAlive");
        this._pingIntervalId = Std.getGlobal("setInterval")(_local_3, this._pingInterval);
    };
    yota.CbeeClient.prototype.keepAlive = function () {
        var _local_2 = Std.getTimer();
        this.send("<e/>");
        this._lastActivity = _local_2;
    };
    yota.CbeeClient.prototype.enableDebug = function () {
        this._debug = true;
    };
    yota.CbeeClient.prototype.disableDebug = function () {
        this._debug = false;
    };
    yota.CbeeClient.prototype.bind = function (cmd, obj, func) {
        var _local_3 = function (xml) {
            func.call(obj, xml);
        };
        this._commandCallbacks.set(cmd, _local_3);
    };
    yota.CbeeClient.prototype.onXML = function (doc) {
        if (doc.load != null) {
            var _local_3 = doc.firstChild;
        } else if (doc.appendChild != null) {
            var _local_3 = doc;
        } else {
            var _local_3 = new XML(doc.toString()).firstChild;
        }
        if (this._debug) {
            Jama.debug("R: " + _local_3.toString(), "yota.CbeeClient", "yota/CbeeClient.mt", 103);
        }
        if (_local_3.exists("r")) {
            var _local_4 = Std.parseInt(_local_3.get("r"), 10);
            if (this._requests[_local_4] != null) {
                var _local_5 = this._requests[_local_4];
                this._requests[_local_4] = null;
                _local_5.callback(_local_3);
            }
        } else if (this._commandCallbacks.exists(_local_3.nodeName)) {
            this._commandCallbacks.get(_local_3.nodeName)(_local_3);
        }
    };
    yota.CbeeClient.prototype.onXMLFrusion = function (args) {
        var _local_3 = new XML(args[1]);
        this.onXML(_local_3);
    };
    yota.CbeeClient.prototype.sendRequest = function (r) {
        var _local_3 = this._nextRequestId();
        r.id = _local_3;
        r.xml.set("r", String(_local_3));
        this._requests[_local_3] = r;
        this.send(r.xml.toString());
        this._lastActivity = Std.getTimer();
    };
    yota.CbeeClient.prototype.send = function (str) {
        if (this._debug) {
            Jama.debug("S: " + str, "yota.CbeeClient", "yota/CbeeClient.mt", 140);
        }
        if (this._frusionClient != null) {
            this._frusionClient.sendXml(str);
        } else if (this._gameClient != null) {
            var _local_3 = new XML(str);
            this._gameClient.sendXml(_local_3);
        } else {
            XmlSocket_send.call(this, str);
        }
    };
    yota.CbeeClient.prototype.setFrusionClient = function (fc) {
        this._frusionClient = fc;
        this._frusionClient.onXML = Std.callback(this, "onXMLFrusion");
        this._frusionClient.onIdent = Std.callback(this, "onIdentSuccess");
    };
    yota.CbeeClient.prototype.setGameClient = function (fg) {
        this._gameClient = fg;
        this._gameClient.onXml = Std.callback(this, "onXML");
        this._gameClient.onServiceConnect = Std.callback(this, "onIdentSuccess");
    };
    yota.CbeeClient.prototype._xmlTime = function (xml) {
    };
    yota.CbeeClient.prototype._xmlPing = function (xml) {
    };
    yota.CbeeClient.prototype._xmlIp = function (xml) {
        this._ip = xml.nodeValue;
    };
    yota.CbeeClient.prototype._xmlIdent = function (xml) {
        if (xml.exists("k")) {
            this.onIdentFailure(xml);
        } else {
            this.onIdentSuccess();
        }
    };
    yota.CbeeClient.prototype._nextRequestId = function () {
        this._requestId++;
        if (this._requestId > 1000) {
            this._requestId = 0;
        }
        if (this._requests[this._requestId] != null) {
            Jama.debug("ERROR: CbeeClient request id conflict id=" + this._requestId, "yota.CbeeClient", "yota/CbeeClient.mt", 200);
        }
        return(this._requestId);
    };
    XmlSocket_send = XMLSocket.prototype.send;
    if (!anim) {
        anim = new Object();
    }
    anim.FlashAnim = function (parent) {
        this._parent = parent;
        this._flash = null;
    };
    anim.FlashAnim.prototype.update = function (tmod) {
        if (this._flash == null) {
            this._flash = yota.McTop.create(this._parent);
            yota.Mc.fillSquare(this._flash, 16777215, 0, 0, Consts.HEIGHT, Consts.WIDTH);
            return(true);
        } else {
            this._flash.removeMovieClip();
            return(false);
        }
    };
    if (!help) {
        help = new Object();
    }
    help.Window = function (parent, defaultUrl) {
        this._parent = parent;
        this._defaultUrl = defaultUrl;
        this._backList = new Array();
        this._nextList = new Array();
        this._scrolling = 0;
        this._createWindow();
        this._createArrows();
    };
    help.Window.prototype.setStyle = function (style) {
        this._text.styleSheet = style;
    };
    help.Window.prototype.setContent = function (url, str) {
        this._currentSection = url;
        this._text.htmlText = str;
        this._text.scroll = 1;
        this._scrolling = 0;
    };
    help.Window.prototype.update = function (tmod) {
        if (this._scrolling != 0) {
            this._text.scroll = this._text.scroll + this._scrolling;
            return(true);
        }
        return(false);
    };
    help.Window.prototype._scroll = function (d) {
        this._scrolling = d;
    };
    help.Window.prototype._requestContent = function (key) {
        this.setContent(key, this.requestContent(key));
    };
    help.Window.prototype._createWindow = function () {
        this._win = yota.McTop.attach(this._parent, "jama_gui_BigHelp");
        var self = this;
        this._win.showSection = function (k) {
            self._backList.push(self._currentSection);
            self.setContent(k, self.requestContent(k));
        };
        this._win.btnBack.onRelease = function () {
            self.requestQuit();
        };
        this._win.btnTop.onRelease = function () {
            var _local_2 = self._defaultUrl;
            self.setContent(_local_2, self.requestContent(_local_2));
            self._backList = new Array();
            self._nextList = new Array();
        };
        this._win.btnPrev.onRelease = function () {
            if (self._backList.length > 0) {
                var _local_2 = self._backList.pop();
                self._nextList.push(self._currentSection);
                self.setContent(_local_2, self.requestContent(_local_2));
            }
        };
        this._win.btnNext.onRelease = function () {
            if (self._nextList.length > 0) {
                var _local_2 = self._nextList.pop();
                self._backList.push(self._currentSection);
                self.setContent(_local_2, self.requestContent(_local_2));
            }
        };
        this._text = this._win.content;
        this._text.multiline = true;
        this._text.wordWrap = true;
        this._text.html = true;
        this._text.htmlText = "";
        this._text.selectable = true;
        this._text.mouseWheelEnabled = true;
        this._win._y = 0;
        this._win._y = 0;
        this._win._x = (Consts.WIDTH - this._win._width) / 2;
    };
    help.Window.prototype._createArrows = function () {
        var self = this;
        this._upArrow = this._win.sb.upArrow;
        this._upArrow.onPress = function () {
            self._scroll(-1);
        };
        this._upArrow.onRelease = function () {
            self._scroll(0);
        };
        this._dwArrow = this._win.sb.dwArrow;
        this._dwArrow.onPress = function () {
            self._scroll(1);
        };
        this._dwArrow.onRelease = function () {
            self._scroll(0);
        };
    };
    if (!editor) {
        editor = new Object();
    }
    editor.SelectCursor = function (parent) {
        this.type = editor.Editor.SELECT_CURSOR;
        var _local_4 = yota.McTop.create(parent);
        _local_4.beginFill(255, 100);
        _local_4.lineStyle(2, 16777215, 100);
        _local_4.moveTo(-10, -10);
        _local_4.lineTo(-5, 10);
        _local_4.lineTo(0, 0);
        _local_4.lineTo(10, -5);
        _local_4.lineTo(-10, -10);
        _local_4.endFill();
        _local_4._x = parent._xmouse;
        _local_4._y = parent._ymouse;
        super(_local_4);
    };
    editor.SelectCursor.prototype.__proto__ = editor.Cursor.prototype;
    editor.SelectCursor.prototype.__constructor__ = editor.Cursor;
    if (!statlist) {
        statlist = new Object();
    }
    statlist.StatListController = function () {
    };
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelSizeEdit = function (parent, main, level) {
        this._jama = main;
        this._level = level;
        this._mc = yota.McTop.create(parent);
        var _local_5 = yota.McTop.create(this._mc);
        yota.Mc.fillSquare(_local_5, Consts.BLACK_BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
    };
    editlist.LevelSizeEdit.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    editlist.LevelSizeEdit.prototype.draw = function () {
        var _local_2 = this;
        this._win = yota.McTop.attach(this._mc, "jama_gui_LevelSizeEdit");
        this._win.btnValidate.label = "valider";
        this._win.btnValidate.onRelease = Std.callback(_local_2, "_onValidate");
        this._win.btnCancel.label = "annuler";
        this._win.btnCancel.onRelease = Std.callback(_local_2, "_onCancel");
        this._win.width.text = Jama.getPlayer().maxLevelWidth;
        this._win.height.text = Jama.getPlayer().maxLevelHeight;
        this._win._x = (Consts.WIDTH - this._win._width) / 2;
        this._win._y = (Consts.HEIGHT - this._win._height) / 2;
    };
    editlist.LevelSizeEdit.prototype.getMovieClip = function () {
        return(this._mc);
    };
    editlist.LevelSizeEdit.prototype._onValidate = function () {
        var _local_2 = new Dimension(Std.parseInt(this._win.width.text, 10), Std.parseInt(this._win.height.text, 10));
        var _local_3 = true;
        if ((Std.isNaN(_local_2.width) || (_local_2.width <= 0)) || (_local_2.width > Jama.getPlayer().maxLevelWidth)) {
            _local_3 = false;
            this._win.width.text = Jama.getPlayer().maxLevelWidth;
        }
        if ((Std.isNaN(_local_2.height) || (_local_2.height <= 0)) || (_local_2.height > Jama.getPlayer().maxLevelHeight)) {
            _local_3 = false;
            this._win.height.text = Jama.getPlayer().maxLevelHeight;
        }
        if (_local_3) {
            this._level.size = _local_2;
            this.onValidate(this._level);
        }
    };
    editlist.LevelSizeEdit.prototype._onCancel = function () {
        this.onCancel(this._level);
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.Pack = function (t) {
        this.title = t;
        this.levels = new Array();
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.Level = function (t, c) {
        this.title = t;
        this.content = c;
        this.completed = false;
    };
    if (!playlist) {
        playlist = new Object();
    }
    playlist.OrderButton = function (pane, order, index) {
        this._index = index;
        this._order = order;
        this._pane = pane;
        this._layer = yota.McTop.create(this._pane.getMovieClip());
        this._create();
    };
    playlist.OrderButton.prototype.getOrder = function () {
        return(this._order);
    };
    playlist.OrderButton.prototype.getLabel = function () {
        return(this._order.label);
    };
    playlist.OrderButton.prototype.getIndex = function () {
        return(this._index);
    };
    playlist.OrderButton.prototype.setIndex = function (idx) {
        this._index = idx;
    };
    playlist.OrderButton.prototype.getMovieClip = function () {
        return(this._layer);
    };
    playlist.OrderButton.prototype._create = function () {
        var self = this;
        var pane = this._pane;
        var _local_2 = yota.McTop.create(this._layer);
        _local_2.beginFill(Consts.BROWN, 100);
        _local_2.lineStyle(2, Consts.BLACK_BROWN, 100);
        _local_2.moveTo(0, 0);
        _local_2.lineTo(200, 0);
        _local_2.lineTo(200, 20);
        _local_2.lineTo(0, 20);
        _local_2.lineTo(0, 0);
        _local_2.endFill();
        var _local_3 = yota.McTop.createTextField(_local_2);
        _local_3._width = 180;
        _local_3._height = 20;
        _local_3._y = 0;
        _local_3._x = 4;
        _local_3.multiline = false;
        _local_3.selectable = false;
        _local_3.mouseWheelEnabled = false;
        _local_3.wordWrap = false;
        var _local_4 = _local_3.getTextFormat();
        _local_4["color"] = Consts.BLACK_BROWN;
        _local_4.font = "Arial";
        _local_4.size = 14;
        _local_4.leading = 0;
        _local_3.setNewTextFormat(_local_4);
        _local_3.text = this._order.label;
        this._layer._y = this._pane.size() * 20;
        _local_2.onPress = function () {
            pane.startDrag(self);
        };
        _local_2.onRelease = function () {
            pane.stopDrag(self);
        };
        var order = this._order;
        var pm = yota.McTop.attach(this._layer, "jama_gui_OrderPM");
        pm._x = (_local_2._width - pm._width) - 10;
        pm._y = _local_2._y + 3;
        pm.update = function () {
            if (order["key"].toLowerCase() == order["key"]) {
                pm.gotoAndStop("2");
            } else {
                pm.gotoAndStop("1");
            }
        };
        pm.onPress = null;
        pm.onRelease = function () {
            if (order["key"].toLowerCase() == order["key"]) {
                order["key"] = order["key"].toUpperCase();
            } else {
                order["key"] = order["key"].toLowerCase();
            }
            Consts.updateListOrderCompressed();
            pm.update();
        };
        pm.update();
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.PackSelect = function (layer, packs) {
        this._layer = yota.McTop.create(layer);
        yota.Mc.fillSquare(this._layer, Consts.BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
        yota.McTop.attach(this._layer, "jama_Menu_Glyph")._x = Consts.WIDTH;
        this._waves = yota.McTop.attach(this._layer, "jama_Menu_Bande");
        this._waves._x = 0;
        this._waves._y = 0;
        this._packs = packs;
        var _local_4 = 0;
        for ( ; _local_4 < this._packs.length ; _local_4++) {
            this._drawPack(_local_4, this._packs[_local_4]);
        }
    };
    adventure.PackSelect.prototype.destroy = function () {
        this._layer.removeMovieClip();
    };
    adventure.PackSelect.prototype.update = function (tmod) {
        this._waves._y--;
        if (this._waves._y < -31) {
            this._waves._y = this._waves._y + 31;
        }
    };
    adventure.PackSelect.prototype._drawPack = function (i, pack) {
        var me = this;
        var p = pack;
        var _local_4 = yota.McTop.attach(this._layer, "jama_gui_AdventurePack");
        _local_4.gotoAndStop(Std.toString(1 + i));
        _local_4._x = Consts.WIDTH / 2;
        _local_4._y = 50 + (i * 60);
        _local_4.onRelease = function () {
            me.onPackSelected(p);
        };
        _local_4.title.text = pack.title;
    };
    LevelEntry = function () {
        this.id = -1;
        this.title = Consts.EMPTY_LEVEL_TITLE;
        this.value = 0;
        this.bestScore = 9999;
        this.played = false;
        this.completed = false;
        this.validated = false;
        this.status = -1;
        this.author = "";
    };
    LevelEntry.prototype.setValuesFromXml = function (xml) {
        this.id = Std.parseInt(xml.get("i"), 10);
        this.title = yota.HtmlString.decode(xml.get("t"));
        this.value = Std.parseInt(xml.get("p"), 10);
        this.validated = "1" == xml.get("v");
        this.status = Std.parseInt(xml.get("st"), 10);
        this.bestScore = Std.parseInt(xml.get("s"), 10);
        this.completed = this.status > 1;
        this.played = this.status != -1;
        this.author = xml.get("u");
        this["date"] = xml.get("m");
        this.nbrPlays = Std.parseInt(xml.get("np"), 10);
        this.nbrVictories = Std.parseInt(xml.get("nv"), 10);
    };
    LevelEntry.createFromXml = function (xml) {
        var _local_3 = new LevelEntry();
        _local_3.setValuesFromXml(xml);
        return(_local_3);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.EyeShotAnim = function (eye, dest) {
        this._started = false;
        this._eye = eye;
        this._x1 = eye.mc._x;
        this._y1 = eye.mc._y;
        this._x2 = dest.x;
        this._y2 = dest.y;
        this._y1 = this._y1 + 20;
        this._x1 = this._x1 + 15;
        this._y2 = this._y2 + 15;
        this._x2 = this._x2 + 15;
        this._steps = 40;
        this._layer = yota.McTop.create(eye.playground.getLayer());
        this._layer._x = eye.playground._horizontalPadding();
        this._layer._y = eye.playground._verticalPadding();
        if (this._x2 < this._x1) {
            var _local_4 = this._x2;
            this._x2 = this._x1;
            this._x1 = _local_4;
        }
        if (this._y2 < this._y1) {
            var _local_5 = this._y2;
            this._y2 = this._y1;
            this._y1 = _local_5;
        }
    };
    anim.EyeShotAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._eye.mc.gotoAndStop("3");
            this._started = true;
        }
        this._drawLines();
        this._steps = this._steps - tmod;
        var _local_3 = this._steps <= 0;
        if (_local_3) {
            this._layer.removeMovieClip();
            this._eye.mc.gotoAndStop("1");
        }
        return(!_local_3);
    };
    anim.EyeShotAnim.prototype._drawLines = function () {
        var _local_2 = Math.abs(this._x2 - this._x1);
        var _local_3 = Math.abs(this._y2 - this._y1);
        var _local_4 = _local_2 / 4;
        var _local_5 = _local_3 / 4;
        this._layer.clear();
        this._drawLine(1, 16772846, 80, [{x:this._x1, y:this._y1}, {x:this._x2, y:this._y2}]);
        var _local_6 = 1;
        var _local_7 = new Array();
        _local_7.push({x:this._x2, y:this._y2});
        var _local_8 = 1;
        for ( ; _local_8 <= 3 ; _local_8++) {
            var _local_9 = (this._x2 - (_local_8 * _local_4)) + ((Math.random() * 10) * _local_6);
            var _local_10 = (this._y2 - (_local_8 * _local_5)) + ((Math.random() * 10) * _local_6);
            _local_7.push({x:_local_9, y:_local_10});
            _local_6 = 1 - _local_6;
        }
        _local_7.push({x:this._x1, y:this._y1});
        this._drawLine(2, 16755200, 70, _local_7);
        _local_7 = new Array();
        _local_7.push({x:this._x2, y:this._y2});
        var _local_11 = 1;
        for ( ; _local_11 <= 3 ; _local_11++) {
            var _local_12 = (this._x2 - (_local_11 * _local_4)) + ((Math.random() * 10) * _local_6);
            var _local_13 = (this._y2 - (_local_11 * _local_5)) + ((Math.random() * 10) * _local_6);
            _local_7.push({x:_local_12, y:_local_13});
            _local_6 = 1 - _local_6;
        }
        _local_7.push({x:this._x1, y:this._y1});
        this._drawLine(2, 16772608, 60, _local_7);
    };
    anim.EyeShotAnim.prototype._drawLine = function (height, color, alpha, points) {
        this._layer.lineStyle(height, color, alpha);
        this._layer.moveTo(points[0].x, points[0].y);
        var _local_6 = 1;
        for ( ; _local_6 < points.length ; _local_6++) {
            this._layer.lineTo(points[_local_6].x, points[_local_6].y);
        }
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Wall = function (data) {
        super(data);
    };
    sprite.Wall.prototype.__proto__ = Sprite.prototype;
    sprite.Wall.prototype.__constructor__ = Sprite;
    sprite.Wall.prototype.show = function () {
        var _local_2 = this.board.get(this.pos.next(Direction.NORTH)).id == Element.WALL;
        var _local_3 = this.board.get(this.pos.next(Direction.SOUTH)).id == Element.WALL;
        var _local_4 = this.board.get(this.pos.next(Direction.WEST)).id == Element.WALL;
        var _local_5 = this.board.get(this.pos.next(Direction.EAST)).id == Element.WALL;
        var _local_6 = (_local_2 ? 1 : 0);
        _local_6 = _local_6 + (_local_5 ? 2 : 0);
        _local_6 = _local_6 + (_local_3 ? 4 : 0);
        _local_6 = _local_6 + (_local_4 ? 8 : 0);
        this.mc.gotoAndStop(sprite.Wall._FRAMES[_local_6]);
    };
    sprite.Wall.prototype.redraw = function () {
        this.show();
    };
    sprite.Wall.prototype.refreshAround = function () {
        var _local_2 = Direction.NORTH;
        for ( ; _local_2 <= Direction.WEST ; _local_2++) {
            var _local_3 = this.pos.next(_local_2);
            if (this.board.isValid(_local_3)) {
                var _local_4 = this.board.get(_local_3);
                if ((_local_4.id == Element.WALL) && (_local_4.alive)) {
                    _local_4.show();
                }
            }
        }
    };
    sprite.Wall.prototype.burn = function () {
        return(new anim.BurnWall(this));
    };
    sprite.Wall.prototype.endBurn = function () {
        this.alive = false;
        this.destroy();
        this.refreshAround();
    };
    sprite.Wall._FRAMES = ["1", "5", "9", "13", "2", "6", "10", "14", "3", "7", "11", "15", "4", "17", "12", "16"];
    if (!gui) {
        gui = new Object();
    }
    gui.WaitCursor = function (parent) {
        this._layer = yota.McTop.attach(parent, "jama_gui_WaitCursor");
        this._layer.play();
        this._layer.startDrag();
        this._layer._x = parent._xmouse;
        this._layer._y = parent._ymouse;
        this._layer.onRelease = null;
        Jama.setCursor(this);
    };
    gui.WaitCursor.prototype.isVisible = function () {
        return(this._layer._visible);
    };
    gui.WaitCursor.prototype.show = function () {
        this._layer._visible = true;
    };
    gui.WaitCursor.prototype.hide = function () {
        this._layer._visible = false;
    };
    gui.WaitCursor.prototype.destroy = function () {
        this._layer.stopDrag();
        this._layer.removeMovieClip();
        Jama.delCursor(this);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.MoveAnim = function (s, dest, steps) {
        this._sprite = s;
        this._sprite.isMoving = true;
        this._mc = s.mc;
        this._started = false;
        this._steps = steps;
        this._destX = dest.x;
        this._destY = dest.y;
    };
    anim.MoveAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._vectorX = (this._destX - this._mc._x) / this._steps;
            this._vectorY = (this._destY - this._mc._y) / this._steps;
        }
        this._mc._x = this._mc._x + (this._vectorX * tmod);
        this._mc._y = this._mc._y + (this._vectorY * tmod);
        if ((this._mc._x == this._destX) && (this._mc._y == this._destY)) {
            this._sprite.attractedByMagnet = false;
            this._sprite.isMoving = false;
            return(false);
        }
        if (((((this._vectorX > 0) && (this._mc._x > this._destX)) || ((this._vectorX < 0) && (this._mc._x < this._destX))) || ((this._vectorY > 0) && (this._mc._y > this._destY))) || ((this._vectorY < 0) && (this._mc._y < this._destY))) {
            this._mc._x = this._destX;
            this._mc._y = this._destY;
            this._sprite.attractedByMagnet = false;
            this._sprite.isMoving = false;
            return(false);
        }
        return(true);
    };
    if (!playlist) {
        playlist = new Object();
    }
    playlist.TabController = function (listView, view) {
        this._view = listView;
        this._tabs = new Array();
        this._mc = yota.McTop.create(view);
        this._butDeleteTab = yota.McTop.attach(view, "but_supprime");
        this._butDeleteTab.onRelease = Std.callback(this, "deleteCurrentTab");
        this._butDeleteTab._width = 16;
        this._butDeleteTab._height = 16;
        this._butDeleteTab._x = 2;
        this._butDeleteTab._y = 2;
    };
    playlist.TabController.prototype.isFull = function () {
        return(this._tabs.length >= playlist.TabController.MAX_TAB_COUNT);
    };
    playlist.TabController.prototype.addState = function (state) {
        var _local_3 = new playlist.Tab(this._mc, state);
        _local_3.onActivate = Std.callback(this, "onTabActivated");
        this._tabs.push(_local_3);
        this.onTabActivated(_local_3);
    };
    playlist.TabController.prototype.getCurrentTabState = function () {
        return(this._current.state);
    };
    playlist.TabController.prototype.setCurrentTabState = function (state) {
        var _local_3 = 0;
        for ( ; _local_3 < this._tabs.length ; _local_3++) {
            if (this._tabs[_local_3].state == state) {
                this.onTabActivated(this._tabs[_local_3]);
                return(undefined);
            }
        }
    };
    playlist.TabController.prototype.deleteCurrentTab = function () {
        if (this._current.state.mainState) {
            return(undefined);
        }
        var _local_2 = this._current;
        this.onTabActivated(this._tabs[1]);
        _local_2.destroy();
        this._tabs.remove(_local_2);
    };
    playlist.TabController.prototype.onTabActivated = function (tab) {
        if (tab == this._current) {
            return(undefined);
        }
        this._tabs.remove(tab);
        this._tabs.push(this._tabs[0]);
        this._tabs[0] = tab;
        this._current = tab;
        this._tabs[0]._mc._x = 18;
        this._tabs[0]._mc.swapDepths(10);
        var _local_3 = (18 + this._tabs[0]._mc._width) - 25;
        var _local_4 = 1;
        for ( ; _local_4 < this._tabs.length ; _local_4++) {
            this._tabs[_local_4]._mc._x = _local_3;
            this._tabs[_local_4]._mc.swapDepths(this._tabs.length - _local_4);
            _local_3 = (_local_3 + this._tabs[_local_4]._mc._width) - 25;
        }
        this._view.setLevels(this._current.state.levels);
        this._view.setPaginate(this._current.state.currentPage + 1, this._current.state.totalPages);
        this._butDeleteTab._visible = !this._current.state.mainState;
    };
    playlist.TabController.prototype.getStates = function () {
        var _local_2 = new Array();
        var _local_3 = 0;
        for ( ; _local_3 < this._tabs.length ; _local_3++) {
            _local_2.push(this._tabs[_local_3].state);
        }
        return(_local_2);
    };
    playlist.TabController.MAX_TAB_COUNT = 3;
    if (!yota) {
        yota = new Object();
    }
    yota.Mc = function () {
    };
    yota.Mc.fill = function (mc, color) {
        mc.beginFill(color, 100);
        mc.moveTo(0, 0);
        mc.lineTo(0, mc._height);
        mc.lineTo(mc._width, mc._height);
        mc.lineTo(mc._width, 0);
        mc.lineTo(0, 0);
        mc.endFill();
    };
    yota.Mc.drawSquare = function (mc, linesize, color, x1, y1, x2, y2) {
        mc.lineStyle(linesize, color, 100);
        mc.moveTo(x1, y1);
        mc.lineTo(x1, y2);
        mc.lineTo(x2, y2);
        mc.lineTo(x2, y1);
        mc.lineTo(x1, y1);
    };
    yota.Mc.fillSquare = function (mc, color, x1, y1, x2, y2) {
        mc.beginFill(color, 100);
        mc.moveTo(x1, y1);
        mc.lineTo(x1, y2);
        mc.lineTo(x2, y2);
        mc.lineTo(x2, y1);
        mc.lineTo(x1, y1);
        mc.endFill();
    };
    yota.Mc.center = function (mc, w, h) {
        mc._x = (w - mc._width) / 2;
        mc._y = (h - mc._height) / 2;
    };
    if (!gui) {
        gui = new Object();
    }
    gui.Align = function () {
    };
    gui.Align.LEFT = 0;
    gui.Align.CENTER = 1;
    gui.Align.RIGHT = 2;
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelSlot = function (parent, entry) {
        this._mc = yota.McTop.attach(parent, "jama_GUI_LevelSlot");
        this._setLevel(entry);
    };
    editlist.LevelSlot.prototype.getMovieClip = function () {
        return(this._mc);
    };
    editlist.LevelSlot.prototype.getLevel = function () {
        return(this._level);
    };
    editlist.LevelSlot.prototype._setLevel = function (entry) {
        this._level = entry;
        this._mc.id = entry.id;
        this._mc.level = entry;
        this._mc.name = entry.title;
        this._mc.difficulty = entry.value;
        this._mc.record = entry.bestScore;
        switch (entry.status) {
            case -1 : 
                this._mc.icon.gotoAndStop(editlist.LevelSlot.ICON_NEW_FRAME);
                break;
            case 0 : 
                this._mc.icon.gotoAndStop(editlist.LevelSlot.ICON_DEATH_FRAME);
                break;
            case 1 : 
                this._mc.icon.gotoAndStop(editlist.LevelSlot.ICON_BRONZE_FRAME);
                break;
            case 2 : 
                this._mc.icon.gotoAndStop(editlist.LevelSlot.ICON_GOLD_FRAME);
                break;
            default : 
                Jama.error(("status '" + entry.status) + "' not understood");
        }
        var self = this;
        this._mc.onRelease = function () {
            self.onSelected(self);
        };
    };
    editlist.LevelSlot.ICON_DEATH_FRAME = "1";
    editlist.LevelSlot.ICON_GOLD_FRAME = "2";
    editlist.LevelSlot.ICON_BRONZE_FRAME = "3";
    editlist.LevelSlot.ICON_NEW_FRAME = "4";
    if (!editor) {
        editor = new Object();
    }
    editor.State = function (main, level) {
        this._level = level;
        this._jama = main;
        this._locked = false;
        this.draw();
    };
    editor.State.prototype.draw = function () {
        this._layer = this._jama.newLayer();
        this._editor = new editor.Editor(this._layer, this, this._level);
    };
    editor.State.prototype.update = function (tmod) {
        if (!this._locked) {
            this._editor.update(tmod);
        }
    };
    editor.State.prototype.getJama = function () {
        return(this._jama);
    };
    editor.State.prototype.testLevel = function () {
        this._level = this.getLevel();
        this._jama.setState(new game.TestState(this._jama, this, !this._editor.isModified()));
    };
    editor.State.prototype.setModified = function () {
        this._editor.setModified();
    };
    editor.State.prototype.saveLevel = function () {
        if (!this._editor.isModified()) {
            return(undefined);
        }
        this._locked = true;
        var self = this;
        Jama.wait();
        var _local_2 = function (xml) {
            self._locked = false;
            self._onLevelSaved(xml);
        };
        this._level = this.getLevel();
        this._jama.network().slotSave(this._level, _local_2);
    };
    editor.State.prototype.saveLevelAndQuit = function () {
        this._level = this.getLevel();
        Jama.wait();
        this._locked = true;
        var self = this;
        var _local_2 = function (xml) {
            Jama.endWait();
            self._locked = false;
            self._jama.setState(new editlist.State(self._jama));
        };
        this._jama.network().slotSave(this._level, _local_2);
    };
    editor.State.prototype.validateLevel = function () {
        this._locked = true;
        var self = this;
        var _dialog = (new gui.dialog.Confirm(yota.McTop.create(this._layer)));
        _dialog.setText(Consts.VALIDATE_WARNING);
        _dialog.onValidate = Std.callback(this, "validateLevelConfirmed");
        _dialog.onCancel = function () {
            self._locked = false;
            _dialog.destroy();
        };
    };
    editor.State.prototype.validateLevelConfirmed = function () {
        var self = this;
        var setValidateStateCallback = function () {
            self._jama.setState(new game.ValidateState(self._jama, self));
        };
        this._locked = false;
        this._level = this.getLevel();
        if (this._editor.isModified()) {
            Jama.wait();
            this._locked = true;
            var _local_2 = function (xml) {
                Jama.endWait();
                self._locked = false;
                self._level.id = Std.parseInt(xml.get("i"), 10);
                self._editor.saved();
                setValidateStateCallback();
            };
            this._jama.network().slotSave(this._level, _local_2);
        } else {
            setValidateStateCallback();
        }
    };
    editor.State.prototype.quitLevel = function () {
        if (!this._editor.isModified()) {
            this._jama.setState(new editlist.State(this._jama));
            return(undefined);
        }
        this._locked = true;
        var self = this;
        var dialog = (new editor.SaveExitDialog(this._layer));
        dialog.setText(Consts.QUIT_EDITION);
        dialog.setYes("oui", Std.callback(this, "saveLevelAndQuit"));
        var _local_2 = function () {
            dialog.destroy();
            self._locked = false;
        };
        dialog.setCancel("retour", _local_2);
        var _local_3 = function () {
            self._jama.setState(new editlist.State(self._jama));
            dialog.destroy();
        };
        dialog.setNo("non", _local_3);
    };
    editor.State.prototype.getLevel = function () {
        var _local_2 = this._editor.getLevel();
        _local_2.id = this._level.id;
        _local_2.title = this._level.title;
        return(_local_2);
    };
    editor.State.prototype._onLevelSaved = function (xml) {
        Jama.endWait();
        this._level.id = Std.parseInt(xml.get("i"), 10);
        this._editor.saved();
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.Data = function (xmlAtt) {
        this._modified = false;
        this._packs = new Array();
        var _local_3 = xmlAtt.split(";");
        var _local_4 = 0;
        for ( ; _local_4 < _local_3.length ; _local_4++) {
            if (_local_3[_local_4] == "") {
                break;
            }
            var _local_5 = Std.parseInt(_local_3[_local_4], 10);
            Jama.debug("-> new pack " + _local_5, "adventure.Data", "src/adventure/Data.mt", 13);
            this._packs[_local_5] = new Array();
            var _local_6 = _local_3[_local_4].substring(2);
            if (_local_6.length > 0) {
                var _local_7 = _local_6.split(",");
                var _local_8 = 0;
                for ( ; _local_8 < _local_7.length ; _local_8++) {
                    Jama.debug("-> completed level " + Std.parseInt(_local_7[_local_8], 10), "adventure.Data", "src/adventure/Data.mt", 19);
                    this._packs[_local_5].push(Std.parseInt(_local_7[_local_8], 10));
                }
            }
        }
    };
    adventure.Data.prototype.toString = function () {
        var _local_2 = "";
        var _local_3 = 0;
        for ( ; _local_3 < this._packs.length ; _local_3++) {
            if (this._packs[_local_3] != null) {
                _local_2 = _local_2 + (_local_3 + "[");
                _local_2 = _local_2 + this._packs[_local_3].join(",");
                _local_2 = _local_2 + ";";
            }
        }
        return(_local_2);
    };
    adventure.Data.prototype.hasCompletedLevel = function (pack, level) {
        if (this._packs[pack] == null) {
            return(false);
        }
        var _local_4 = 0;
        for ( ; _local_4 < this._packs[pack].length ; _local_4++) {
            if (this._packs[pack][_local_4] == level) {
                return(true);
            }
        }
        return(false);
    };
    adventure.Data.prototype.setLevelCompleted = function (pack, level) {
        if (this.hasCompletedLevel(pack, level)) {
            return(undefined);
        }
        if (this._packs[pack] == null) {
            this._packs[pack] = new Array();
        }
        this._packs[pack].push(level);
        this._modified = true;
    };
    adventure.Data.prototype.modified = function () {
        return(this._modified);
    };
    if (!options) {
        options = new Object();
    }
    options.State = function (main) {
        this._jama = main;
        this._layer = this._jama.newLayer();
        this._drawBackground();
        this._drawWaves();
        this._drawGlyph();
        this._drawCheckBoxes();
    };
    options.State.prototype.update = function (tmod) {
        if (Key.isDown(Key.ESCAPE)) {
            this._onCancel();
        }
        this._scrollBandeAnim(tmod);
    };
    options.State.prototype._scrollBandeAnim = function (tmod) {
        this._layerBande._y--;
        if (this._layerBande._y < -31) {
            this._layerBande._y = this._layerBande._y + 31;
        }
    };
    options.State.prototype._drawBackground = function () {
        var _local_2 = yota.McTop.create(this._layer);
        yota.Mc.fillSquare(_local_2, Consts.BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
    };
    options.State.prototype._drawWaves = function () {
        this._layerBande = yota.McTop.attach(this._layer, "jama_Menu_Bande");
        this._layerBande._x = 0;
        this._layerBande._y = 0;
    };
    options.State.prototype._drawGlyph = function () {
        this._layerGlyph = yota.McTop.attach(this._layer, "jama_Menu_Glyph");
        this._layerGlyph._x = Consts.WIDTH;
        this._layerGlyph._y = 0;
    };
    options.State.prototype._drawCheckBoxes = function () {
        var _local_2 = new gui.component.VerticalPane(this._layer);
        _local_2.setPadding(50, 50, 50, 50);
        this._cb0 = new gui.component.CheckBox(this._layer);
        this._cb0.setLabel("Animation de debut de partie");
        this._cb0.setChecked(Consts.showBeginFade);
        _local_2.push(this._cb0, gui.Align.LEFT);
        this._cb1 = new gui.component.CheckBox(this._layer);
        this._cb1.setLabel("Animation de fin de partie");
        this._cb1.setChecked(Consts.showVictoFade);
        _local_2.push(this._cb1, gui.Align.LEFT);
        var _local_3 = yota.McTop.create(this._layer);
        var _local_4 = new gui.component.JamaButton(_local_3, "Sauver");
        _local_4.onClick = Std.callback(this, "_onSave");
        var _local_5 = new gui.component.JamaButton(_local_3, "Annuler");
        _local_5.onClick = Std.callback(this, "_onCancel");
        var _local_6 = new gui.component.HorizontalPane(_local_3);
        _local_6.setDimension(180, 100);
        _local_6.push(_local_4);
        _local_6.push(_local_5);
        _local_6.draw();
        _local_2.push(_local_6, gui.Align.CENTER);
        _local_2.draw();
    };
    options.State.prototype._onSave = function () {
        Consts.showBeginFade = this._cb0.isChecked();
        Consts.showVictoFade = this._cb1.isChecked();
        var self = this;
        var _local_2 = function (xml) {
            Jama.endWait();
            self._jama.setState(new menu.State(self._jama));
        };
        Jama.wait();
        this._jama.network().saveParameters(_local_2);
    };
    options.State.prototype._onCancel = function () {
        this._jama.setState(new menu.State(this._jama));
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Jade = function (data) {
        super(data);
        this.isMagnet = true;
    };
    sprite.Jade.prototype.__proto__ = Sprite.prototype;
    sprite.Jade.prototype.__constructor__ = Sprite;
    sprite.Jade.prototype.show = function () {
        this.mc.gotoAndStop("normal");
    };
    sprite.Jade.prototype.setOrientation = function (d) {
    };
    sprite.Jade.prototype.update = function (onmove) {
        this._toKill = new Array();
        this._update(Direction.NE);
        this._update(Direction.NW);
        this._update(Direction.SE);
        this._update(Direction.SW);
        if (this._toKill.length > 0) {
            var _local_3 = new anim.ParallelAnimations();
            _local_3.push(new anim.CallbackAnim(Std.callback(this, "_startFire")), 0);
            _local_3.push(new anim.JadeSmokeAnim(this, Direction.NE), 0);
            _local_3.push(new anim.JadeSmokeAnim(this, Direction.NW), 0);
            _local_3.push(new anim.JadeSmokeAnim(this, Direction.SE), 0);
            _local_3.push(new anim.JadeSmokeAnim(this, Direction.SW), 0);
            var _local_4 = 0;
            for ( ; _local_4 < this._toKill.length ; _local_4++) {
                _local_3.push(new anim.BurnSprite(this._toKill[_local_4]), 0);
            }
            _local_3.push(new anim.CallbackAnim(Std.callback(this, "_stopFire")), 40);
            this.playground.getAnimManager().pushEffect(_local_3);
        }
    };
    sprite.Jade.prototype.burn = function () {
        return(null);
    };
    sprite.Jade.prototype.endBurn = function () {
        this.destroy();
    };
    sprite.Jade.prototype.canBePushed = function (sprite) {
        return(sprite.id == Element.HERO);
    };
    sprite.Jade.prototype.canMove = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        if (!this.board.isValid(_local_4)) {
            return(false);
        }
        return(this.board.get(_local_4).canBeCrossed(_local_3, d));
    };
    sprite.Jade.prototype.move = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        var _local_5 = this.board.get(_local_4);
        _local_5.crossed(_local_3, d);
        this.playground.move(this.pos, d, null);
    };
    sprite.Jade.prototype._update = function (d) {
        var _local_3 = this.pos.next(d);
        if (this.board.isValid(_local_3)) {
            var _local_4 = this.board.get(_local_3);
            if (((_local_4.id == Element.HERO) || (_local_4.id == Element.KOHL)) || (_local_4.id == Element.LOUKI)) {
                if (_local_4.alive) {
                    this._toKill.push(_local_4);
                }
            }
        }
    };
    sprite.Jade.prototype._startFire = function () {
        this.mc.gotoAndStop("fire");
    };
    sprite.Jade.prototype._stopFire = function () {
        this.mc.gotoAndStop("normal");
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.NullSprite = function (data) {
        super(data);
        this.id = Element.NONE;
        this.below = true;
    };
    sprite.NullSprite.prototype.__proto__ = Sprite.prototype;
    sprite.NullSprite.prototype.__constructor__ = Sprite;
    sprite.NullSprite.prototype.canBeCrossed = function (sprite, d) {
        return(true);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Box = function (data) {
        super(data);
        this._inWater = false;
    };
    sprite.Box.prototype.__proto__ = Sprite.prototype;
    sprite.Box.prototype.__constructor__ = Sprite;
    sprite.Box.prototype.show = function () {
        this.mc.stop();
    };
    sprite.Box.prototype.canBePushed = function (s) {
        return(s.id == Element.HERO);
    };
    sprite.Box.prototype.canMove = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        if (!this.board.isValid(_local_4)) {
            return(false);
        }
        return(this.board.get(_local_4).canBeCrossed(_local_3, d));
    };
    sprite.Box.prototype.move = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        var _local_5 = this.board.get(_local_4);
        _local_5.crossed(_local_3, d);
        this.playground.move(this.pos, d, null);
    };
    sprite.Box.prototype.isInWater = function () {
        return(this._inWater);
    };
    sprite.Box.prototype.setInWater = function (b) {
        this._inWater = b;
    };
    sprite.Box.prototype.burn = function () {
        this.mc.gotoAndStop("burn");
        return(new anim.SteppedAnim(this.mc));
    };
    sprite.Box.prototype.endBurn = function () {
        this.destroy();
    };
    if (!gui) {
        gui = new Object();
    }
    gui.Playground = function (parent, dimensions) {
        this._sprites = new Array();
        this._layer = yota.McTop.create(parent);
        this._board = new gui.Board(dimensions);
        this._dim = dimensions.clone();
        this._drawBackground();
        this._drawGround();
        this._drawCounter(this._layer);
    };
    gui.Playground.prototype.setCounterValue = function (c) {
        this._counter.text = c;
    };
    gui.Playground.prototype.dimension = function () {
        return(this._dim.clone());
    };
    gui.Playground.prototype.getGround = function () {
        return(this._ground);
    };
    gui.Playground.prototype.getLayer = function () {
        return(this._layer);
    };
    gui.Playground.prototype._drawBackground = function () {
        var _local_2 = yota.McTop.create(this._layer);
        _local_2.beginFill(Consts.BLACK_BROWN, 100);
        _local_2.moveTo(0, 0);
        _local_2.lineTo(0, Consts.HEIGHT);
        _local_2.lineTo(Consts.WIDTH, Consts.HEIGHT);
        _local_2.lineTo(Consts.WIDTH, 0);
        _local_2.lineTo(0, 0);
        var _local_3 = this._dim.width * Consts.SPRITE_WIDTH;
        var _local_4 = this._dim.height * Consts.SPRITE_HEIGHT;
        this._back = yota.McTop.create(this._layer);
        this._back.beginFill(Consts.BACKGROUND, 100);
        this._back.moveTo(0, 0);
        this._back.lineTo(0, _local_4);
        this._back.lineTo(_local_3, _local_4);
        this._back.lineTo(_local_3, 0);
        this._back.lineTo(0, 0);
        this._back._x = this._horizontalPadding();
        this._back._y = this._verticalPadding();
    };
    gui.Playground.prototype._drawGround = function () {
        var _local_2 = yota.McTop.create(this._layer);
        _local_2._x = this._horizontalPadding();
        _local_2._y = this._verticalPadding();
        this._ground = yota.McTop.create(this._layer);
        this._ground._x = this._horizontalPadding();
        this._ground._y = this._verticalPadding();
        var _local_4 = 0;
        for ( ; _local_4 < this._dim.width ; _local_4++) {
            var _local_3 = yota.McTop.attach(_local_2, "jama_Side");
            _local_3.gotoAndStop("1");
            _local_3._x = _local_4 * 32;
            _local_3._y = 0;
            _local_3 = yota.McTop.attach(_local_2, "jama_Side");
            _local_3.gotoAndStop("3");
            _local_3._x = _local_4 * 32;
            _local_3._y = (this._dim.height - 1) * 32;
        }
        var _local_5 = 0;
        for ( ; _local_5 < this._dim.height ; _local_5++) {
            var _local_3 = yota.McTop.attach(_local_2, "jama_Side");
            _local_3.gotoAndStop("4");
            _local_3._x = 0;
            _local_3._y = _local_5 * 32;
            _local_3 = yota.McTop.attach(_local_2, "jama_Side");
            _local_3.gotoAndStop("2");
            _local_3._x = (this._dim.width - 1) * 32;
            _local_3._y = _local_5 * 32;
        }
        var _local_3 = yota.McTop.attach(_local_2, "jama_Side");
        _local_3.gotoAndStop("5");
        _local_3._x = 0;
        _local_3._y = 0;
        _local_3 = yota.McTop.attach(_local_2, "jama_Side");
        _local_3.gotoAndStop("6");
        _local_3._x = (this._dim.width - 1) * 32;
        _local_3._y = 0;
        _local_3 = yota.McTop.attach(_local_2, "jama_Side");
        _local_3.gotoAndStop("7");
        _local_3._x = (this._dim.width - 1) * 32;
        _local_3._y = (this._dim.height - 1) * 32;
        _local_3 = yota.McTop.attach(_local_2, "jama_Side");
        _local_3.gotoAndStop("8");
        _local_3._x = 0;
        _local_3._y = (this._dim.height - 1) * 32;
    };
    gui.Playground.prototype._horizontalPadding = function () {
        return((Consts.WIDTH - (this._dim.width * Consts.SPRITE_WIDTH)) / 2);
    };
    gui.Playground.prototype._verticalPadding = function () {
        return((Consts.HEIGHT - (this._dim.height * Consts.SPRITE_HEIGHT)) / 2);
    };
    gui.Playground.prototype._drawCounter = function (parent) {
        this._counter = yota.McTop.createTextField(parent);
        var _local_3 = this._counter.getNewTextFormat();
        _local_3["color"] = Consts.COUNTER_COLOR;
        this._counter.setNewTextFormat(_local_3);
    };
    if (!gui) {
        gui = new Object();
    }
    gui.GamePlayground = function (parent, level) {
        this._fade = yota.McTop.create(parent);
        super(parent, level.size);
        this._ended = false;
        this._victory = false;
        this._exitOpened = false;
        this._animControl = new anim.AnimManager();
        this._level = level;
        this._orderedSprites = new Array();
        this._orderedSprites.push(new Array());
        this._orderedSprites.push(new Array());
        this._orderedSprites.push(new Array());
        this._fxLayer = yota.McTop.create(this._layer);
        this._drawPlayground();
        this.refreshPositions();
    };
    gui.GamePlayground.prototype.__proto__ = gui.Playground.prototype;
    gui.GamePlayground.prototype.__constructor__ = gui.Playground;
    gui.GamePlayground.prototype.getLevel = function () {
        return(this._level);
    };
    gui.GamePlayground.prototype.getBoard = function () {
        return(this._board);
    };
    gui.GamePlayground.prototype.setAvatar = function (sprite) {
        this._avatar = sprite;
    };
    gui.GamePlayground.prototype.getCurrentAvatar = function () {
        return(this._avatar);
    };
    gui.GamePlayground.prototype.getGhost = function () {
        return(this._ghost);
    };
    gui.GamePlayground.prototype.getHero = function () {
        return(this._hero);
    };
    gui.GamePlayground.prototype.getLayer = function () {
        return(this._layer);
    };
    gui.GamePlayground.prototype.getFadeLayer = function () {
        return(this._fade);
    };
    gui.GamePlayground.prototype.getFXLayer = function () {
        return(this._fxLayer);
    };
    gui.GamePlayground.prototype.getAnimManager = function () {
        return(this._animControl);
    };
    gui.GamePlayground.prototype.isExitOpen = function () {
        return(this._exitOpened);
    };
    gui.GamePlayground.prototype.move = function (coord, direction, anim) {
        var _local_5 = this._board.get(coord);
        var _local_6 = coord.next(direction);
        this._board.set(_local_6, _local_5);
        if (anim == null) {
            anim = new anim.MoveAnim(_local_5, this.toGuiCoord(_local_6), 10);
        }
        this._animControl.push(anim, 0);
    };
    gui.GamePlayground.prototype.spriteDestroyed = function (sprite) {
        this._sprites.remove(sprite);
        this._board.erase(sprite);
        if (sprite.isMagnet) {
            this._orderedSprites[gui.GamePlayground.MAGNETS].remove(sprite);
        } else if (sprite.isBadGuy) {
            this._orderedSprites[gui.GamePlayground.BADS].remove(sprite);
        } else {
            this._orderedSprites[gui.GamePlayground.MISC].remove(sprite);
        }
        if (((sprite == this._avatar) && (sprite.id != Element.HERO)) && (this._hero.alive)) {
            var _local_3 = new Element(this._avatar);
            _local_3.id = Element.GHOST;
            this._ghost = this._createSprite(_local_3);
            this._avatar = this._ghost;
            this._avatar.show();
            this._placeSprite(this._avatar);
        }
    };
    gui.GamePlayground.prototype.processReactionAfterMove = function () {
        if (this._victory || (this._ended)) {
            var _local_2 = 0;
            for ( ; _local_2 < this._sprites.length ; _local_2++) {
                if (this._sprites[_local_2].id == Element.BRIDGE) {
                    this._sprites[_local_2].update(true);
                }
            }
            return(undefined);
        }
        var _local_3 = 0;
        var _local_4 = 0;
        for ( ; _local_4 < this._orderedSprites.length ; _local_4++) {
            var _local_5 = 0;
            for ( ; _local_5 < this._orderedSprites[_local_4].length ; _local_5++) {
                var _local_6 = this._orderedSprites[_local_4][_local_5];
                if (this._hero.alive) {
                    _local_6.update(true);
                }
                if ((_local_6.id == Element.FRUIT) && (_local_6.alive)) {
                    _local_3++;
                }
            }
        }
        if (_local_3 == 0) {
            this._openExitDoors();
        }
    };
    gui.GamePlayground.prototype.processReaction = function () {
        if (this._victory) {
            return(undefined);
        }
        if (this._ended) {
            return(undefined);
        }
        var _local_2 = 0;
        var _local_3 = 0;
        for ( ; _local_3 < this._orderedSprites.length ; _local_3++) {
            var _local_4 = 0;
            for ( ; _local_4 < this._orderedSprites[_local_3].length ; _local_4++) {
                var _local_5 = this._orderedSprites[_local_3][_local_4];
                _local_5.update(false);
                if ((_local_5.id == Element.FRUIT) && (_local_5.alive)) {
                    _local_2++;
                }
                if (!this._hero.alive) {
                    break;
                }
            }
        }
        if (_local_2 == 0) {
            this._openExitDoors();
        }
    };
    gui.GamePlayground.prototype.activateGhost = function () {
        var _local_2 = new Element(this._hero);
        _local_2.id = Element.GHOST;
        this._ghost = this._createSprite(_local_2);
        this._avatar = this._ghost;
        this._avatar.show();
        this._placeSprite(this._avatar);
        this._hero.sleep();
    };
    gui.GamePlayground.prototype.deactivateGhost = function () {
        var _local_2 = this._avatar;
        this._avatar = this._hero;
        if (this._hero.alive) {
            this._hero.wakeUp();
        }
        if (_local_2.id == Element.GHOST) {
            _local_2.destroy();
        } else if (_local_2.alive) {
            _local_2.release();
        }
    };
    gui.GamePlayground.prototype.toGuiCoord = function (coord) {
        return(new Coord(coord.x * Consts.SPRITE_WIDTH, coord.y * Consts.SPRITE_HEIGHT));
    };
    gui.GamePlayground.prototype.toGlobalGuiCoord = function (coord) {
        return(new Coord(int(this._horizontalPadding()) + (coord.x * Consts.SPRITE_WIDTH), int(this._verticalPadding()) + (coord.y * Consts.SPRITE_HEIGHT)));
    };
    gui.GamePlayground.prototype.refresh = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._sprites.length ; _local_2++) {
            this._sprites[_local_2].redraw();
        }
    };
    gui.GamePlayground.prototype.refreshPositions = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._sprites.length ; _local_2++) {
            var _local_3 = this._sprites[_local_2];
            var _local_4 = this.toGuiCoord(_local_3.pos);
            _local_3.mc._x = _local_4.x;
            _local_3.mc._y = _local_4.y;
            _local_3.redraw();
        }
    };
    gui.GamePlayground.prototype.isEnded = function () {
        return(this._ended);
    };
    gui.GamePlayground.prototype.isVictorious = function () {
        return(this._victory);
    };
    gui.GamePlayground.prototype.victory = function (exit) {
        this._ended = true;
        this._victory = true;
        var _local_3 = new anim.VictoryAnim(exit);
        this._animControl.pushEffect(_local_3);
    };
    gui.GamePlayground.prototype.defeat = function () {
        if (this._ended) {
            return(undefined);
        }
        this._ended = true;
        this._victory = false;
        var _local_2 = new anim.DefeatAnim(this._hero);
        this._animControl.pushEffect(_local_2);
        this._animControl.flush();
    };
    gui.GamePlayground.prototype._drawPlayground = function () {
        var _local_2 = this._level.tiles;
        var _local_3 = 0;
        for ( ; _local_3 < _local_2.length ; _local_3++) {
            var _local_4 = _local_2[_local_3];
            var _local_5 = this._createSprite(_local_4);
            this._placeSprite(_local_5);
        }
        this._createHero();
        var _local_6 = 0;
        for ( ; _local_6 < this._sprites.length ; _local_6++) {
            this._sprites[_local_6].show();
        }
    };
    gui.GamePlayground.prototype._createHero = function () {
        if (this._board.get(this._level.startPos).id != Element.NONE) {
            return(undefined);
        }
        var _local_2 = new Element(null);
        _local_2.id = Element.HERO;
        _local_2.pos.x = this._level.startPos.x;
        _local_2.pos.y = this._level.startPos.y;
        this._hero = this._createSprite(_local_2);
        this._animControl.pushBackground(this._hero.createFlyAnim());
        this._placeSprite(this._hero);
        this._avatar = this._hero;
    };
    gui.GamePlayground.prototype._createSprite = function (data) {
        var _local_3 = null;
        _local_3 = Sprite.create(this._ground, data);
        _local_3.setPlayground(this);
        this._board.set(_local_3.pos, _local_3);
        this._sprites.push(_local_3);
        if (_local_3.isMagnet) {
            Jama.debug("pushing in " + gui.GamePlayground.MAGNETS, "gui.GamePlayground", "src/gui/GamePlayground.mt", 374);
            this._orderedSprites[gui.GamePlayground.MAGNETS].push(_local_3);
            Jama.debug("size = " + this._orderedSprites[gui.GamePlayground.MAGNETS].length, "gui.GamePlayground", "src/gui/GamePlayground.mt", 376);
        } else if (_local_3.isBadGuy) {
            Jama.debug("pushing in " + gui.GamePlayground.BADS, "gui.GamePlayground", "src/gui/GamePlayground.mt", 379);
            this._orderedSprites[gui.GamePlayground.BADS].push(_local_3);
            Jama.debug("size = " + this._orderedSprites[gui.GamePlayground.BADS].length, "gui.GamePlayground", "src/gui/GamePlayground.mt", 381);
        } else {
            Jama.debug("pushing in " + gui.GamePlayground.MISC, "gui.GamePlayground", "src/gui/GamePlayground.mt", 384);
            this._orderedSprites[gui.GamePlayground.MISC].push(_local_3);
            Jama.debug("size = " + this._orderedSprites[gui.GamePlayground.MISC].length, "gui.GamePlayground", "src/gui/GamePlayground.mt", 386);
        }
        return(_local_3);
    };
    gui.GamePlayground.prototype._placeSprite = function (sprite) {
        sprite.mc._x = Consts.SPRITE_WIDTH * sprite.pos.x;
        sprite.mc._y = Consts.SPRITE_HEIGHT * sprite.pos.y;
    };
    gui.GamePlayground.prototype._openExitDoors = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._sprites.length ; _local_2++) {
            if (this._sprites[_local_2].id == Element.EXIT) {
                this._sprites[_local_2].open();
            }
        }
        this._exitOpened = true;
    };
    gui.GamePlayground.MAGNETS = 0;
    gui.GamePlayground.BADS = 1;
    gui.GamePlayground.MISC = 2;
    if (!playlist) {
        playlist = new Object();
    }
    playlist.OrderPane = function (parent) {
        var _local_3 = this;
        this._layer = yota.McTop.attach(parent, "jama_gui_OrderPane");
        this._layer.btnYes.label = "valider";
        this._layer.btnYes.onRelease = Std.callback(_local_3, "_onSubmit");
        this._layer.btnCancel.label = "annuler";
        this._layer.btnCancel.onRelease = Std.callback(_local_3, "_onCancel");
        this._dragOption = null;
        this._pane = yota.McTop.create(this._layer);
        this._options = new Array();
        this._draw();
        this._pane._x = (Consts.WIDTH - this._pane._width) / 2;
        this._pane._y = (Consts.HEIGHT - this._pane._height) / 2;
        this._storeOrderBackup();
    };
    playlist.OrderPane.prototype.destroy = function () {
        this._layer.removeMovieClip();
    };
    playlist.OrderPane.prototype.size = function () {
        return(this._options.length);
    };
    playlist.OrderPane.prototype.getMovieClip = function () {
        return(this._pane);
    };
    playlist.OrderPane.prototype.update = function (tmod) {
        if (this._dragOption != null) {
            var _local_3 = this._dragOption.getMovieClip();
            var _local_4 = int(_local_3._y / 20);
            if (_local_4 < 0) {
                _local_4 = 0;
            }
            if (_local_4 >= this._options.length) {
                _local_4 = this._options.length - 1;
            }
            if (this._options[_local_4].getLabel() != this._dragOption.getLabel()) {
                var _local_5 = this._options[_local_4];
                this._swapOptions(this._options[_local_4], this._dragOption);
                _local_5.getMovieClip()._y = 20 * _local_5.getIndex();
            }
        }
    };
    playlist.OrderPane.prototype.startDrag = function (option) {
        option.getMovieClip().swapDepths(this._pane.getNextHighestDepth());
        option.getMovieClip().startDrag();
        this._dragOption = option;
    };
    playlist.OrderPane.prototype.stopDrag = function (option) {
        option.getMovieClip().stopDrag();
        option.getMovieClip()._y = 20 * option.getIndex();
        option.getMovieClip()._x = 0;
        this._dragOption = null;
    };
    playlist.OrderPane.prototype._storeOrderBackup = function () {
        this._oldOrder = new Array();
        var _local_2 = 0;
        for ( ; _local_2 < Consts.listOrder.length ; _local_2++) {
            var _local_3 = Consts.listOrder[_local_2];
            this._oldOrder.push({label:_local_3.label, key:_local_3["key"]});
        }
    };
    playlist.OrderPane.prototype._onSubmit = function () {
        this.onSubmit();
    };
    playlist.OrderPane.prototype._onCancel = function () {
        Consts.listOrder = this._oldOrder;
        this.onCancel();
    };
    playlist.OrderPane.prototype._draw = function () {
        var _local_2 = 0;
        for ( ; _local_2 < Consts.listOrder.length ; _local_2++) {
            this._options.push(new playlist.OrderButton(this, Consts.listOrder[_local_2], this.size()));
        }
    };
    playlist.OrderPane.prototype._swapOptions = function (o1, o2) {
        var _local_4 = o1.getIndex();
        o1.setIndex(o2.getIndex());
        o2.setIndex(_local_4);
        this._options[o1.getIndex()] = o1;
        this._options[o2.getIndex()] = o2;
        Consts.listOrder[o1.getIndex()] = o1.getOrder();
        Consts.listOrder[o2.getIndex()] = o2.getOrder();
        Consts.updateListOrderCompressed();
    };
    NetClient = function (main) {
        super();
        this._identified = false;
        this._jama = main;
        this._requestId = 0;
        this._dataReceived = false;
    };
    NetClient.prototype.__proto__ = yota.CbeeClient.prototype;
    NetClient.prototype.__constructor__ = yota.CbeeClient;
    NetClient.prototype.identify = function (login, pass, cb) {
        var _local_5 = new yota.CbeeRequest("Ident", "k");
        _local_5.xml.set("l", login);
        _local_5.xml.set("m", pass);
        _local_5.xml.set("s", "");
        _local_5.xml.set("force", "1");
        _local_5.callback = cb;
        this.sendRequest(_local_5);
    };
    NetClient.prototype.isReady = function () {
        return(this._identified && (this._dataReceived));
    };
    NetClient.prototype.onIdentSuccess = function () {
        Jama.debug("On ident success", "NetClient", "src/NetClient.mt", 45);
        this._identified = true;
        var _local_2 = new yota.CbeeRequest("UserData", "dt");
        _local_2.callback = Std.callback(this, "onDataReceived");
        this.sendRequest(_local_2);
    };
    NetClient.prototype.onDataReceived = function (xml) {
        Jama.debug("UserData = " + xml.toString(), "NetClient", "src/NetClient.mt", 55);
        Jama.setPlayer(new PlayerInfo(xml));
        Consts.setParams(xml.get("p"));
        this._dataReceived = true;
    };
    NetClient.prototype.onIdentFailure = function (xml) {
        var _local_3 = new gui.dialog.ErrorDialog(this._jama.newLayer());
        _local_3.setText(Consts.IDENT_ERROR);
        _local_3.draw();
        this._jama.exit();
    };
    NetClient.prototype.onConnect = function (success) {
        if (!success) {
            Jama.debug("ON CONNECT success=" + success, "NetClient", "src/NetClient.mt", 78);
            var _local_3 = new gui.dialog.ErrorDialog(this._jama.newLayer());
            _local_3.setText(Consts.CONNECTION_FAILED);
            _local_3.draw();
            this._jama.exit();
            return(undefined);
        }
        this._jama.setState(new state.Connected(this._jama));
    };
    NetClient.prototype.connect = function (host, port) {
        if ((this._frusionClient == null) && (this._gameClient == null)) {
            XmlSocket_connect.call(this, host, port);
        }
    };
    NetClient.prototype.slotList = function (start, limit, cb) {
        var _local_5 = new yota.CbeeRequest("ListSlot", "l");
        _local_5.xml.set("s", String(start));
        _local_5.xml.set("l", String(limit));
        _local_5.callback = cb;
        this.sendRequest(_local_5);
    };
    NetClient.prototype.slotSave = function (level, cb) {
        var _local_4 = new yota.CbeeRequest("SaveSlot", "m");
        if (level.id > 0) {
            _local_4.xml.set("i", String(level.id));
        }
        _local_4.xml.set("t", level.title);
        _local_4.xml.appendChild(new XMLNode(2, level.dump()));
        _local_4.callback = cb;
        this.sendRequest(_local_4);
    };
    NetClient.prototype.slotRename = function (level, cb) {
        if (level.id <= 0) {
            Jama.debug("ERROR: renaming unknown level", "NetClient", "src/NetClient.mt", 125);
        }
        var _local_4 = new yota.CbeeRequest("RenameSlot", "r");
        _local_4.xml.set("i", String(level.id));
        _local_4.xml.set("t", level.title);
        _local_4.callback = cb;
        this.sendRequest(_local_4);
    };
    NetClient.prototype.slotSubmit = function (level, cb) {
        var _local_4 = new yota.CbeeRequest("SubmitSlot", "o");
        _local_4.xml.set("i", String(level.id));
        _local_4.xml.set("s", String(level.bestScore));
        _local_4.callback = cb;
        this.sendRequest(_local_4);
    };
    NetClient.prototype.slotFree = function (id, cb) {
        var _local_4 = new yota.CbeeRequest("FreeSlot", "n");
        _local_4.xml.set("i", String(id));
        _local_4.callback = cb;
        this.sendRequest(_local_4);
    };
    NetClient.prototype.getLevel = function (id, cb) {
        var _local_4 = new yota.CbeeRequest("GetLevel", "q");
        _local_4.xml.set("i", String(id));
        _local_4.callback = cb;
        this.sendRequest(_local_4);
    };
    NetClient.prototype.saveScore = function (gm, cb) {
        var _local_4 = new yota.CbeeRequest("SaveScore", "s");
        _local_4.xml.set("i", String(gm.getLevel().id));
        var _local_5 = (String(gm.countMoves()) + ":") + (gm.isVictorious() ? "1" : "0");
        _local_4.xml.set("s", _local_5);
        _local_4.xml.set("p", String(gm.spiritSpaces()));
        var _local_6 = gm.getMovements().join("");
        _local_4.xml.appendChild(new XMLNode(2, _local_6));
        _local_4.callback = cb;
        this.sendRequest(_local_4);
    };
    NetClient.prototype.listLevels = function (start, limit, cb) {
        var _local_5 = new yota.CbeeRequest("ListLevels", "t");
        _local_5.xml.set("s", String(start));
        _local_5.xml.set("l", String(limit));
        _local_5.xml.set("o", Consts.listOrderCompressed);
        _local_5.callback = cb;
        this.sendRequest(_local_5);
    };
    NetClient.prototype.searchLevels = function (s, start, limit, cb) {
        var _local_6 = new yota.CbeeRequest("SearchLevels", "x");
        _local_6.xml.set("q", s);
        _local_6.xml.set("s", String(start));
        _local_6.xml.set("l", String(limit));
        _local_6.xml.set("o", Consts.listOrderCompressed);
        _local_6.callback = cb;
        this.sendRequest(_local_6);
    };
    NetClient.prototype.listStats = function (mode, start, limit, cb) {
        var _local_6 = new yota.CbeeRequest("ListStats", "p");
        _local_6.xml.set("s", String(start));
        _local_6.xml.set("l", String(limit));
        _local_6.xml.set("sm", mode);
        _local_6.callback = cb;
        this.sendRequest(_local_6);
    };
    NetClient.prototype.saveParameters = function (cb) {
        var _local_3 = new yota.CbeeRequest("SaveParams", "u");
        _local_3.xml.set("p", Consts.getParams());
        _local_3.callback = cb;
        this.sendRequest(_local_3);
    };
    NetClient.prototype.saveAdventure = function (cb) {
        var _local_3 = new yota.CbeeRequest("SaveAdventure", "w");
        _local_3.xml.set("dt", Jama.getPlayer().adventureToString());
        _local_3.callback = cb;
        this.sendRequest(_local_3);
    };
    XmlSocket_connect = XMLSocket.prototype.connect;
    if (!anim) {
        anim = new Object();
    }
    anim.CallbackAnim = function (c) {
        this._callback = c;
    };
    anim.CallbackAnim.prototype.__proto__ = anim.MoveAnim.prototype;
    anim.CallbackAnim.prototype.__constructor__ = anim.MoveAnim;
    anim.CallbackAnim.prototype.update = function (tmod) {
        this._callback();
        return(false);
    };
    PlayerInfo = function (xml) {
        this.items = new Hash();
        this.login = xml.get("l");
        this.canCreateLevel = xml.get("bn") == "1";
        this._setAvailableItemsFromXmlAttribute(xml.get("it"));
        this._setMaxLevelSizeFromXmlAttribute(xml.get("z"));
        this._setMaxSlotsNumberFromXmlAttribute(xml.get("ms"));
        this.adventureSave = new adventure.Data(xml.get("dt"));
    };
    PlayerInfo.prototype.canUseItem = function (id) {
        return(this.items.exists(String(id)) && (this.items.get(String(id)) > 0));
    };
    PlayerInfo.prototype.canUseFruit = function (value) {
        return(this.items.exists(String(Element.FRUIT)) && (this.items.get(String(Element.FRUIT)) >= value));
    };
    PlayerInfo.prototype.toString = function () {
        var itemsStr = "";
        var _local_2 = function (k, v) {
            itemsStr = itemsStr + (((k + "=") + Std.toString(v)) + " ");
        };
        this.items.iter(_local_2);
        var _local_3 = "";
        _local_3 = _local_3 + (("Player = " + this.login) + newline);
        _local_3 = _local_3 + (("* items            = " + itemsStr) + newline);
        _local_3 = _local_3 + (("* slotsNumber      = " + this.slotsNumber) + newline);
        return(_local_3);
    };
    PlayerInfo.prototype._setAvailableItemsFromXmlAttribute = function (it) {
        var _local_3 = it.split(";");
        var _local_4 = 0;
        for ( ; _local_4 < _local_3.length ; _local_4++) {
            if (_local_3[_local_4] != "") {
                var _local_5 = Element.idOf(_local_3[_local_4]);
                if (_local_3[_local_4].substr(0, 5) == "Fruit") {
                    var _local_6 = _local_3[_local_4].charAt(5);
                    this.items.set(String(Element.FRUIT), Std.parseInt(_local_6, 10));
                } else {
                    this.items.set(String(_local_5), 1);
                }
            }
        }
    };
    PlayerInfo.prototype._setMaxLevelSizeFromXmlAttribute = function (att) {
        var _local_3 = Std.parseInt(att, 10);
        this.maxLevelHeight = _local_3;
        this.maxLevelWidth = _local_3;
        if (this.maxLevelHeight > Consts.MAX_LEVEL_HEIGHT) {
            this.maxLevelHeight = Consts.MAX_LEVEL_HEIGHT;
        }
        if (this.maxLevelWidth > Consts.MAX_LEVEL_WIDTH) {
            this.maxLevelWidth = Consts.MAX_LEVEL_WIDTH;
        }
    };
    PlayerInfo.prototype._setMaxSlotsNumberFromXmlAttribute = function (att) {
        this.slotsNumber = Std.parseInt(att, 10);
    };
    PlayerInfo.prototype.adventureToString = function () {
        return(this.adventureSave.toString());
    };
    if (!yota) {
        yota = new Object();
    }
    yota.XmlToHtml = function () {
    };
    yota.XmlToHtml.process = function (xml) {
        var _local_3 = xml.firstChild;
        if ((_local_3 == null) && (xml.nodeName == null)) {
            return(xml.toString());
        }
        var _local_4 = "";
        while (_local_3 != null) {
            if (_local_3.nodeName == null) {
                _local_4 = _local_4 + _local_3.nodeValue;
            } else {
                switch (_local_3.nodeName) {
                    case "p" : 
                        _local_4 = _local_4 + ((yota.XmlToHtml._openNode(_local_3) + yota.XmlToHtml.process(_local_3)) + "</p><br/>");
                        break;
                    case "ul" : 
                        _local_4 = _local_4 + ((yota.XmlToHtml._openNode(_local_3) + yota.XmlToHtml.process(_local_3)) + "</ul><br/>");
                        break;
                    default : 
                        _local_4 = _local_4 + ((((yota.XmlToHtml._openNode(_local_3) + yota.XmlToHtml.process(_local_3)) + "</") + _local_3.nodeName) + ">");
                        break;
                }
            }
            _local_3 = _local_3.nextSibling;
        }
        return(_local_4);
    };
    yota.XmlToHtml._openNode = function (xml) {
        var result = ("<" + xml.nodeName);
        var _local_3 = function (k, v) {
            result = result + ((((" " + k) + "=\"") + v) + "\"");
        };
        xml.attributesIter(_local_3);
        result = result + ">";
        return(result);
    };
    if (!yota) {
        yota = new Object();
    }
    yota.HtmlString = function () {
    };
    yota.HtmlString.test = function () {
        Jama.debug(yota.HtmlString.decode("Bla blah & blah blah"), "yota.HtmlString", "yota/HtmlString.mt", 5);
        Jama.debug(yota.HtmlString.decode("Blah&amp;Blah"), "yota.HtmlString", "yota/HtmlString.mt", 6);
        Jama.debug(yota.HtmlString.decode("&apos;"), "yota.HtmlString", "yota/HtmlString.mt", 7);
    };
    yota.HtmlString.decode = function (s) {
        var _local_3 = yota.HtmlString.getTr();
        var _local_4 = 0;
        while (_local_4 = s.indexOf("&", _local_4) , _local_4 != -1) {
            var _local_5 = s.indexOf(";", _local_4);
            if (_local_5 != -1) {
                var _local_6 = s.substr(_local_4, (_local_5 - _local_4) + 1);
                var _local_7 = _local_3.get(_local_6);
                if (_local_7 != null) {
                    s = (s.substr(0, _local_4) + _local_7) + s.substring(_local_5 + 1);
                }
            }
            _local_4++;
        }
        return(s);
    };
    yota.HtmlString.getRt = function () {
        if (yota.HtmlString.RT == null) {
            yota.HtmlString.RT = new Hash();
            yota.HtmlString.RT.set(" ", "&nbsp;");
            yota.HtmlString.RT.set("¡", "&iexcl;");
            yota.HtmlString.RT.set("¢", "&cent;");
            yota.HtmlString.RT.set("£", "&pound;");
            yota.HtmlString.RT.set("¤", "&curren;");
            yota.HtmlString.RT.set("¥", "&yen;");
            yota.HtmlString.RT.set("¦", "&brvbar;");
            yota.HtmlString.RT.set("§", "&sect;");
            yota.HtmlString.RT.set("¨", "&uml;");
            yota.HtmlString.RT.set("©", "&copy;");
            yota.HtmlString.RT.set("ª", "&ordf;");
            yota.HtmlString.RT.set("«", "&laquo;");
            yota.HtmlString.RT.set("¬", "&not;");
            yota.HtmlString.RT.set("­", "&shy;");
            yota.HtmlString.RT.set("®", "&reg;");
            yota.HtmlString.RT.set("¯", "&macr;");
            yota.HtmlString.RT.set("°", "&deg;");
            yota.HtmlString.RT.set("±", "&plusmn;");
            yota.HtmlString.RT.set("²", "&sup2;");
            yota.HtmlString.RT.set("³", "&sup3;");
            yota.HtmlString.RT.set("'", "&apos;");
            yota.HtmlString.RT.set("´", "&acute;");
            yota.HtmlString.RT.set("µ", "&micro;");
            yota.HtmlString.RT.set("¶", "&para;");
            yota.HtmlString.RT.set("·", "&middot;");
            yota.HtmlString.RT.set("¸", "&cedil;");
            yota.HtmlString.RT.set("¹", "&sup1;");
            yota.HtmlString.RT.set("º", "&ordm;");
            yota.HtmlString.RT.set("»", "&raquo;");
            yota.HtmlString.RT.set("¼", "&frac14;");
            yota.HtmlString.RT.set("½", "&frac12;");
            yota.HtmlString.RT.set("¾", "&frac34;");
            yota.HtmlString.RT.set("¿", "&iquest;");
            yota.HtmlString.RT.set("À", "&Agrave;");
            yota.HtmlString.RT.set("Á", "&Aacute;");
            yota.HtmlString.RT.set("Â", "&Acirc;");
            yota.HtmlString.RT.set("Ã", "&Atilde;");
            yota.HtmlString.RT.set("Ä", "&Auml;");
            yota.HtmlString.RT.set("Å", "&Aring;");
            yota.HtmlString.RT.set("Æ", "&AElig;");
            yota.HtmlString.RT.set("Ç", "&Ccedil;");
            yota.HtmlString.RT.set("È", "&Egrave;");
            yota.HtmlString.RT.set("É", "&Eacute;");
            yota.HtmlString.RT.set("Ê", "&Ecirc;");
            yota.HtmlString.RT.set("Ë", "&Euml;");
            yota.HtmlString.RT.set("Ì", "&Igrave;");
            yota.HtmlString.RT.set("Í", "&Iacute;");
            yota.HtmlString.RT.set("Î", "&Icirc;");
            yota.HtmlString.RT.set("Ï", "&Iuml;");
            yota.HtmlString.RT.set("Ð", "&ETH;");
            yota.HtmlString.RT.set("Ñ", "&Ntilde;");
            yota.HtmlString.RT.set("Ò", "&Ograve;");
            yota.HtmlString.RT.set("Ó", "&Oacute;");
            yota.HtmlString.RT.set("Ô", "&Ocirc;");
            yota.HtmlString.RT.set("Õ", "&Otilde;");
            yota.HtmlString.RT.set("Ö", "&Ouml;");
            yota.HtmlString.RT.set("×", "&times;");
            yota.HtmlString.RT.set("Ø", "&Oslash;");
            yota.HtmlString.RT.set("Ù", "&Ugrave;");
            yota.HtmlString.RT.set("Ú", "&Uacute;");
            yota.HtmlString.RT.set("Û", "&Ucirc;");
            yota.HtmlString.RT.set("Ü", "&Uuml;");
            yota.HtmlString.RT.set("Ý", "&Yacute;");
            yota.HtmlString.RT.set("Þ", "&THORN;");
            yota.HtmlString.RT.set("ß", "&szlig;");
            yota.HtmlString.RT.set("à", "&agrave;");
            yota.HtmlString.RT.set("á", "&aacute;");
            yota.HtmlString.RT.set("â", "&acirc;");
            yota.HtmlString.RT.set("ã", "&atilde;");
            yota.HtmlString.RT.set("ä", "&auml;");
            yota.HtmlString.RT.set("å", "&aring;");
            yota.HtmlString.RT.set("æ", "&aelig;");
            yota.HtmlString.RT.set("ç", "&ccedil;");
            yota.HtmlString.RT.set("è", "&egrave;");
            yota.HtmlString.RT.set("é", "&eacute;");
            yota.HtmlString.RT.set("ê", "&ecirc;");
            yota.HtmlString.RT.set("ë", "&euml;");
            yota.HtmlString.RT.set("ì", "&igrave;");
            yota.HtmlString.RT.set("í", "&iacute;");
            yota.HtmlString.RT.set("î", "&icirc;");
            yota.HtmlString.RT.set("ï", "&iuml;");
            yota.HtmlString.RT.set("ð", "&eth;");
            yota.HtmlString.RT.set("ñ", "&ntilde;");
            yota.HtmlString.RT.set("ò", "&ograve;");
            yota.HtmlString.RT.set("ó", "&oacute;");
            yota.HtmlString.RT.set("ô", "&ocirc;");
            yota.HtmlString.RT.set("õ", "&otilde;");
            yota.HtmlString.RT.set("ö", "&ouml;");
            yota.HtmlString.RT.set("÷", "&divide;");
            yota.HtmlString.RT.set("ø", "&oslash;");
            yota.HtmlString.RT.set("ù", "&ugrave;");
            yota.HtmlString.RT.set("ú", "&uacute;");
            yota.HtmlString.RT.set("û", "&ucirc;");
            yota.HtmlString.RT.set("ü", "&uuml;");
            yota.HtmlString.RT.set("ý", "&yacute;");
            yota.HtmlString.RT.set("þ", "&thorn;");
            yota.HtmlString.RT.set("ÿ", "&yuml;");
            yota.HtmlString.RT.set("\"", "&quot;");
            yota.HtmlString.RT.set("<", "&lt;");
            yota.HtmlString.RT.set(">", "&gt;");
            yota.HtmlString.RT.set("&", "&amp;");
        }
        return(yota.HtmlString.RT);
    };
    yota.HtmlString.getTr = function () {
        if (yota.HtmlString.TR == null) {
            yota.HtmlString.TR = new Hash();
            yota.HtmlString.TR.set("&nbsp;", " ");
            yota.HtmlString.TR.set("&iexcl;", "¡");
            yota.HtmlString.TR.set("&cent;", "¢");
            yota.HtmlString.TR.set("&pound;", "£");
            yota.HtmlString.TR.set("&curren;", "¤");
            yota.HtmlString.TR.set("&yen;", "¥");
            yota.HtmlString.TR.set("&brvbar;", "¦");
            yota.HtmlString.TR.set("&sect;", "§");
            yota.HtmlString.TR.set("&uml;", "¨");
            yota.HtmlString.TR.set("&copy;", "©");
            yota.HtmlString.TR.set("&ordf;", "ª");
            yota.HtmlString.TR.set("&laquo;", "«");
            yota.HtmlString.TR.set("&not;", "¬");
            yota.HtmlString.TR.set("&shy;", "­");
            yota.HtmlString.TR.set("&reg;", "®");
            yota.HtmlString.TR.set("&macr;", "¯");
            yota.HtmlString.TR.set("&deg;", "°");
            yota.HtmlString.TR.set("&plusmn;", "±");
            yota.HtmlString.TR.set("&sup2;", "²");
            yota.HtmlString.TR.set("&sup3;", "³");
            yota.HtmlString.TR.set("&apos;", "'");
            yota.HtmlString.TR.set("&acute;", "´");
            yota.HtmlString.TR.set("&micro;", "µ");
            yota.HtmlString.TR.set("&para;", "¶");
            yota.HtmlString.TR.set("&middot;", "·");
            yota.HtmlString.TR.set("&cedil;", "¸");
            yota.HtmlString.TR.set("&sup1;", "¹");
            yota.HtmlString.TR.set("&ordm;", "º");
            yota.HtmlString.TR.set("&raquo;", "»");
            yota.HtmlString.TR.set("&frac14;", "¼");
            yota.HtmlString.TR.set("&frac12;", "½");
            yota.HtmlString.TR.set("&frac34;", "¾");
            yota.HtmlString.TR.set("&iquest;", "¿");
            yota.HtmlString.TR.set("&Agrave;", "À");
            yota.HtmlString.TR.set("&Aacute;", "Á");
            yota.HtmlString.TR.set("&Acirc;", "Â");
            yota.HtmlString.TR.set("&Atilde;", "Ã");
            yota.HtmlString.TR.set("&Auml;", "Ä");
            yota.HtmlString.TR.set("&Aring;", "Å");
            yota.HtmlString.TR.set("&AElig;", "Æ");
            yota.HtmlString.TR.set("&Ccedil;", "Ç");
            yota.HtmlString.TR.set("&Egrave;", "È");
            yota.HtmlString.TR.set("&Eacute;", "É");
            yota.HtmlString.TR.set("&Ecirc;", "Ê");
            yota.HtmlString.TR.set("&Euml;", "Ë");
            yota.HtmlString.TR.set("&Igrave;", "Ì");
            yota.HtmlString.TR.set("&Iacute;", "Í");
            yota.HtmlString.TR.set("&Icirc;", "Î");
            yota.HtmlString.TR.set("&Iuml;", "Ï");
            yota.HtmlString.TR.set("&ETH;", "Ð");
            yota.HtmlString.TR.set("&Ntilde;", "Ñ");
            yota.HtmlString.TR.set("&Ograve;", "Ò");
            yota.HtmlString.TR.set("&Oacute;", "Ó");
            yota.HtmlString.TR.set("&Ocirc;", "Ô");
            yota.HtmlString.TR.set("&Otilde;", "Õ");
            yota.HtmlString.TR.set("&Ouml;", "Ö");
            yota.HtmlString.TR.set("&times;", "×");
            yota.HtmlString.TR.set("&Oslash;", "Ø");
            yota.HtmlString.TR.set("&Ugrave;", "Ù");
            yota.HtmlString.TR.set("&Uacute;", "Ú");
            yota.HtmlString.TR.set("&Ucirc;", "Û");
            yota.HtmlString.TR.set("&Uuml;", "Ü");
            yota.HtmlString.TR.set("&Yacute;", "Ý");
            yota.HtmlString.TR.set("&THORN;", "Þ");
            yota.HtmlString.TR.set("&szlig;", "ß");
            yota.HtmlString.TR.set("&agrave;", "à");
            yota.HtmlString.TR.set("&aacute;", "á");
            yota.HtmlString.TR.set("&acirc;", "â");
            yota.HtmlString.TR.set("&atilde;", "ã");
            yota.HtmlString.TR.set("&auml;", "ä");
            yota.HtmlString.TR.set("&aring;", "å");
            yota.HtmlString.TR.set("&aelig;", "æ");
            yota.HtmlString.TR.set("&ccedil;", "ç");
            yota.HtmlString.TR.set("&egrave;", "è");
            yota.HtmlString.TR.set("&eacute;", "é");
            yota.HtmlString.TR.set("&ecirc;", "ê");
            yota.HtmlString.TR.set("&euml;", "ë");
            yota.HtmlString.TR.set("&igrave;", "ì");
            yota.HtmlString.TR.set("&iacute;", "í");
            yota.HtmlString.TR.set("&icirc;", "î");
            yota.HtmlString.TR.set("&iuml;", "ï");
            yota.HtmlString.TR.set("&eth;", "ð");
            yota.HtmlString.TR.set("&ntilde;", "ñ");
            yota.HtmlString.TR.set("&ograve;", "ò");
            yota.HtmlString.TR.set("&oacute;", "ó");
            yota.HtmlString.TR.set("&ocirc;", "ô");
            yota.HtmlString.TR.set("&otilde;", "õ");
            yota.HtmlString.TR.set("&ouml;", "ö");
            yota.HtmlString.TR.set("&divide;", "÷");
            yota.HtmlString.TR.set("&oslash;", "ø");
            yota.HtmlString.TR.set("&ugrave;", "ù");
            yota.HtmlString.TR.set("&uacute;", "ú");
            yota.HtmlString.TR.set("&ucirc;", "û");
            yota.HtmlString.TR.set("&uuml;", "ü");
            yota.HtmlString.TR.set("&yacute;", "ý");
            yota.HtmlString.TR.set("&thorn;", "þ");
            yota.HtmlString.TR.set("&yuml;", "ÿ");
            yota.HtmlString.TR.set("&quot;", "\"");
            yota.HtmlString.TR.set("&lt;", "<");
            yota.HtmlString.TR.set("&gt;", ">");
            yota.HtmlString.TR.set("&amp;", "&");
        }
        return(yota.HtmlString.TR);
    };
    yota.HtmlString.TR = null;
    yota.HtmlString.RT = null;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Lurker = function (data) {
        super(data);
        this.below = true;
        this.isBadGuy = true;
    };
    sprite.Lurker.prototype.__proto__ = Sprite.prototype;
    sprite.Lurker.prototype.__constructor__ = Sprite;
    sprite.Lurker.prototype.setOrientation = function (d) {
        this.orientation = d;
        this.mc.gotoAndStop(Direction.nameOf(d));
    };
    sprite.Lurker.prototype.show = function () {
        this.mc.stop();
        this.setOrientation(this.orientation);
        this.subMc.gotoAndStop("1");
    };
    sprite.Lurker.prototype.showEditor = function () {
        this.orientation = Direction.SOUTH;
        this.show();
    };
    sprite.Lurker.prototype.update = function (onmove) {
        if (this.board.getOver(this.pos).id == Element.BOX) {
            return(undefined);
        }
        var _local_3 = this.pos.clone().next(this.orientation);
        while (this.board.isValid(_local_3)) {
            var _local_4 = this.board.get(_local_3);
            if (((_local_4.id == Element.HERO) || (_local_4.id == Element.LOUKI)) || (_local_4.id == Element.KOHL)) {
                if (_local_4.alive && (!_local_4.attractedByMagnet)) {
                    this._shot(_local_4);
                    _local_4.die();
                }
                return(undefined);
            } else if (this._canBlockShot(_local_4)) {
                return(undefined);
            }
            _local_3 = _local_3.next(this.orientation);
        }
    };
    sprite.Lurker.prototype.canBeCrossed = function (s, d) {
        return((s.id == Element.BOX) || (s.id == Element.HERO));
    };
    sprite.Lurker.prototype._shot = function (s) {
        var _local_3 = this.pos.next(this.orientation);
        var _local_4 = 0;
        while (this.board.isValid(_local_3)) {
            _local_4++;
            var _local_5 = this.board.get(_local_3);
            if (_local_5.equals(s)) {
                break;
            }
            if (this._canBlockShot(_local_5)) {
                break;
            }
            _local_3 = _local_3.next(this.orientation);
        }
        this.mc.gotoAndStop(Direction.nameOf(this.orientation) + "Shot");
        this.subMc.play();
        this.playground.getAnimManager().pushEffect(new anim.SteppedAnim(this.subMc));
        _local_3 = _local_3.next(Direction.oposite(this.orientation));
        var _local_6 = new anim.LurkerShotAnim(this, this.playground.toGuiCoord(_local_3), _local_4);
        this.playground.getAnimManager().pushEffect(_local_6);
    };
    sprite.Lurker.prototype._canBlockShot = function (s) {
        return(!s.below);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.BoxFallInWaterAnim = function (water, box) {
        super(water.mc);
        this._started = false;
        this._water = water;
        this._box = box;
    };
    anim.BoxFallInWaterAnim.prototype.__proto__ = anim.SteppedAnim.prototype;
    anim.BoxFallInWaterAnim.prototype.__constructor__ = anim.SteppedAnim;
    anim.BoxFallInWaterAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._box.destroy();
            this._water.mc.gotoAndStop("fallBox");
            this._step = this._anim._currentframe;
            if (this._water.hasWaterBelow()) {
                this._water.mc.mask.gotoAndStop(2);
            } else {
                this._water.mc.mask.gotoAndStop(1);
            }
            this._started = true;
        }
        return(anim_SteppedAnim_update.call(this, tmod));
    };
    if (!statlist) {
        statlist = new Object();
    }
    statlist.StatsPane = function (parent) {
        this._layer = yota.McTop.create(parent);
        this._layer._y = 50;
        this._stats = new Array();
    };
    statlist.StatsPane.prototype.addStat = function (s) {
        var _local_3 = this._createStatLine(s);
        _local_3._y = (this._stats.length - 1) * _local_3._height;
        this._stats.push(_local_3);
    };
    statlist.StatsPane.prototype.clear = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._stats.length ; _local_2++) {
            this._stats[_local_2].removeMovieClip();
        }
        this._stats = new Array();
    };
    statlist.StatsPane.prototype._createStatLine = function (stat) {
        var _local_3 = yota.McTop.create(this._layer);
        var _local_4 = yota.McTop.createTextField(_local_3);
        _local_4._x = 5;
        _local_4._width = 305;
        _local_4.selectable = false;
        var _local_5 = _local_4.getTextFormat();
        _local_5["color"] = Consts.BLACK_BROWN;
        _local_4.setNewTextFormat(_local_5);
        _local_4.text = stat.col1;
        var _local_6 = yota.McTop.createTextField(_local_3);
        _local_6._x = 320;
        _local_6._width = 60;
        _local_6.selectable = false;
        var _local_7 = _local_6.getTextFormat();
        _local_7.align = "center";
        _local_7["color"] = Consts.BLACK_BROWN;
        _local_6.setNewTextFormat(_local_7);
        _local_6.text = stat.col2;
        return(_local_3);
    };
    if (!game) {
        game = new Object();
    }
    game.State = function (main, level) {
        this._jama = main;
        this._level = level;
        var _local_4 = main.newLayer();
        this._playGround = new gui.GamePlayground(_local_4, level);
        this._gameManager = new game.GameManager(this._playGround);
        this._ended = false;
        this._gameManager.onVictory = Std.callback(this, "_done");
        this._gameManager.onDefeat = Std.callback(this, "_loose");
        this._gameManager.onAbandon = Std.callback(this, "_done");
        this._gameManager.onRestart = Std.callback(this, "_retry");
        this._infoDialogEscape = null;
        if (Consts.showInfoEsc) {
            this._infoDialogEscape = new gui.dialog.EscapeDialog(_local_4, this._jama);
            var self = this;
            this._infoDialogEscape.onClose = function () {
                self._infoDialogEscape = null;
            };
        }
    };
    game.State.prototype.setBackState = function (st) {
        this._backState = st;
    };
    game.State.prototype.update = function (tmod) {
        if (this._infoDialogEscape != null) {
            return(undefined);
        }
        if (!this._ended) {
            this._gameManager.update(tmod);
        }
    };
    game.State.prototype._loose = function () {
        this._dialog = new gui.dialog.Confirm(this._playGround.getLayer());
        this._dialog.onValidate = Std.callback(this, "_retry");
        this._dialog.onCancel = Std.callback(this, "_done");
        this._dialog.setText("Perdu ! Recommencer le niveau ?");
    };
    game.State.prototype._done = function () {
        if (this._dialog != null) {
            this._dialog.destroy();
        }
        this._dialog = null;
        this._ended = true;
        this._jama.network().saveScore(this._gameManager, Std.callback(this, "_backToList"));
    };
    game.State.prototype._retry = function () {
        if (this._dialog != null) {
            this._dialog.destroy();
        }
        this._dialog = null;
        this._ended = true;
        this._jama.network().saveScore(this._gameManager, Std.callback(this, "_doRetry"));
    };
    game.State.prototype._doRetry = function (xml) {
        var _local_3 = new game.State(this._jama, this._level);
        _local_3.setBackState(this._backState);
        this._jama.setState(_local_3);
    };
    game.State.prototype._backToList = function (xml) {
        var _local_3 = new playlist.State(this._jama, this._backState);
        this._jama.setState(_local_3);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.AnimManager = function () {
        this._anims = new anim.AnimationController();
        this._quick = new anim.ParallelAnimations();
        this._effects = new anim.AnimationController();
        this._persist = new anim.AnimationController();
    };
    anim.AnimManager.prototype.flush = function () {
        if (!this._quick.isEmpty()) {
            this._anims.push(this._quick);
        }
        if (!this._effects.isEmpty()) {
            this._anims.push(this._effects);
        }
        this._quick = new anim.ParallelAnimations();
        this._effects = new anim.AnimationController();
    };
    anim.AnimManager.prototype.push = function (anim, delay) {
        this._quick.push(anim, delay);
    };
    anim.AnimManager.prototype.pushBackground = function (anim) {
        this._persist.push(anim);
    };
    anim.AnimManager.prototype.pushEffect = function (anim) {
        this._effects.push(anim);
    };
    anim.AnimManager.prototype.update = function (tmod) {
        this._persist.update(tmod);
        return(this._anims.update(tmod));
    };
    anim.AnimManager.prototype.isEmpty = function () {
        return((this._anims.isEmpty() && (this._effects.isEmpty())) && (this._quick.isEmpty()));
    };
    if (!anim) {
        anim = new Object();
    }
    anim.HeroBurn = function (hero) {
        this._hero = hero;
        this._state = anim.HeroBurn._INIT;
    };
    anim.HeroBurn.prototype.update = function (tmod) {
        switch (this._state) {
            case anim.HeroBurn._INIT : 
                this._anim = new anim.FlashAnim(this._hero.playground.getFXLayer());
                this._anim.update(tmod);
                this._state = anim.HeroBurn._FLSH;
                return(true);
            case anim.HeroBurn._FLSH : 
                var _local_3 = this._anim.update(tmod);
                if (!_local_3) {
                    this._anim = new anim.ManualAnim(this._hero.mc, 2, 8);
                    this._counter = 2;
                    this._state = anim.HeroBurn._EYES;
                }
                return(true);
            case anim.HeroBurn._EYES : 
                var _local_4 = this._anim.update(tmod);
                if (!_local_4) {
                    this._counter--;
                    if (this._counter > 0) {
                        this._anim = new anim.ManualAnim(this._hero.mc, 2, 8);
                    } else {
                        this._state = anim.HeroBurn._WAIT;
                        this._counter = 60;
                    }
                }
                return(true);
            case anim.HeroBurn._WAIT : 
                this._counter = this._counter - tmod;
                if (this._counter <= 0) {
                    this._state = anim.HeroBurn._BURN;
                    this._anim = new anim.ManualAnim(this._hero.mc, 2, 11);
                }
                return(true);
            case anim.HeroBurn._BURN : 
                return(this._anim.update(tmod));
        }
        return(false);
    };
    anim.HeroBurn._INIT = 0;
    anim.HeroBurn._FLSH = 1;
    anim.HeroBurn._EYES = 2;
    anim.HeroBurn._WAIT = 3;
    anim.HeroBurn._BURN = 4;
    if (!anim) {
        anim = new Object();
    }
    anim.LoukiEatAnim = function (louki, target, direction) {
        super(louki.subMc);
        this._louki = louki;
        this._target = target;
        this._direction = direction;
        this._started = false;
    };
    anim.LoukiEatAnim.prototype.__proto__ = anim.SteppedAnim.prototype;
    anim.LoukiEatAnim.prototype.__constructor__ = anim.SteppedAnim;
    anim.LoukiEatAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            var _local_3 = "pump" + Direction.nameOf(this._direction);
            this._louki.mc.gotoAndStop(_local_3);
            this._louki.subMc.stop();
            this._step = this._louki.subMc._currentframe;
            this._steps = this._louki.subMc._totalframes;
            this._target.mc._visible = false;
        }
        return(anim_SteppedAnim_update.call(this, tmod));
    };
    if (!editlist) {
        editlist = new Object();
    }
    editlist.State = function (main) {
        this._jama = main;
        this._layer = this._jama.newLayer();
        this._view = yota.McTop.create(this._layer);
        this._list = new editlist.EditList(this._view);
        this._list.onNewLevelEditionRequest = Std.callback(this, "_onCreateNewLevel");
        this._list.onLevelEditionRequest = Std.callback(this, "_onLevelEditionRequest");
        this._list.onLevelDeleteRequest = Std.callback(this, "_onLevelDeleteRequest");
        this._list.onLevelPropertiesRequest = Std.callback(this, "_onPropRequest");
        this._list.setListControl(this);
        this._currentPage = 0;
        this._updateLevels();
    };
    editlist.State.prototype.update = function (tmod) {
        if (Key.isDown(Key.ESCAPE)) {
            this._jama.setState(new menu.State(this._jama));
            return(undefined);
        }
        this._list.update(tmod);
    };
    editlist.State.prototype.destroy = function () {
        this._layer.removeMovieClip();
        this._layer = null;
    };
    editlist.State.prototype.previousPage = function () {
        if (this._currentPage == 0) {
            return(undefined);
        }
        this._currentPage--;
        this._updateLevels();
    };
    editlist.State.prototype.fastRewind = function () {
        if (this._currentPage == 0) {
            return(undefined);
        }
        this._currentPage = this._currentPage - 10;
        if (this._currentPage < 0) {
            this._currentPage = 0;
        }
        this._updateLevels();
    };
    editlist.State.prototype.fastForward = function () {
        var _local_2 = Math.ceil(this._totalLevels / editlist.State.MAX_LEVELS_PER_PAGE);
        if ((this._currentPage + 1) == _local_2) {
            return(undefined);
        }
        this._currentPage = this._currentPage + 10;
        if (this._currentPage >= _local_2) {
            this._currentPage = _local_2 - 1;
        }
        this._updateLevels();
    };
    editlist.State.prototype.nextPage = function () {
        if (((this._currentPage + 1) * editlist.State.MAX_LEVELS_PER_PAGE) > this._totalLevels) {
            return(undefined);
        }
        this._currentPage++;
        this._updateLevels();
    };
    editlist.State.prototype._updateLevels = function () {
        var _local_2 = this._currentPage * editlist.State.MAX_LEVELS_PER_PAGE;
        Jama.wait();
        this._jama.network().slotList(_local_2, editlist.State.MAX_LEVELS_PER_PAGE, Std.callback(this, "_onSlotListReceived"));
    };
    editlist.State.prototype._onSlotListReceived = function (xml) {
        Jama.endWait();
        var _local_3 = Jama.getPlayer();
        this._totalLevels = Std.parseInt(xml.get("c"), 10);
        if (this._totalLevels < _local_3.slotsNumber) {
            this._totalLevels = _local_3.slotsNumber;
        }
        var _local_4 = new Array();
        var _local_5 = xml.firstChild;
        while (_local_5 != null) {
            var _local_6 = LevelEntry.createFromXml(_local_5);
            _local_6.status = (_local_6.validated ? 2 : -1);
            _local_4.push(_local_6);
            _local_5 = _local_5.nextSibling;
        }
        var _local_7 = this._currentPage * editlist.State.MAX_LEVELS_PER_PAGE;
        while (((_local_7 + _local_4.length) < _local_3.slotsNumber) && (_local_4.length < editlist.State.MAX_LEVELS_PER_PAGE)) {
            _local_4.push(new LevelEntry());
        }
        this._list.setLevels(_local_4);
        this._list.setPaginate(this._currentPage + 1, Math.ceil(this._totalLevels / editlist.State.MAX_LEVELS_PER_PAGE));
    };
    editlist.State.prototype._onLevelDeleteRequest = function (entry) {
        var _local_3 = ((Consts.SUPPR_CONFIRM + "\"") + this._list._selectedLevel.title) + "\"";
        this._view._visible = false;
        this._confirm = new gui.dialog.Confirm(yota.McTop.create(this._layer));
        this._confirm.setText(_local_3);
        this._confirm.onValidate = Std.callback(this, "_onDeleteConfirmed");
        this._confirm.onCancel = Std.callback(this, "_onDeleteCancelled");
    };
    editlist.State.prototype._onDeleteConfirmed = function () {
        var self = this;
        Jama.wait();
        var _local_2 = function (xml) {
            Jama.endWait();
            self._jama.setState(new editlist.State(self._jama));
        };
        this._jama.network().slotFree(this._list._selectedLevel.id, _local_2);
    };
    editlist.State.prototype._onDeleteCancelled = function () {
        this._confirm.destroy();
        this._view._visible = true;
    };
    editlist.State.prototype._onLevelEditionRequest = function (entry) {
        var _local_3 = this;
        Jama.wait();
        this._jama.network().getLevel(entry.id, Std.callback(_local_3, "_editLevel"));
    };
    editlist.State.prototype._onCreateNewLevel = function (level) {
        var j = this._jama;
        var self = this;
        var layer = this._layer;
        this._view._visible = false;
        var infoEdit = (new editlist.LevelInfoEdit(this._layer, level));
        infoEdit.onCancel = function (lvl) {
            infoEdit.destroy();
            self._view._visible = true;
        };
        infoEdit.onValidate = function (lvl) {
            infoEdit.destroy();
            if (lvl.title == Consts.EMPTY_LEVEL_TITLE) {
                lvl.title = Consts.WITHOUT_TITLE;
            }
            var infoSize = (new editlist.LevelSizeEdit(layer, j, level));
            infoSize.onCancel = function (lvl) {
                infoSize.destroy();
                self._view._visible = true;
            };
            infoSize.onValidate = function (lvl) {
                infoSize.destroy();
                self._jama.setState(new editor.State(self._jama, lvl));
            };
            infoSize.draw();
        };
        infoEdit.draw();
        var _local_2 = infoEdit.getMovieClip();
        _local_2._y = (Consts.HEIGHT - _local_2._height) / 2;
        _local_2._x = (Consts.WIDTH - _local_2._width) / 2;
    };
    editlist.State.prototype._editLevel = function (xml) {
        Jama.endWait();
        var _local_3 = Level.createFromXml(xml);
        this._jama.setState(new editor.State(this._jama, _local_3));
    };
    editlist.State.prototype._onPropRequest = function (level) {
        if (level.validated) {
            var _local_2 = new editlist.LevelInfo(this._layer, level);
        } else if (level.id != -1) {
            this._view._visible = false;
            var self = this;
            var infoEdit = (new editlist.LevelInfoEdit(this._layer, level));
            infoEdit.onCancel = function (lvl) {
                infoEdit.destroy();
                self._view._visible = true;
            };
            infoEdit.onValidate = function (lvl) {
                infoEdit.destroy();
                if (lvl.title == Consts.EMPTY_LEVEL_TITLE) {
                    lvl.title = Consts.WITHOUT_TITLE;
                }
                Jama.wait();
                self._jama.network().slotRename(level, function (xml) {
                    Jama.endWait();
                    self._view._visible = true;
                    self._updateLevels();
                });
            };
            infoEdit.draw();
            yota.Mc.center(infoEdit.getMovieClip(), Consts.WIDTH, Consts.HEIGHT);
        }
    };
    editlist.State.MAX_LEVELS_PER_PAGE = 15;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.OneWay = function (data) {
        super(data);
        this.below = true;
    };
    sprite.OneWay.prototype.__proto__ = Sprite.prototype;
    sprite.OneWay.prototype.__constructor__ = Sprite;
    sprite.OneWay.prototype.setOrientation = function (d) {
        this.orientation = d;
        this.mc.gotoAndStop(Direction.nameOf(d));
    };
    sprite.OneWay.prototype.show = function () {
        this.setOrientation(this.orientation);
    };
    sprite.OneWay.prototype.canBeCrossed = function (s, d) {
        if (s.id == Element.GHOST) {
            return(true);
        }
        return(d != Direction.oposite(this.orientation));
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.OneWayStrict = function (data) {
        super(data);
        this.below = true;
    };
    sprite.OneWayStrict.prototype.__proto__ = Sprite.prototype;
    sprite.OneWayStrict.prototype.__constructor__ = Sprite;
    sprite.OneWayStrict.prototype.setOrientation = function (d) {
        this.orientation = d;
        this.mc.gotoAndStop(Direction.nameOf(d));
    };
    sprite.OneWayStrict.prototype.show = function () {
        this.setOrientation(this.orientation);
    };
    sprite.OneWayStrict.prototype.canBeCrossed = function (s, d) {
        if (s.id == Element.GHOST) {
            return(true);
        }
        return(d == this.orientation);
    };
    sprite.OneWayStrict.prototype.canLeave = function (s, d) {
        if (s.id == Element.GHOST) {
            return(true);
        }
        return(d == this.orientation);
    };
    if (!editor) {
        editor = new Object();
    }
    editor.SaveExitDialog = function (parent) {
        this._mc = yota.McTop.create(parent);
        this._drawBackground();
        this._createWindow();
    };
    editor.SaveExitDialog.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    editor.SaveExitDialog.prototype.setText = function (str) {
        this._window.content.text = str;
    };
    editor.SaveExitDialog.prototype.setYes = function (str, cb) {
        this._window.yes.label.text = str;
        this._yesCallback = cb;
    };
    editor.SaveExitDialog.prototype.setNo = function (str, cb) {
        this._window.no.label.text = str;
        this._noCallback = cb;
    };
    editor.SaveExitDialog.prototype.setCancel = function (str, cb) {
        this._window.cancel.label.text = str;
        this._cancelCallback = cb;
    };
    editor.SaveExitDialog.prototype._drawBackground = function () {
        this._mc.beginFill(Consts.BLACK_BROWN, 100);
        this._mc.moveTo(0, 0);
        this._mc.lineTo(Consts.WIDTH, 0);
        this._mc.lineTo(Consts.WIDTH, Consts.HEIGHT);
        this._mc.lineTo(0, Consts.HEIGHT);
        this._mc.lineTo(0, 0);
        this._mc.endFill();
    };
    editor.SaveExitDialog.prototype._createWindow = function () {
        var me = this;
        this._window = yota.McTop.attach(this._mc, "jama_GUI_ConfirmQuit");
        this._window._x = Consts.WIDTH / 2;
        this._window._y = Consts.HEIGHT / 2;
        this._window.yes.onRelease = function () {
            me._yesCallback();
        };
        this._window.no.onRelease = function () {
            me._noCallback();
        };
        this._window.cancel.onRelease = function () {
            me._cancelCallback();
        };
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.component) {
        gui.component = new Object();
    }
    gui.component.Select = function (parent) {
        this._opened = false;
        this._items = new Array();
        this._mc = yota.McTop.attach(parent, "jama_gui_Select");
        var me = this;
        var current = this._mc.current;
        current.gotoAndStop("out");
        current.onRollOver = function () {
            current.gotoAndStop("over");
        };
        current.onRollOut = function () {
            current.gotoAndStop("out");
        };
        current.onRelease = function () {
            if (me._opened) {
                me._close();
            } else {
                me._open();
            }
        };
        var _local_3 = this._mc.but;
        _local_3.onRelease = function () {
            if (me._opened) {
                me._close();
            } else {
                me._open();
            }
        };
    };
    gui.component.Select.prototype.getMovieClip = function () {
        return(this._mc);
    };
    gui.component.Select.prototype.addItem = function (t) {
        var _local_3 = new gui.component.SelectItem(this, this._items.length, t);
        _local_3.onSelected = Std.callback(this, "_onChanged");
        this._items.push(_local_3);
    };
    gui.component.Select.prototype._onChanged = function (id) {
        this._close();
        this._mc.current.label.text = this._items[id].getLabel();
        this.onChanged(id);
    };
    gui.component.Select.prototype.draw = function () {
        if (this._items.length == 0) {
            return(undefined);
        }
        this._mc.current.label.text = this._items[0].getLabel();
        this._mc.swapDepths(this._items[this._items.length - 1].getMovieClip().getDepth());
    };
    gui.component.Select.prototype._open = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._items.length ; _local_2++) {
            var _local_3 = this._items[_local_2].getMovieClip();
            _local_3._visible = true;
            _local_3._x = this._mc._x;
            _local_3._y = this._mc._y - ((_local_2 + 1) * _local_3._height);
        }
        this._mc.but._rotation = 180;
        this._opened = true;
    };
    gui.component.Select.prototype._close = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._items.length ; _local_2++) {
            var _local_3 = this._items[_local_2].getMovieClip();
            _local_3._visible = false;
        }
        this._mc.but._rotation = 0;
        this._opened = false;
    };
    if (!misc) {
        misc = new Object();
    }
    misc.CannotCreateLevelState = function (main) {
        this._jama = main;
        this._layer = this._jama.newLayer();
        yota.Mc.fillSquare(this._layer, Consts.BLACK_BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
        var _local_3 = yota.McTop.attach(this._layer, "jama_gui_Banned");
        yota.Mc.center(_local_3, Consts.WIDTH, Consts.HEIGHT);
        var self = this;
        _local_3.onRelease = function () {
            self._jama.setState(new menu.State(self._jama));
        };
    };
    misc.CannotCreateLevelState.prototype.update = function (tmod) {
        if (Key.isDown(Key.ESCAPE)) {
            this._jama.setState(new menu.State(this._jama));
            return(undefined);
        }
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.component) {
        gui.component = new Object();
    }
    gui.component.VerticalPane = function (managedMC) {
        this._mc = managedMC;
        this._children = new Array();
        this.setPadding(0, 0, 0, 0);
    };
    gui.component.VerticalPane.prototype.push = function (child, alignment) {
        this._children.push({mc:child.getMovieClip(), align:alignment});
    };
    gui.component.VerticalPane.prototype.setPadding = function (l, t, r, b) {
        this._paddingLeft = l;
        this._paddingTop = t;
        this._paddingRight = r;
        this._paddingBottom = b;
    };
    gui.component.VerticalPane.prototype.draw = function () {
        var _local_2 = this._mc._width;
        var _local_3 = this._mc._height;
        if (_local_2 == 0) {
            _local_2 = Stage.width;
        }
        if (_local_3 == 0) {
            _local_3 = Stage.height;
        }
        _local_3 = _local_3 - this._paddingTop;
        _local_3 = _local_3 - this._paddingBottom;
        _local_2 = _local_2 - this._paddingLeft;
        _local_2 = _local_2 - this._paddingRight;
        var _local_4 = 0;
        var _local_5 = 0;
        for ( ; _local_5 < this._children.length ; _local_5++) {
            _local_4 = _local_4 + this._children[_local_5].mc._height;
        }
        var _local_6 = (_local_3 - _local_4) / (this._children.length + 1);
        var _local_7 = this._paddingTop + _local_6;
        var _local_8 = 0;
        for ( ; _local_8 < this._children.length ; _local_8++) {
            this._children[_local_8].mc._y = _local_7;
            _local_7 = _local_7 + (this._children[_local_8].mc._height + _local_6);
        }
        var _local_9 = 0;
        for ( ; _local_9 < this._children.length ; _local_9++) {
            switch (this._children[_local_9].align) {
                case gui.Align.LEFT : 
                    this._children[_local_9].mc._x = this._paddingLeft;
                    break;
                case gui.Align.RIGHT : 
                    this._children[_local_9].mc._x = (this._paddingLeft + _local_2) - this._children[_local_9].mc._width;
                    break;
                case gui.Align.CENTER : 
                    this._children[_local_9].mc._x = this._paddingLeft + ((_local_2 - this._children[_local_9].mc._width) / 2);
                    break;
            }
        }
    };
    if (!editor) {
        editor = new Object();
    }
    editor.Playground = function (parent, dim) {
        super(parent, dim);
        this._dim = dim.clone();
        this._modified = false;
    };
    editor.Playground.prototype.__proto__ = gui.Playground.prototype;
    editor.Playground.prototype.__constructor__ = gui.Playground;
    editor.Playground.prototype.saved = function () {
        this._modified = false;
    };
    editor.Playground.prototype.setModified = function () {
        this._modified = true;
    };
    editor.Playground.prototype.isModified = function () {
        return(this._modified);
    };
    editor.Playground.prototype.hasMagnet = function () {
        var _local_2 = 0;
        for ( ; _local_2 < this._sprites.length ; _local_2++) {
            if ((this._sprites[_local_2].id == Element.MAGNET) || (this._sprites[_local_2].id == Element.GMAGNET)) {
                return(true);
            }
        }
        return(false);
    };
    editor.Playground.prototype.hasMoreThanOneMagnet = function () {
        var _local_2 = 0;
        var _local_3 = 0;
        for ( ; _local_3 < this._sprites.length ; _local_3++) {
            if ((this._sprites[_local_3].id == Element.MAGNET) || (this._sprites[_local_3].id == Element.GMAGNET)) {
                _local_2++;
                if (_local_2 > 1) {
                    return(true);
                }
            }
        }
        return(false);
    };
    editor.Playground.prototype.addSprite = function (sprite) {
        var _local_3 = this._mouseToCoord();
        if (!this._board.isValid(_local_3)) {
            return(undefined);
        }
        if (sprite.id == Element.HERO) {
            this.delSprite(this.findSprite(Element.HERO));
        }
        if (((!Consts.ALLOW_MULTI_MAGNETS) && ((sprite.id == Element.MAGNET) || (sprite.id == Element.GMAGNET))) && (this.hasMagnet())) {
            var _local_4 = this._board.get(_local_3);
            if ((_local_4.id != Element.MAGNET) && (_local_4.id != Element.GMAGNET)) {
                return(undefined);
            }
        }
        sprite.pos = _local_3;
        this.delSprite(this._board.get(_local_3));
        this.delSprite(this._board.getBelow(_local_3));
        var _local_5 = Sprite.create(this._ground, sprite);
        _local_5.board = this._board;
        _local_5.show();
        _local_5.mc._x = Consts.SPRITE_WIDTH * _local_3.x;
        _local_5.mc._y = Consts.SPRITE_HEIGHT * _local_3.y;
        if (!_local_5.isAvatar()) {
            _local_5.setOrientation(sprite.orientation);
        }
        this._board.set(_local_3, _local_5);
        this._sprites.push(_local_5);
        this._modified = true;
        this.refreshAround(_local_3);
    };
    editor.Playground.prototype.refreshAround = function (c) {
        var _local_4 = Direction.NORTH;
        for ( ; _local_4 <= Direction.WEST ; _local_4++) {
            var _local_3 = c.next(_local_4);
            if (this._board.isValid(_local_3)) {
                this._board.get(_local_3).show();
                this._board.getBelow(_local_3).show();
            }
        }
    };
    editor.Playground.prototype.getSpriteUnderCursor = function () {
        var _local_2 = this._mouseToCoord();
        if (!this._board.isValid(_local_2)) {
            return(null);
        }
        var _local_3 = this._board.get(_local_2);
        return(((_local_3.id == Element.NONE) ? null : (_local_3)));
    };
    editor.Playground.prototype.delSpriteUnderCursor = function () {
        var _local_2 = this._mouseToCoord();
        if (!this._board.isValid(_local_2)) {
            return(undefined);
        }
        this._modified = true;
        this.delSprite(this._board.get(_local_2));
        this.refreshAround(_local_2);
    };
    editor.Playground.prototype.delSprite = function (sprite) {
        if (sprite.id != Element.NONE) {
            this._board.erase(sprite);
            this._sprites.remove(sprite);
            sprite.mc.removeMovieClip();
            this._modified = true;
        }
    };
    editor.Playground.prototype.findSprite = function (id) {
        var _local_3 = 0;
        for ( ; _local_3 < this._sprites.length ; _local_3++) {
            if (this._sprites[_local_3].id == id) {
                return(this._sprites[_local_3]);
            }
        }
        return(null);
    };
    editor.Playground.prototype.setLevel = function (level) {
        if (level.id == -1) {
            this._modified = true;
        }
        var _local_4 = 0;
        for ( ; _local_4 < level.tiles.length ; _local_4++) {
            var _local_5 = level.tiles[_local_4];
            var _local_3 = Sprite.create(this._ground, _local_5);
            _local_3.board = this._board;
            _local_3.show();
            _local_3.mc._x = Consts.SPRITE_WIDTH * _local_5.pos.x;
            _local_3.mc._y = Consts.SPRITE_HEIGHT * _local_5.pos.y;
            if (!_local_3.isAvatar()) {
                _local_3.setOrientation(_local_5.orientation);
            }
            this._board.set(_local_5.pos, _local_3);
            this._sprites.push(_local_3);
            this.refreshAround(_local_5.pos);
        }
        if (this._board.get(level.startPos).id != Element.NONE) {
            return(undefined);
        }
        var _local_6 = new Element(null);
        _local_6.id = Element.HERO;
        _local_6.pos = level.startPos.clone();
        var _local_3 = Sprite.create(this._ground, _local_6);
        _local_3.board = this._board;
        _local_3.show();
        _local_3.mc._x = Consts.SPRITE_WIDTH * _local_6.pos.x;
        _local_3.mc._y = Consts.SPRITE_HEIGHT * _local_6.pos.y;
        if (!_local_3.isAvatar()) {
            _local_3.setOrientation(_local_6.orientation);
        }
        this._board.set(_local_6.pos, _local_3);
        this._sprites.push(_local_3);
        this.refreshAround(_local_6.pos);
    };
    editor.Playground.prototype.toLevel = function () {
        var _local_2 = new Level();
        _local_2.tiles = new Array();
        var _local_3 = 0;
        for ( ; _local_3 < this._sprites.length ; _local_3++) {
            if (this._sprites[_local_3].id == Element.HERO) {
                _local_2.startPos = this._sprites[_local_3].pos.clone();
            } else {
                _local_2.tiles.push(new Element(this._sprites[_local_3]));
            }
        }
        _local_2.size = this._dim.clone();
        return(_local_2);
    };
    editor.Playground.prototype._mouseToCoord = function () {
        var _local_2 = int(this._ground._xmouse / Consts.SPRITE_WIDTH);
        var _local_3 = int(this._ground._ymouse / Consts.SPRITE_HEIGHT);
        return(new Coord(_local_2, _local_3));
    };
    if (!anim) {
        anim = new Object();
    }
    anim.McMoveAnim = function (mc, dest, steps) {
        this._mc = mc;
        this._started = false;
        this._steps = steps;
        this._destX = dest.x;
        this._destY = dest.y;
    };
    anim.McMoveAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._vectorX = (this._destX - this._mc._x) / this._steps;
            this._vectorY = (this._destY - this._mc._y) / this._steps;
        }
        this._mc._x = this._mc._x + (this._vectorX * tmod);
        this._mc._y = this._mc._y + (this._vectorY * tmod);
        if ((this._mc._x == this._destX) && (this._mc._y == this._destY)) {
            return(false);
        }
        if (((((this._vectorX > 0) && (this._mc._x > this._destX)) || ((this._vectorX < 0) && (this._mc._x < this._destX))) || ((this._vectorY > 0) && (this._mc._y > this._destY))) || ((this._vectorY < 0) && (this._mc._y < this._destY))) {
            this._mc._x = this._destX;
            this._mc._y = this._destY;
            return(false);
        }
        return(true);
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.component) {
        gui.component = new Object();
    }
    gui.component.CheckBox = function (parent) {
        this._mc = yota.McTop.attach(parent, "jama_gui_CheckBox");
        this._mc.stop();
        var movie = this._mc;
        this._mc.onRelease = function () {
            movie.gotoAndStop(String(3 - movie._currentframe));
        };
    };
    gui.component.CheckBox.prototype.setLabel = function (label) {
        this._mc.label = label;
    };
    gui.component.CheckBox.prototype.setPosition = function (x, y) {
        this._mc._x = x;
        this._mc._y = y;
    };
    gui.component.CheckBox.prototype.setChecked = function (b) {
        this._mc.gotoAndStop((b ? "2" : "1"));
    };
    gui.component.CheckBox.prototype.isChecked = function () {
        return(this._mc._currentframe == 2);
    };
    gui.component.CheckBox.prototype.getMovieClip = function () {
        return(this._mc);
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.component) {
        gui.component = new Object();
    }
    gui.component.SelectItem = function (select, id, t) {
        this._mc = yota.McTop.attach(select.getMovieClip()._parent, "jama_gui_SelectItem");
        this._mc._visible = false;
        this._label = t;
        this._id = id;
        var me = this;
        this._mc.label.text = t;
        this._mc.onRelease = function () {
            me.onSelected(me._id);
        };
        this._mc.onRollOver = function () {
            me._mc.gotoAndStop("over");
        };
        this._mc.onRollOut = function () {
            me._mc.gotoAndStop("out");
        };
        this._mc.gotoAndStop("out");
    };
    gui.component.SelectItem.prototype.getLabel = function () {
        return(this._label);
    };
    gui.component.SelectItem.prototype.getMovieClip = function () {
        return(this._mc);
    };
    if (!gui) {
        gui = new Object();
    }
    gui.Board = function (d) {
        this._width = d.width;
        this._height = d.height;
        this._below = new Array();
        this._over = new Array();
        this._ether = new Array();
        this._belowDepthStart = 1000;
        this._overDepthStart = 2000;
        this._etherDepthStart = 3000;
        this._nullSprite = new sprite.NullSprite(null);
    };
    gui.Board.prototype.get = function (p) {
        if (!this.isValid(p)) {
            return(this._nullSprite);
        }
        var _local_3 = this._getIndex(p);
        if (this._ether[_local_3] != null) {
            return(this._ether[_local_3]);
        }
        if (this._over[_local_3] != null) {
            return(this._over[_local_3]);
        }
        return(this.getBelow(p));
    };
    gui.Board.prototype.getOver = function (p) {
        if (!this.isValid(p)) {
            return(this._nullSprite);
        }
        var _local_3 = this._getIndex(p);
        if (this._over[_local_3] == null) {
            return(this._nullSprite);
        }
        return(this._over[_local_3]);
    };
    gui.Board.prototype.getBelow = function (p) {
        if (!this.isValid(p)) {
            return(this._nullSprite);
        }
        var _local_3 = this._getIndex(p);
        if (this._below[_local_3] == null) {
            return(this._nullSprite);
        }
        return(this._below[_local_3]);
    };
    gui.Board.prototype.swapLayer = function (s, l) {
        if (l == gui.Board.OVER) {
            var _local_4 = this._getOverDepth(s.pos);
            s.mc.swapDepths(_local_4);
        } else {
            var _local_5 = this._getBelowDepth(s.pos);
            s.mc.swapDepths(_local_5);
        }
    };
    gui.Board.prototype.erase = function (s) {
        if (!this.isValid(s.pos)) {
            return(undefined);
        }
        var _local_3 = this._getIndex(s.pos);
        if (this._ether[_local_3].equals(s)) {
            this._ether[_local_3] = null;
        }
        if (this._over[_local_3].equals(s)) {
            this._over[_local_3] = null;
        }
        if (this._below[_local_3].equals(s)) {
            this._below[_local_3] = null;
        }
    };
    gui.Board.prototype.set = function (p, s) {
        if (!this.isValid(p)) {
            Jama.error((("tryed to set " + s) + " at ") + p);
            return(undefined);
        }
        this.erase(s);
        if (s.id == Element.GHOST) {
            this._ether[this._getIndex(p)] = s;
        } else if (s.below) {
            var _local_4 = this.getBelow(p);
            if (_local_4.id != Element.NONE) {
                Jama.error((("B Trying to set " + s) + " on ") + _local_4);
                return(undefined);
            }
            this._below[this._getIndex(p)] = s;
            s.mc.swapDepths(this._getBelowDepth(p));
        } else {
            var _local_5 = this.getOver(p);
            if (_local_5.id != Element.NONE) {
                Jama.error((("A Trying to set " + s) + " on ") + _local_5);
                return(undefined);
            }
            this._over[this._getIndex(p)] = s;
            s.mc.swapDepths(this._getOverDepth(p));
        }
        s.pos = p.clone();
    };
    gui.Board.prototype.isValid = function (p) {
        return((((p.x >= 0) && (p.y >= 0)) && (p.x < this._width)) && (p.y < this._height));
    };
    gui.Board.prototype.getOverDepthFX = function (c) {
        return(this._getOverDepth(c) + 1);
    };
    gui.Board.prototype._getIndex = function (c) {
        return((this._width * c.y) + c.x);
    };
    gui.Board.prototype._getOverDepth = function (c) {
        return((this._getIndex(c) * 4) + this._overDepthStart);
    };
    gui.Board.prototype._getBelowDepth = function (c) {
        return((this._getIndex(c) * 4) + this._belowDepthStart);
    };
    gui.Board.OVER = 1;
    gui.Board.BELOW = 2;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Ghost = function (data) {
        super(data);
    };
    sprite.Ghost.prototype.__proto__ = sprite.Hero.prototype;
    sprite.Ghost.prototype.__constructor__ = sprite.Hero;
    sprite.Ghost.prototype.show = function () {
        sprite_Avatar_show.call(this);
        this.mc._alpha = 50;
    };
    sprite.Ghost.prototype.canMove = function (d) {
        return(sprite_Avatar_canMove.call(this, d) || (this._canPossess(this.board.get(this.pos.next(d)))));
    };
    sprite.Ghost.prototype.move = function (d) {
        var _local_3 = this.pos.next(d);
        var _local_4 = this.board.get(_local_3);
        if (this._canPossess(_local_4)) {
            this.setOrientation(d);
            var _local_5 = _local_4;
            _local_5.wakeUp();
            this.playground.setAvatar(_local_5);
            this.playground.move(this.pos, d, null);
            return(undefined);
        }
        sprite_Avatar_move.call(this, d);
    };
    sprite.Ghost.prototype._canPossess = function (sprite) {
        return(((sprite.id == Element.LOUKI) || (sprite.id == Element.KOHL)) || (sprite.id == Element.WINKLE));
    };
    sprite_Avatar_move = sprite.Avatar.prototype.move;
    sprite_Avatar_canMove = sprite.Avatar.prototype.canMove;
    sprite_Avatar_show = sprite.Avatar.prototype.show;
    if (!editor) {
        editor = new Object();
    }
    editor.DeleteCursor = function (parent) {
        this.type = editor.Editor.DELETE_CURSOR;
        var _local_4 = yota.McTop.create(parent);
        _local_4.beginFill(16711680, 100);
        _local_4.lineStyle(2, 16777215, 100);
        _local_4.moveTo(-10, -10);
        _local_4.lineTo(-10, -5);
        _local_4.lineTo(-5, 0);
        _local_4.lineTo(-10, 5);
        _local_4.lineTo(-10, 10);
        _local_4.lineTo(-5, 10);
        _local_4.lineTo(0, 5);
        _local_4.lineTo(5, 10);
        _local_4.lineTo(10, 10);
        _local_4.lineTo(10, 5);
        _local_4.lineTo(5, 0);
        _local_4.lineTo(10, -5);
        _local_4.lineTo(10, -10);
        _local_4.lineTo(5, -10);
        _local_4.lineTo(0, -5);
        _local_4.lineTo(-5, -10);
        _local_4.lineTo(-10, -10);
        _local_4.endFill();
        _local_4._x = parent._xmouse;
        _local_4._y = parent._ymouse;
        super(_local_4);
    };
    editor.DeleteCursor.prototype.__proto__ = editor.Cursor.prototype;
    editor.DeleteCursor.prototype.__constructor__ = editor.Cursor;
    if (!yota) {
        yota = new Object();
    }
    yota.McTop = function () {
    };
    yota.McTop.attach = function (mc, linkName) {
        var _local_4 = mc.getNextHighestDepth();
        return(Std.attachMC(mc, linkName, _local_4));
    };
    yota.McTop.create = function (mc) {
        var _local_3 = mc.getNextHighestDepth();
        return(Std.createEmptyMC(mc, _local_3));
    };
    yota.McTop.createTextField = function (mc) {
        var _local_3 = mc.getNextHighestDepth();
        return(Std.createTextField(mc, _local_3));
    };
    if (!anim) {
        anim = new Object();
    }
    anim.BurnWall = function (wall) {
        super(wall.mc);
        this._wall = wall;
        this._started = false;
    };
    anim.BurnWall.prototype.__proto__ = anim.SteppedAnim.prototype;
    anim.BurnWall.prototype.__constructor__ = anim.SteppedAnim;
    anim.BurnWall.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._wall.mc.gotoAndStop("burn");
            anim_SteppedAnim_reset.call(this);
        }
        return(anim_SteppedAnim_update.call(this, tmod));
    };
    anim_SteppedAnim_reset = anim.SteppedAnim.prototype.reset;
    if (!statlist) {
        statlist = new Object();
    }
    statlist.State = function (main) {
        this._jama = main;
        this._list = new statlist.StatList(main.newLayer());
        this._list.setListControl(this);
        this._list.draw();
        this._mode = "P";
        this._page = 0;
        this._refreshResults();
    };
    statlist.State.prototype.update = function (tmod) {
        this._list.update(tmod);
        if (Key.isDown(Key.ESCAPE)) {
            this._jama.setState(new menu.State(this._jama));
        }
    };
    statlist.State.prototype.nextPage = function () {
        if (((this._page + 1) * statlist.State.MAX_PER_PAGE) > this._total) {
            return(undefined);
        }
        this._page++;
        this._refreshResults();
    };
    statlist.State.prototype.fastForward = function () {
        var _local_2 = Math.ceil(this._total / statlist.State.MAX_PER_PAGE);
        if ((this._page + 1) == _local_2) {
            return(undefined);
        }
        this._page = this._page + 10;
        if ((this._page + 1) > _local_2) {
            this._page = _local_2 - 1;
        }
        this._refreshResults();
    };
    statlist.State.prototype.previousPage = function () {
        if (this._page <= 0) {
            return(undefined);
        }
        this._page--;
        this._refreshResults();
    };
    statlist.State.prototype.fastRewind = function () {
        if (this._page <= 0) {
            return(undefined);
        }
        this._page = this._page - 10;
        if (this._page < 0) {
            this._page = 0;
        }
        this._refreshResults();
    };
    statlist.State.prototype.changeMode = function (mode) {
        var _local_3 = "PCLO";
        this._page = 0;
        this._mode = _local_3.charAt(mode);
        this._refreshResults();
    };
    statlist.State.prototype._refreshResults = function () {
        var self = this;
        Jama.wait();
        var _local_2 = function (xml) {
            Jama.endWait();
            if (xml.exists("c")) {
                self._total = Std.parseInt(xml.get("c"), 10);
            }
            var _local_3 = new Array();
            var _local_4 = xml.firstChild;
            while (_local_4 != null) {
                _local_3.push(self._createStat(_local_4));
                _local_4 = _local_4.nextSibling;
            }
            self._list.setStats(self._page + 1, Math.ceil(self._total / statlist.State.MAX_PER_PAGE), _local_3);
        };
        this._jama.network().listStats(this._mode, this._page * statlist.State.MAX_PER_PAGE, statlist.State.MAX_PER_PAGE, _local_2);
    };
    statlist.State.prototype._createStat = function (xml) {
        switch (this._mode) {
            case "P" : 
                return({col1:xml.get("u"), col2:xml.get("s")});
            case "L" : 
                return({col1:(xml.get("u") + " -- ") + yota.HtmlString.decode(xml.get("t")), col2:((xml.get("s") != null) ? (xml.get("s")) : (xml.get("np")))});
            case "O" : 
                return({col1:yota.HtmlString.decode(xml.get("t")), col2:((xml.get("s") != null) ? (xml.get("s")) : (xml.get("np")))});
            case "C" : 
                return({col1:xml.get("u"), col2:((xml.get("s") != null) ? (xml.get("s")) : (xml.get("np")))});
        }
        return({col1:"", col2:""});
    };
    statlist.State.MAX_PER_PAGE = 15;
    if (!anim) {
        anim = new Object();
    }
    anim.BurnSprite = function (s) {
        this._started = false;
        this._sprite = s;
        this._sprite.alive = false;
    };
    anim.BurnSprite.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._anim = this._sprite.burn();
        }
        var _local_3 = this._anim.update(tmod);
        if (!_local_3) {
            this._sprite.endBurn();
        }
        return(_local_3);
    };
    if (!editlist) {
        editlist = new Object();
    }
    editlist.EditList = function (layer) {
        this._selectedTime = 0;
        this._layer = layer;
        this._cursor = null;
        this._levels = new Array();
        this._selectedId = 0;
        this._controller = null;
        this.draw();
    };
    editlist.EditList.prototype.destroy = function () {
        this._layer.removeMovieClip();
        this._layer = null;
    };
    editlist.EditList.prototype.setListControl = function (c) {
        this._controller = c;
    };
    editlist.EditList.prototype.setLevels = function (levels) {
        this._levels = levels;
        this.refresh();
    };
    editlist.EditList.prototype.setPaginate = function (currentPage, numberOfPages) {
        this._mc.fieldPage.text = (String(currentPage) + " / ") + String(numberOfPages);
    };
    editlist.EditList.prototype.update = function (tmod) {
    };
    editlist.EditList.prototype.draw = function () {
        this._mc = yota.McTop.attach(this._layer, "jama_gui_list");
        this._mc.gotoAndStop("2");
        this.createLevelsPane();
        this.connectSignals();
        this.refresh();
    };
    editlist.EditList.prototype.resetCursor = function () {
        this._cursor.hide();
    };
    editlist.EditList.prototype.createLevelsPane = function () {
        var _local_2 = yota.McTop.create(this._layer);
        this._cursor = new editlist.LevelCursor(_local_2);
        this._levelsPane = new editlist.LevelsPane(_local_2);
        this._levelsPane.onSlotSelected = Std.callback(this, "onSlotSelected");
    };
    editlist.EditList.prototype.connectSignals = function () {
        var self = this;
        this._mc.butPlay.onRelease = function () {
            self.onButtonActivated(editlist.EditList.BTN_PLAY);
        };
        this._mc.butEdit.onRelease = function () {
            self.onButtonActivated(editlist.EditList.BTN_EDIT);
        };
        this._mc.butDelete.onRelease = function () {
            self.onButtonActivated(editlist.EditList.BTN_DELETE);
        };
        this._mc.butProp.onRelease = function () {
            self.onButtonActivated(editlist.EditList.BTN_PROPERTIES);
        };
        this._mc.butNext.onRelease = function () {
            self.onButtonActivated(editlist.EditList.BTN_NEXT);
        };
        this._mc.butPrev.onRelease = function () {
            self.onButtonActivated(editlist.EditList.BTN_PREV);
        };
    };
    editlist.EditList.prototype.refresh = function () {
        this.resetCursor();
        this._levelsPane.clear();
        var _local_2 = 0;
        for ( ; _local_2 < this._levels.length ; _local_2++) {
            this._levelsPane.addLevel(this._levels[_local_2]);
        }
    };
    editlist.EditList.prototype.onButtonActivated = function (id) {
        switch (id) {
            case editlist.EditList.BTN_NEXT : 
                if (Key.isDown(Key.CONTROL)) {
                    this._controller.fastForward();
                } else {
                    this._controller.nextPage();
                }
                break;
            case editlist.EditList.BTN_PREV : 
                if (Key.isDown(Key.CONTROL)) {
                    this._controller.fastRewind();
                } else {
                    this._controller.previousPage();
                }
                break;
            case editlist.EditList.BTN_EDIT : 
                if ((this._selectedId > 0) && (!this._selectedLevel.validated)) {
                    this.onLevelEditionRequest(this._selectedLevel);
                } else if (this._selectedId == -1) {
                    this.onNewLevelEditionRequest(new Level());
                }
                break;
            case editlist.EditList.BTN_DELETE : 
                if (this._selectedId != 0) {
                    this.onLevelDeleteRequest(this._selectedLevel);
                }
                break;
            case editlist.EditList.BTN_PLAY : 
                if (this._selectedId != 0) {
                    this.onLevelPlayRequest(this._selectedLevel);
                }
                break;
            case editlist.EditList.BTN_PROPERTIES : 
                if (this._selectedId != 0) {
                    this.onLevelPropertiesRequest(this._selectedLevel);
                }
                break;
        }
    };
    editlist.EditList.prototype.onSlotSelected = function (slot) {
        var _local_3 = this._selectedId;
        this._cursor.setY(slot.getMovieClip()._y);
        this._selectedId = slot.getLevel().id;
        this._selectedLevel = slot.getLevel();
        var _local_4 = Std.getTimer();
        if (_local_3 == this._selectedId) {
            if ((_local_4 - this._selectedTime) < 500) {
                this.doubleClickAction();
            }
        }
        this._selectedTime = _local_4;
    };
    editlist.EditList.prototype.doubleClickAction = function () {
        this.onButtonActivated(editlist.EditList.BTN_EDIT);
    };
    editlist.EditList.BTN_EDIT = 0;
    editlist.EditList.BTN_DELETE = 1;
    editlist.EditList.BTN_NEXT = 2;
    editlist.EditList.BTN_PREV = 3;
    editlist.EditList.BTN_PLAY = 4;
    editlist.EditList.BTN_PROPERTIES = 5;
    if (!playlist) {
        playlist = new Object();
    }
    playlist.PlayList = function (layer) {
        super(layer);
        this._searchFocused = false;
        this._keyboard = new yota.Keyboard(yota.Keyboard.UP);
    };
    playlist.PlayList.prototype.__proto__ = editlist.EditList.prototype;
    playlist.PlayList.prototype.__constructor__ = editlist.EditList;
    playlist.PlayList.prototype.getStates = function () {
        return(this._tabControl.getStates());
    };
    playlist.PlayList.prototype.getCurrentTabState = function () {
        return(this._tabControl.getCurrentTabState());
    };
    playlist.PlayList.prototype.setCurrentState = function (state) {
        this._tabControl.setCurrentTabState(state);
    };
    playlist.PlayList.prototype.update = function (tmod) {
        var _local_3 = this._keyboard.next();
        if ((_local_3 == Key.ENTER) && (this._searchFocused)) {
            this.onSearchRequest(this._mc.fieldSearch.text);
        }
        editlist_EditList_update.call(this, tmod);
    };
    playlist.PlayList.prototype.draw = function () {
        this._mc = yota.McTop.attach(this._layer, "jama_gui_list");
        this._mc.gotoAndStop("1");
        this.createLevelsPane();
        this.connectSignals();
        var self = this;
        this._mc.butDeleteTab.onRelease = function () {
            self.onButtonActivated(playlist.PlayList.BTN_DELETE_TAB);
        };
        this._mc.butSearch.onRelease = function () {
            self.onButtonActivated(playlist.PlayList.BTN_SEARCH);
        };
        this._mc.butSort.onRelease = function () {
            self.onButtonActivated(playlist.PlayList.BTN_SORT);
        };
        this._mc.fieldSearch.onSetFocus = function (mc) {
            self._searchFocused = true;
        };
        this._mc.fieldSearch.onKillFocus = function (mc) {
            self._searchFocused = false;
        };
        this._tabControl = new playlist.TabController(this, this._mc);
        this.refresh();
    };
    playlist.PlayList.prototype.addTabState = function (state) {
        this._tabControl.addState(state);
    };
    playlist.PlayList.prototype.onButtonActivated = function (id) {
        if (id == playlist.PlayList.BTN_DELETE_TAB) {
            this.onDeleteCurrentTab();
            return(undefined);
        }
        if (id == playlist.PlayList.BTN_SEARCH) {
            this.onSearchRequest(this._mc.fieldSearch.text);
            return(undefined);
        }
        if (id == playlist.PlayList.BTN_SORT) {
            this.onSortRequest();
            return(undefined);
        }
        editlist_EditList_onButtonActivated.call(this, id);
    };
    playlist.PlayList.prototype.doubleClickAction = function () {
        this.onButtonActivated(editlist.EditList.BTN_PLAY);
    };
    playlist.PlayList.BTN_DELETE_TAB = 6;
    playlist.PlayList.BTN_SEARCH = 7;
    playlist.PlayList.BTN_SORT = 8;
    editlist_EditList_onButtonActivated = editlist.EditList.prototype.onButtonActivated;
    editlist_EditList_update = editlist.EditList.prototype.update;
    Chunker = function (data) {
        this._data = data;
        this._pos = 0;
    };
    Chunker.prototype.eos = function () {
        return(this._pos >= this._data.length);
    };
    Chunker.prototype.next = function () {
        if (this._pos >= this._data.length) {
            return(-1);
        }
        var _local_2 = this._data.charAt(this._pos);
        this._pos++;
        if (_local_2 == "-") {
            _local_2 = this._data.charAt(this._pos);
            this._pos++;
            var _local_3 = Chunker.CHARS.indexOf(_local_2, 0);
            if (_local_3 == -1) {
                Jama.debug("unknown character : " + _local_2, "Chunker", "src/Chunker.mt", 33);
            }
            return(-1 * _local_3);
        }
        var _local_4 = Chunker.CHARS.indexOf(_local_2, 0);
        if (_local_4 == -1) {
            Jama.debug("unknown character : " + _local_2, "Chunker", "src/Chunker.mt", 40);
        }
        return(_local_4);
    };
    Chunker.encode = function (v) {
        if (v < 0) {
            return("-" + Chunker.CHARS.charAt(-1 * v));
        }
        return(Chunker.CHARS.charAt(v));
    };
    Chunker.CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGIJKLMNOPQRSTUVWXYZ";
    if (!anim) {
        anim = new Object();
    }
    anim.AvatarWakeUpAnim = function (avatar, ghost) {
        this._anim = null;
        this._started = false;
        this._avatar = avatar;
        this._ghost = ghost;
    };
    anim.AvatarWakeUpAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._ghost.destroy();
            this._avatar.mc.gotoAndStop("wakeUp");
            this._anim = new anim.SteppedAnim(this._avatar.mc.j);
        }
        return(this._anim.update(tmod));
    };
    if (!editlist) {
        editlist = new Object();
    }
    editlist.LevelInfoEdit = function (parent, level) {
        this._level = level;
        this._mc = yota.McTop.create(parent);
        var _local_4 = yota.McTop.create(this._mc);
        yota.Mc.fillSquare(_local_4, Consts.BLACK_BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
    };
    editlist.LevelInfoEdit.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    editlist.LevelInfoEdit.prototype.draw = function () {
        var _local_2 = this;
        this._win = yota.McTop.attach(this._mc, "jama_gui_LevelInfoEdit");
        this._win.levelTitle.text = this._level.title;
        this._win.levelTitle.maxChars = 40;
        this._win.btnValidate.label = "valider";
        this._win.btnValidate.onRelease = Std.callback(_local_2, "_onValidate");
        this._win.btnCancel.label = "annuler";
        this._win.btnCancel.onRelease = Std.callback(_local_2, "_onCancel");
        yota.Mc.center(this._win, Consts.WIDTH, Consts.HEIGHT);
    };
    editlist.LevelInfoEdit.prototype.getMovieClip = function () {
        return(this._mc);
    };
    editlist.LevelInfoEdit.prototype._onValidate = function () {
        this._level.title = this._win.levelTitle.text;
        this.onValidate(this._level);
    };
    editlist.LevelInfoEdit.prototype._onCancel = function () {
        this.onCancel(this._level);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Louki = function (data) {
        super(data);
        this._loaded = false;
        this._active = false;
    };
    sprite.Louki.prototype.__proto__ = sprite.Avatar.prototype;
    sprite.Louki.prototype.__constructor__ = sprite.Avatar;
    sprite.Louki.prototype.setOrientation = function (d) {
        if (this.attractedByMagnet) {
            return(undefined);
        }
        this.orientation = d;
        if (this._active) {
            var _local_3 = ("move" + (this._loaded ? "Full" : "")) + Direction.nameOf(d);
            this.mc.gotoAndStop(_local_3);
            this.subMc.stop();
        } else {
            this.mc.gotoAndStop("default");
            this.subMc.stop();
        }
    };
    sprite.Louki.prototype.showEditor = function () {
        this.mc.gotoAndStop("moveFullSouth");
        this.subMc.stop();
    };
    sprite.Louki.prototype.release = function () {
        if (this._loaded) {
            this.playground.getAnimManager().pushEffect(new anim.LoukiPukeAnim(this));
        } else {
            this._active = false;
            this.mc.gotoAndStop("sleep");
            this.subMc.gotoAndStop("1");
            this.playground.getAnimManager().pushEffect(new anim.SteppedAnim(this.subMc));
            this.board.set(this.pos, this);
        }
    };
    sprite.Louki.prototype.isWalkable = function (sprite, d) {
        return(sprite.id == Element.GHOST);
    };
    sprite.Louki.prototype.wakeUp = function () {
        this._active = true;
        sprite_Avatar_wakeUp.call(this);
    };
    sprite.Louki.prototype.canEat = function (sprite) {
        if (this._loaded) {
            return(false);
        }
        return(((sprite.id == Element.WALL) || (sprite.id == Element.BOX)) || (sprite.id == Element.LOUKI));
    };
    sprite.Louki.prototype.endWalk = function () {
        this.subMc.gotoAndStop("1");
    };
    sprite.Louki.prototype.canMove = function (d) {
        return(sprite_Avatar_canMove.call(this, d) || (this.canEat(this.board.get(this.pos.next(d)))));
    };
    sprite.Louki.prototype.move = function (d) {
        var _local_3 = this.pos.next(d);
        if (_local_3 == null) {
            return(undefined);
        }
        var _local_4 = this.board.get(_local_3);
        if (this.canEat(_local_4)) {
            this._eat(_local_4, d);
            return(undefined);
        }
        this.setOrientation(d);
        if (_local_4.canBeCrossed(this, d)) {
            _local_4.crossed(this, d);
            if (!this.attractedByMagnet) {
                var _local_5 = Std.callback(this, "endWalk");
                var _local_6 = new anim.CallbackAnim(_local_5);
                this.startWalk();
                this.playground.getAnimManager().pushEffect(_local_6);
                var _local_7 = this.playground.toGuiCoord(_local_3);
                var _local_8 = new anim.MoveAnimControlledByAnim(this, this.mc, this.subMc, _local_7);
                this.playground.move(this.pos, d, _local_8);
            } else {
                this.playground.move(this.pos, d, null);
            }
        }
    };
    sprite.Louki.prototype.unload = function () {
        this._load.mc._visible = true;
        this.destroy();
        this.board.set(this.pos, this._load);
        this.playground.refreshPositions();
    };
    sprite.Louki.prototype.burn = function () {
        this.mc.gotoAndStop("burn");
        this.subMc.stop();
        return(new anim.SteppedAnim(this.subMc));
    };
    sprite.Louki.prototype.endBurn = function () {
        this.destroy();
    };
    sprite.Louki.prototype.die = function () {
        this.alive = false;
        var _local_2 = new anim.BurnSprite(this);
        this.playground.getAnimManager().pushEffect(_local_2);
    };
    sprite.Louki.prototype._eat = function (sprite, d) {
        this._loaded = true;
        this._load = sprite;
        var _local_4 = new anim.LoukiEatAnim(this, sprite, d);
        this.playground.getAnimManager().push(_local_4, 0);
        this.board.erase(sprite);
        this.playground.refresh();
    };
    sprite.Louki.prototype.show = function () {
        this.mc.stop();
        this.mc.j.stop();
    };
    sprite.Louki.prototype.startWalk = function () {
        this.subMc.gotoAndStop("1");
    };
    sprite_Avatar_wakeUp = sprite.Avatar.prototype.wakeUp;
    if (!game) {
        game = new Object();
    }
    game.ValidateState = function (main, editState) {
        this._jama = main;
        this._edit = editState;
        this.onRestart();
    };
    game.ValidateState.prototype.update = function (tmod) {
        if (!this._ended) {
            this._gameManager.update(tmod);
        }
    };
    game.ValidateState.prototype.onDefeat = function () {
        this._ended = true;
        this._jama.setState(this._edit);
        this._edit.draw();
    };
    game.ValidateState.prototype.onVictory = function () {
        this._ended = true;
        this._level = this._edit.getLevel();
        this._level.bestScore = this._gameManager.countMoves();
        this._jama.network().slotSave(this._level, Std.callback(this, "_levelSaved"));
    };
    game.ValidateState.prototype.onRestart = function () {
        this._ended = false;
        this._layer = this._jama.newLayer();
        this._playGround = new gui.GamePlayground(this._layer, this._edit.getLevel());
        this._gameManager = new game.GameManager(this._playGround);
        this._gameManager.onVictory = Std.callback(this, "onVictory");
        this._gameManager.onDefeat = Std.callback(this, "onDefeat");
        this._gameManager.onAbandon = Std.callback(this, "onDefeat");
        this._gameManager.onRestart = Std.callback(this, "onRestart");
    };
    game.ValidateState.prototype._levelSaved = function (xml) {
        if (xml.exists("i")) {
            this._level.id = Std.parseInt(xml.get("i"), 10);
        }
        this._jama.network().slotSubmit(this._level, Std.callback(this, "_levelValidated"));
    };
    game.ValidateState.prototype._levelValidated = function (xml) {
        this._jama.setState(new editlist.State(this._jama));
    };
    if (!yota) {
        yota = new Object();
    }
    yota.CbeeRequest = function (commandName, xmlName) {
        this.id = -1;
        this.name = commandName;
        this.xml = new XMLNode(1, xmlName);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.BombFlames = function (parent, coord, depth) {
        this._started = false;
        this._depth = depth;
        this._coord = coord.clone();
        this._layer = parent;
    };
    anim.BombFlames.prototype.update = function (tmod) {
        if (!this._started) {
            this._running = false;
            this._started = true;
            this._mc = yota.McTop.attach(this._layer, "jama_fx_Fire");
            this._mc.swapDepths(this._depth);
            this._mc._x = this._coord.x;
            this._mc._y = this._coord.y;
            this._mc.play();
            var me = this;
            this._mc.startNext = function () {
                me._end();
            };
        }
        return(this._running);
    };
    anim.BombFlames.prototype._end = function () {
        this._running = true;
    };
    if (!anim) {
        anim = new Object();
    }
    anim.LoukiPukeAnim = function (louki) {
        this._louki = louki;
    };
    anim.LoukiPukeAnim.prototype.update = function (tmod) {
        this._louki.unload();
        return(false);
    };
    if (!game) {
        game = new Object();
    }
    game.GameManager = function (aPlayground) {
        super();
        this._playGround = aPlayground;
        this._level = aPlayground.getLevel();
        this._inGhostMode = false;
        this._isPosseding = false;
        this._inputLocked = false;
        this._movements = new Array();
        this._beginLevelFade();
        this._turnCleared = false;
        this._victorious = false;
        this._spaceHit = false;
        this._spaceToggled = false;
        this._spiritSpaces = 0;
    };
    game.GameManager.prototype.__proto__ = Escapeable.prototype;
    game.GameManager.prototype.__constructor__ = Escapeable;
    game.GameManager.prototype.update = function (tmod) {
        if (this._escapeDialog != null) {
            return(undefined);
        }
        if (this.checkEscape() && (this._playGround.getAnimManager().isEmpty())) {
            var self = this;
            var _local_3 = yota.McTop.create(this._playGround.getLayer());
            self._escapeDialog = new gui.dialog.ConfirmWithRetry(_local_3);
            self._escapeDialog.setText("Abandonner la partie ?");
            self._escapeDialog.onValidate = function () {
                self._escapeDialog.destroy();
                self.onAbandon();
            };
            self._escapeDialog.onCancel = function () {
                self._escapeDialog.destroy();
                self._escapeRequested = false;
                self._escapeDialog = null;
            };
            self._escapeDialog.onRetry = function () {
                self._escapeDialog.destroy();
                self.onRestart();
            };
            return(undefined);
        }
        if (Key.isDown(Key.SPACE)) {
            this._spaceHit = true;
        } else if (this._spaceHit) {
            this._spaceToggled = true;
        }
        if ((!this._inputLocked) && (this._turnCleared)) {
            this._processInputs();
        }
        if (((!this._turnCleared) && (!this._playGround.isEnded())) && (this._playGround.getAnimManager().isEmpty())) {
            this._playGround.processReaction();
            if (!this._playGround.getAnimManager().isEmpty()) {
                this._playGround.getAnimManager().flush();
            } else {
                this._turnCleared = true;
                this._processInputs();
            }
        }
        this._inputLocked = this._playGround.getAnimManager().update(tmod);
        if ((!this._inputLocked) && (this._playGround.isEnded())) {
            if (this._playGround.isVictorious()) {
                this._victorious = true;
                this.onVictory();
            } else {
                this.onDefeat();
            }
        }
        this._playGround.setCounterValue(this._movements.length - this._spiritSpaces);
    };
    game.GameManager.prototype.countMoves = function () {
        return(this._movements.length - this._spiritSpaces);
    };
    game.GameManager.prototype.spiritSpaces = function () {
        return(this._spiritSpaces);
    };
    game.GameManager.prototype.getMovements = function () {
        return(this._movements);
    };
    game.GameManager.prototype.getLevel = function () {
        return(this._level);
    };
    game.GameManager.prototype.isVictorious = function () {
        return(this._victorious);
    };
    game.GameManager.prototype._processInputs = function () {
        var _local_2 = Key.isDown(Key.SPACE);
        if (this._spaceToggled) {
            if (this._inGhostMode) {
                this._stopGhostMode();
            } else {
                this._startGhost();
            }
            this._spaceToggled = false;
            this._spaceHit = false;
            return(undefined);
        }
        if (Key.isDown(Key.UP)) {
            this._moveRequest(Direction.NORTH);
            return(undefined);
        }
        if (Key.isDown(Key.DOWN)) {
            this._moveRequest(Direction.SOUTH);
            return(undefined);
        }
        if (Key.isDown(Key.LEFT)) {
            this._moveRequest(Direction.WEST);
            return(undefined);
        }
        if (Key.isDown(Key.RIGHT)) {
            this._moveRequest(Direction.EAST);
            return(undefined);
        }
    };
    game.GameManager.prototype._moveRequest = function (direction) {
        var _local_3 = this._playGround.getCurrentAvatar();
        var _local_4 = _local_3.pos.next(direction);
        if (!this._playGround.getBoard().isValid(_local_4)) {
            return(undefined);
        }
        _local_3.setOrientation(direction);
        if (_local_3.canMove(direction)) {
            _local_3.move(direction);
            this._playGround.processReactionAfterMove();
            this._playGround.getAnimManager().flush();
            this._movements.push(direction);
            this._turnCleared = false;
        }
    };
    game.GameManager.prototype._startGhost = function () {
        var _local_2 = this._playGround.getHero();
        if (_local_2.canStartGhost()) {
            this._spiritSpaces++;
            this._turnCleared = false;
            this._inGhostMode = true;
            this._playGround.activateGhost();
            this._playGround.processReaction();
            this._playGround.getAnimManager().flush();
            this._movements.push(Replay.START_GHOST);
        }
    };
    game.GameManager.prototype._stopGhostMode = function () {
        this._turnCleared = false;
        this._inGhostMode = false;
        this._playGround.deactivateGhost();
        this._playGround.processReaction();
        this._playGround.getAnimManager().flush();
        var _local_2 = this._movements.pop();
        if (_local_2 != Replay.START_GHOST) {
            this._spiritSpaces++;
            this._movements.push(_local_2);
            this._movements.push(Replay.STOP_GHOST);
        } else {
            this._spiritSpaces--;
        }
    };
    game.GameManager.prototype._beginLevelFade = function () {
        if (!Consts.showBeginFade) {
            return(undefined);
        }
        var _local_2 = this._playGround.toGlobalGuiCoord(this._level.startPos);
        _local_2.x = _local_2.x + (Consts.SPRITE_WIDTH / 2);
        _local_2.y = _local_2.y + (Consts.SPRITE_HEIGHT / 2);
        var _local_3 = new anim.FadeInAnim(this._playGround, _local_2);
        this._playGround.getAnimManager().pushEffect(_local_3);
        this._playGround.getAnimManager().flush();
    };
    if (!anim) {
        anim = new Object();
    }
    anim.FadeInAnim = function (playground, coord) {
        this._layer = yota.McTop.create(playground.getFadeLayer());
        this._ground = yota.McTop.create(this._layer);
        this._ground._x = 0;
        this._ground._y = 0;
        yota.Mc.fillSquare(this._ground, Consts.LIGHT_BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
        this._circle1 = yota.McTop.attach(this._layer, "jama_fx_circle1");
        this._circle2 = yota.McTop.attach(this._layer, "jama_fx_circle2");
        this._circle1._x = coord.x;
        this._circle1._y = coord.y;
        this._circle1._width = 0;
        this._circle1._height = 0;
        this._circle2._x = coord.x;
        this._circle2._y = coord.y;
        this._circle2._width = 0;
        this._circle2._height = 0;
        playground.getLayer().setMask(this._circle1);
        this._state = anim.FadeInAnim._SMALL_FADE;
        this._counter = 60;
    };
    anim.FadeInAnim.prototype.update = function (tmod) {
        switch (this._state) {
            case anim.FadeInAnim._WAIT_START : 
                this._counter = this._counter - tmod;
                if (this._counter <= 0) {
                    this._state = anim.FadeInAnim._SMALL_FADE;
                    this._counter = 80;
                }
                return(true);
            case anim.FadeInAnim._SMALL_FADE : 
                this._counter = this._counter - tmod;
                this._circle1._width = this._circle1._width + (tmod * 10);
                this._circle1._yscale = this._circle1._xscale;
                this._circle2._xscale = this._circle1._xscale;
                this._circle2._yscale = this._circle1._yscale;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._circle1._width >= 40) {
                    this._state = anim.FadeInAnim._WAIT_BIG_FADE;
                    this._counter = 80;
                }
                return(true);
            case anim.FadeInAnim._WAIT_BIG_FADE : 
                this._counter = this._counter - tmod;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._counter <= 0) {
                    this._state = anim.FadeInAnim._BIG_FADE;
                    this._counter = 80;
                }
                return(true);
            case anim.FadeInAnim._BIG_FADE : 
                this._counter = this._counter - tmod;
                this._circle1._width = this._circle1._width + (tmod * 15);
                this._circle1._yscale = this._circle1._xscale;
                this._circle2._xscale = this._circle1._xscale;
                this._circle2._yscale = this._circle1._yscale;
                this._circle2._rotation = this._circle2._rotation + (tmod * 15);
                if (this._circle1._width > (Consts.WIDTH * 3)) {
                    this._layer.removeMovieClip();
                    return(false);
                }
                return(true);
        }
        return(false);
    };
    anim.FadeInAnim._WAIT_START = 0;
    anim.FadeInAnim._SMALL_FADE = 1;
    anim.FadeInAnim._WAIT_BIG_FADE = 2;
    anim.FadeInAnim._BIG_FADE = 3;
    if (!state) {
        state = new Object();
    }
    state.Identified = function (j) {
        this._jama = j;
        this._layer = j.newLayer();
    };
    state.Identified.prototype.update = function (tmod) {
        if (this._jama.data().isReady()) {
            this._jama.setState(new menu.State(this._jama));
        }
    };
    if (!anim) {
        anim = new Object();
    }
    anim.MoveAnimControlledByAnim = function (sprite, mc, anim, dest) {
        super(anim);
        this._mc = mc;
        this._dest = dest;
        this._move = new anim.MoveAnim(sprite, this._dest, this._steps);
    };
    anim.MoveAnimControlledByAnim.prototype.__proto__ = anim.SteppedAnim.prototype;
    anim.MoveAnimControlledByAnim.prototype.__constructor__ = anim.SteppedAnim;
    anim.MoveAnimControlledByAnim.prototype.update = function (tmod) {
        var _local_3 = false;
        _local_3 = this._move.update(tmod);
        _local_3 = anim_SteppedAnim_update.call(this, tmod) || (_local_3);
        return(_local_3);
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.dialog) {
        gui.dialog = new Object();
    }
    gui.dialog.ConfirmWithRetry = function (root) {
        this._mc = root;
        this._drawBackground();
        this._createWindow();
    };
    gui.dialog.ConfirmWithRetry.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    gui.dialog.ConfirmWithRetry.prototype.setText = function (str) {
        this._window.content.text = str;
    };
    gui.dialog.ConfirmWithRetry.prototype._drawBackground = function () {
        this._mc.beginFill(Consts.BLACK_BROWN, 100);
        this._mc.moveTo(0, 0);
        this._mc.lineTo(Consts.WIDTH, 0);
        this._mc.lineTo(Consts.WIDTH, Consts.HEIGHT);
        this._mc.lineTo(0, Consts.HEIGHT);
        this._mc.lineTo(0, 0);
        this._mc.endFill();
    };
    gui.dialog.ConfirmWithRetry.prototype._drawHero = function () {
        var _local_2 = yota.McTop.attach(this._mc, "jama_Hero");
        _local_2._x = (Consts.WIDTH / 2) - (_local_2._width / 2);
        _local_2._y = 110;
        _local_2.stop();
        _local_2.j.gotoAndStop("mort");
    };
    gui.dialog.ConfirmWithRetry.prototype._createWindow = function () {
        var _local_2 = this;
        this._window = yota.McTop.attach(this._mc, "jama_GUI_ConfirmRestart");
        this._window._x = Consts.WIDTH / 2;
        this._window._y = Consts.HEIGHT / 2;
        this._window.yes.label.text = "oui";
        this._window.yes.onRelease = Std.callback(this, "onValidate");
        this._window.no.label.text = "non";
        this._window.no.onRelease = Std.callback(this, "onCancel");
        this._window.retry.label.text = "encore";
        this._window.retry.onRelease = Std.callback(this, "onRetry");
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Kohl = function (data) {
        super(data);
    };
    sprite.Kohl.prototype.__proto__ = sprite.Avatar.prototype;
    sprite.Kohl.prototype.__constructor__ = sprite.Avatar;
    sprite.Kohl.prototype.show = function () {
        this.mc.stop();
        this.subMc.stop();
    };
    sprite.Kohl.prototype.showEditor = function () {
        this.mc.gotoAndStop("South");
        this.subMc.stop();
        this.subMc.flame.stop();
    };
    sprite.Kohl.prototype.setOrientation = function (d) {
        this.orientation = d;
        this.mc.gotoAndStop(Direction.nameOf(d));
    };
    sprite.Kohl.prototype.release = function () {
        var _local_2 = this.playground.getCurrentAvatar();
        var _local_3 = _local_2.pos.clone();
        this.board.getBelow(this.pos).crossed(_local_2, -1);
        this.board.getBelow(_local_3).crossed(this, -1);
        this.board.erase(this);
        this.board.erase(_local_2);
        this.board.set(this.pos, _local_2);
        this.board.set(_local_3, this);
        this.playground.refreshPositions();
        this._sleep();
    };
    sprite.Kohl.prototype.burn = function () {
        this.mc.gotoAndStop("burn");
        this.subMc.gotoAndStop("1");
        return(new anim.SteppedAnim(this.subMc));
    };
    sprite.Kohl.prototype.endBurn = function () {
        this.destroy();
    };
    sprite.Kohl.prototype.die = function () {
        this.alive = false;
        var _local_2 = new anim.BurnSprite(this);
        this.playground.getAnimManager().pushEffect(_local_2);
    };
    sprite.Kohl.prototype._sleep = function () {
        this.mc.gotoAndStop("sleep");
        this.subMc.gotoAndStop("1");
        this.playground.getAnimManager().pushEffect(new anim.SteppedAnim(this.subMc));
    };
    if (!anim) {
        anim = new Object();
    }
    anim.VictoryAnim = function (exit) {
        this._exit = exit;
        var _local_4 = exit.playground.toGlobalGuiCoord(exit.pos);
        _local_4.x = _local_4.x + (Consts.SPRITE_WIDTH / 2);
        _local_4.y = _local_4.y + (Consts.SPRITE_HEIGHT / 2);
        super(exit.playground, _local_4, false);
        this._started = false;
    };
    anim.VictoryAnim.prototype.__proto__ = anim.FadeAnim.prototype;
    anim.VictoryAnim.prototype.__constructor__ = anim.FadeAnim;
    anim.VictoryAnim.prototype.update = function (tmod) {
        if (!this._started) {
            this._started = true;
            this._exit.fixDepthes();
            this._exit.playground._hero.mc._x = this._exit.mc._x;
            this._exit.playground._hero.mc._y = this._exit.mc._y;
            this._exit.playground._hero.victory();
            if (!Consts.showVictoFade) {
                return(false);
            }
        }
        return(anim_FadeAnim_update.call(this, tmod));
    };
    if (!state) {
        state = new Object();
    }
    state.Connected = function (j) {
        Jama.endWait();
        this._jama = j;
        this._layer = j.newLayer();
        yota.Mc.fillSquare(this._layer, Consts.BLACK_BROWN, 0, 0, Consts.WIDTH, Consts.HEIGHT);
        this._createLoginDialog();
    };
    state.Connected.prototype.update = function (tmod) {
    };
    state.Connected.prototype._createLoginDialog = function () {
        this._loginDialog = new gui.dialog.Login(this._layer);
        this._loginDialog.onSubmit = Std.callback(this, "_onLoginSubmit");
    };
    state.Connected.prototype._onLoginSubmit = function () {
        Jama.wait();
        this._jama.network().identify(this._loginDialog.getLogin(), this._loginDialog.getPassword(), Std.callback(this, "_identReturn"));
    };
    state.Connected.prototype._identReturn = function (xml) {
        Jama.endWait();
        if (xml.exists("k")) {
            this._createLoginDialog();
        } else {
            this._jama.setState(new state.Identified(this._jama));
            this._jama.network().onIdentSuccess();
        }
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.dialog) {
        gui.dialog = new Object();
    }
    gui.dialog.Confirm = function (root) {
        this._mc = root;
        this._drawBackground();
        this._createWindow();
    };
    gui.dialog.Confirm.prototype.destroy = function () {
        this._mc.removeMovieClip();
    };
    gui.dialog.Confirm.prototype.setText = function (str) {
        this._window.content.text = str;
    };
    gui.dialog.Confirm.prototype._drawBackground = function () {
        this._mc.beginFill(Consts.BLACK_BROWN, 100);
        this._mc.moveTo(0, 0);
        this._mc.lineTo(Consts.WIDTH, 0);
        this._mc.lineTo(Consts.WIDTH, Consts.HEIGHT);
        this._mc.lineTo(0, Consts.HEIGHT);
        this._mc.lineTo(0, 0);
        this._mc.endFill();
    };
    gui.dialog.Confirm.prototype._drawHero = function () {
        var _local_2 = yota.McTop.attach(this._mc, "jama_Hero");
        _local_2._x = (Consts.WIDTH / 2) - (_local_2._width / 2);
        _local_2._y = 110;
        _local_2.stop();
        _local_2.j.gotoAndStop("mort");
    };
    gui.dialog.Confirm.prototype._createWindow = function () {
        var _local_2 = this;
        this._window = yota.McTop.attach(this._mc, "jama_GUI_Confirm");
        this._window._x = Consts.WIDTH / 2;
        this._window._y = Consts.HEIGHT / 2;
        this._window.yes.label.text = "oui";
        this._window.yes.onRelease = Std.callback(this, "onValidate");
        this._window.no.label.text = "non";
        this._window.no.onRelease = Std.callback(this, "onCancel");
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Magnet = function (data) {
        super(data);
        this.isMagnet = true;
    };
    sprite.Magnet.prototype.__proto__ = Sprite.prototype;
    sprite.Magnet.prototype.__constructor__ = Sprite;
    sprite.Magnet.prototype.show = function () {
        this.mc.gotoAndStop(Direction.nameOf(this.orientation));
    };
    sprite.Magnet.prototype.setOrientation = function (d) {
        this.orientation = d;
        this.show();
    };
    sprite.Magnet.prototype.redraw = function () {
    };
    sprite.Magnet.prototype.update = function (onmove) {
        var _local_3 = Direction.oposite(this.orientation);
        var _local_4 = this.pos.clone().next(this.orientation);
        var _local_5 = 0;
        var _local_6 = null;
        var _local_7 = null;
        while (this.board.isValid(_local_4)) {
            var _local_8 = this.board.get(_local_4);
            var _local_9 = this.board.getBelow(_local_4);
            var _local_10 = true;
            if ((_local_9.id == Element.ONE_WAY_STRICT) && (_local_9.orientation != _local_3)) {
                _local_10 = false;
            }
            if (this._canAttractOn(_local_8)) {
                if (_local_6 == null) {
                    _local_6 = _local_4.clone();
                }
            } else if (((_local_6 != null) && (this._canAttract(_local_8))) && (_local_10)) {
                this._attractTo2(_local_8, _local_3);
                return(undefined);
            } else if (this._canAttractOver(_local_8)) {
                _local_6 = null;
            } else {
                return(undefined);
            }
            _local_4 = _local_4.next(this.orientation);
        }
    };
    sprite.Magnet.prototype._canAttractOver = function (s) {
        return(((((((s.id == Element.WATER) || (s.id == Element.ONE_WAY)) || (s.id == Element.PEEBLE)) || (s.id == Element.RUNE)) || (s.id == Element.BRIDGE)) || (s.id == Element.ONE_WAY_STRICT)) || (s.id == Element.EXIT));
    };
    sprite.Magnet.prototype._canAttractOn = function (s) {
        return(((((((((s.id == Element.NONE) || ((s.id == Element.EXIT) && (s.isClosed()))) || ((s.id == Element.ONE_WAY) && (s.orientation != this.orientation))) || ((s.id == Element.ONE_WAY_STRICT) && (s.orientation == Direction.oposite(this.orientation)))) || ((s.id == Element.WATER) && (s.isFilledWithBox()))) || ((s.id == Element.BRIDGE) && (!s.isBroken()))) || (s.id == Element.EYE)) || (s.id == Element.LURKER)) || (s.id == Element.RUNE));
    };
    sprite.Magnet.prototype._canAttract = function (s) {
        if (!s.alive) {
            return(false);
        }
        return((((((((((s.id == Element.BOX) && (!s.isInWater())) || (s.id == Element.BOMB)) || (s.id == Element.FRUIT)) || (s.id == Element.HERO)) || (s.id == Element.LOUKI)) || (s.id == Element.KOHL)) || ((s.id == Element.WINKLE) && (!s.isInWater()))) || (s.id == Element.JADE)) || ((s.id == Element.SPIDER) && (s.isInCocoon())));
    };
    sprite.Magnet.prototype._attractTo2 = function (s, d) {
        if (s.attractedByMagnet == true) {
            return(undefined);
        }
        if (s.isMoving == true) {
            return(undefined);
        }
        s.attractedByMagnet = true;
        s.move(d);
    };
    sprite.Magnet.prototype._attractTo = function (s, d) {
        if (d.equals(s.pos)) {
            return(undefined);
        }
        var _local_4 = d.distanceOf(s.pos);
        this.board.set(d, s);
        var _local_5 = new anim.MoveAnim(s, this.playground.toGuiCoord(d), 3 * _local_4);
        this.playground.getAnimManager().pushEffect(_local_5);
    };
    if (!sprite) {
        sprite = new Object();
    }
    sprite.GoldMagnet = function (data) {
        super(data);
    };
    sprite.GoldMagnet.prototype.__proto__ = sprite.Magnet.prototype;
    sprite.GoldMagnet.prototype.__constructor__ = sprite.Magnet;
    sprite.GoldMagnet.prototype.update = function (onmove) {
        var _local_3 = Direction.oposite(this.orientation);
        var _local_4 = this.pos.clone().next(this.orientation);
        var _local_5 = 0;
        var _local_6 = null;
        var _local_7 = null;
        while (this.board.isValid(_local_4)) {
            var _local_8 = this.board.get(_local_4);
            var _local_9 = this.board.getBelow(_local_4);
            var _local_10 = true;
            if ((_local_9.id == Element.ONE_WAY_STRICT) && (_local_9.orientation != _local_3)) {
                _local_10 = false;
            }
            if (this._canAttractOn(_local_8)) {
                if (_local_6 == null) {
                    _local_6 = _local_4.clone();
                }
            } else if (((((_local_6 != null) && (this._canAttract(_local_8))) && (_local_7 != null)) && (_local_7.canBeCrossed(_local_8, _local_3))) && (_local_10)) {
                this._attractTo2(_local_8, Direction.oposite(this.orientation));
                _local_8 = this.board.getBelow(_local_4);
            } else if (this._canAttractOver(_local_8)) {
                _local_6 = null;
            } else if (_local_8.id == Element.WALL) {
                _local_6 = null;
            } else {
                _local_6 = null;
            }
            _local_7 = _local_8;
            _local_4 = _local_4.next(this.orientation);
        }
    };
    sprite.GoldMagnet.prototype._canAttract = function (s) {
        return(((sprite_Magnet__canAttract.call(this, s) || (s.id == Element.GMAGNET)) || (s.id == Element.MAGNET)) || ((s.id == Element.SPIDER) && (s.isInCocoon())));
    };
    sprite_Magnet__canAttract = sprite.Magnet.prototype._canAttract;
    if (!gui) {
        gui = new Object();
    }
    if (!gui.component) {
        gui.component = new Object();
    }
    gui.component.HorizontalPane = function (managedMC) {
        this._mc = managedMC;
        this._children = new Array();
    };
    gui.component.HorizontalPane.prototype.setDimension = function (w, h) {
        this._width = w;
        this._height = h;
    };
    gui.component.HorizontalPane.prototype.push = function (child) {
        this._children.push(child.getMovieClip());
    };
    gui.component.HorizontalPane.prototype.draw = function () {
        var _local_2 = (this._width - this._requiredWidth()) / (this._children.length + 1);
        var _local_3 = _local_2;
        var _local_4 = 0;
        for ( ; _local_4 < this._children.length ; _local_4++) {
            this._children[_local_4]._x = _local_3;
            _local_3 = _local_3 + (this._children[_local_4]._width + _local_2);
        }
    };
    gui.component.HorizontalPane.prototype.getMovieClip = function () {
        return(this._mc);
    };
    gui.component.HorizontalPane.prototype._requiredWidth = function () {
        var _local_2 = 0;
        var _local_3 = 0;
        for ( ; _local_3 < this._children.length ; _local_3++) {
            _local_2 = _local_2 + this._children[_local_3]._width;
        }
        return(_local_2);
    };
    if (!menu) {
        menu = new Object();
    }
    menu.MenuItem = function (root, id, pos) {
        this._id = id;
        this._createButtonBackground(root);
        this._createButtonText();
        this._selected = false;
        this._scale = 100;
        this._mc._x = Consts.WIDTH / 2;
        this._mc._y = 150 + ((pos + 1) * 30);
    };
    menu.MenuItem.prototype.getId = function () {
        return(this._id);
    };
    menu.MenuItem.prototype.isSelected = function () {
        return(this._selected);
    };
    menu.MenuItem.prototype.update = function (tmod) {
        switch (this._mode) {
            case menu.MenuItem._NONE : 
                if (this._scale > 100) {
                    this._scale = this._scale - tmod;
                } else if (this._scale < 100) {
                    this._scale = Math.round(this._scale);
                    this._scale++;
                    if (this._scale > 100) {
                        this._scale = 100;
                    }
                }
                break;
            case menu.MenuItem._GROW : 
                if (this._scale < 130) {
                    this._scale = this._scale + (tmod * 3);
                } else {
                    this._mode = menu.MenuItem._GROW1;
                }
                break;
            case menu.MenuItem._GROW1 : 
                if (this._scale >= 110) {
                    this._scale = this._scale - (tmod * 2);
                } else {
                    this._mode = menu.MenuItem._GROW2;
                }
                break;
            case menu.MenuItem._GROW2 : 
                if (this._scale < 140) {
                    this._scale = this._scale + (tmod * 2);
                } else if (this._scale > 140) {
                    this._scale = Math.round(this._scale);
                    this._scale = this._scale - 1;
                }
                break;
            case menu.MenuItem._SHRINK : 
                if (this._scale > 100) {
                    this._scale = this._scale - (tmod * 2);
                } else {
                    this._mode = menu.MenuItem._SHRINK1;
                }
                break;
            case menu.MenuItem._SHRINK1 : 
                if (this._scale < 110) {
                    this._scale = this._scale + (tmod * 2);
                } else {
                    this._mode = menu.MenuItem._SHRINK2;
                }
                break;
            case menu.MenuItem._SHRINK2 : 
                if (this._scale > 100) {
                    this._scale = this._scale - (tmod * 2);
                } else {
                    this._mode = menu.MenuItem._NONE;
                }
                break;
        }
        this._mc._xscale = this._scale;
        this._mc._yscale = this._scale;
    };
    menu.MenuItem.prototype.onMouseOver = function () {
        this._mode = menu.MenuItem._GROW;
    };
    menu.MenuItem.prototype.onMouseOut = function () {
        this._mode = menu.MenuItem._SHRINK;
    };
    menu.MenuItem.prototype.onRelease = function () {
        this._selected = true;
    };
    menu.MenuItem.prototype._createButtonBackground = function (parent) {
        var _local_3 = yota.McTop.attach(parent, "jama_Menu_ButtonBackground");
        _local_3.gotoAndStop(Std.toString(this._id));
        this._mc = _local_3;
    };
    menu.MenuItem.prototype._createButtonText = function () {
        var _local_2 = yota.McTop.attach(this._mc, "jama_Menu_Button");
        _local_2.text.gotoAndStop(Std.toString(this._id));
        _local_2.control = this;
    };
    menu.MenuItem._NONE = 0;
    menu.MenuItem._GROW = 1;
    menu.MenuItem._GROW1 = 2;
    menu.MenuItem._GROW2 = 3;
    menu.MenuItem._SHRINK = 10;
    menu.MenuItem._SHRINK1 = 11;
    menu.MenuItem._SHRINK2 = 12;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Winkle = function (data) {
        super(data);
        this._inWater = false;
        this._asleep = false;
    };
    sprite.Winkle.prototype.__proto__ = sprite.Avatar.prototype;
    sprite.Winkle.prototype.__constructor__ = sprite.Avatar;
    sprite.Winkle.prototype.isInWater = function () {
        return(this._inWater);
    };
    sprite.Winkle.prototype.show = function () {
        this.mc.stop();
        this.subMc.stop();
    };
    sprite.Winkle.prototype.showEditor = function () {
        this.mc.gotoAndStop("sleep");
        this.subMc.stop();
    };
    sprite.Winkle.prototype.wakeUp = function () {
        this._asleep = true;
        if (this._inWater) {
            var _local_2 = Std.callback(this, "_wakeupInWater");
            this.playground.getAnimManager().pushEffect(new anim.CallbackAnim(_local_2));
        } else {
            sprite_Avatar_wakeUp.call(this);
        }
    };
    sprite.Winkle.prototype.setOrientation = function (d) {
        this.orientation = d;
        if (this._asleep) {
            if ((!this._inWater) || (this.canMove(d))) {
                this.mc.gotoAndStop(Direction.nameOf(d));
            }
        }
    };
    sprite.Winkle.prototype.release = function () {
        if (!this._inWater) {
            this.mc.gotoAndStop("sleep");
            this.subMc.gotoAndStop("1");
            this.playground.getAnimManager().pushEffect(new anim.SteppedAnim(this.subMc));
        }
    };
    sprite.Winkle.prototype.canMove = function (d) {
        var _local_3 = this.pos.next(d);
        var _local_4 = this.board.get(_local_3);
        if ((_local_4.id == Element.WATER) && (_local_4.canBeCrossed(this, d))) {
            return(true);
        }
        return(sprite_Avatar_canMove.call(this, d));
    };
    sprite.Winkle.prototype.move = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        if (!this.board.isValid(_local_4)) {
            return(undefined);
        }
        var _local_5 = this.board.get(_local_4);
        if (((_local_5.id == Element.WATER) && (_local_5.canBeCrossed(_local_3, d))) || (((_local_5.id == Element.BRIDGE) && (_local_5.isBroken())) && (_local_5.canBeCrossed(_local_3, d)))) {
            var _local_6 = _local_5;
            if (!_local_6.isFilledWithBox()) {
                if (this._inWater) {
                    this._swim();
                } else {
                    this._inWater = true;
                    this.setOrientation(d);
                    this.playground.getAnimManager().pushEffect(new anim.WinkleEnterWaterAnim(this));
                }
                this.playground.move(this.pos, d, null);
                return(undefined);
            }
        }
        this._inWater = false;
        sprite_Avatar_move.call(this, d);
    };
    sprite.Winkle.prototype._swim = function () {
        this.mc.gotoAndStop("swim");
        this.subMc.gotoAndPlay("1");
    };
    sprite.Winkle.prototype._wakeupInWater = function () {
        this.playground.getGhost().destroy();
    };
    if (!anim) {
        anim = new Object();
    }
    anim.JadeSmokeAnim = function (jade, direction) {
        this._jade = jade;
        this._d = direction;
    };
    anim.JadeSmokeAnim.prototype.update = function (tmod) {
        if (this._anim == null) {
            var _local_3 = this._jade.pos.next(this._d);
            if (!this._jade.board.isValid(_local_3)) {
                return(false);
            }
            this._initAnim(_local_3);
        }
        var _local_4 = !this._anim.update(tmod);
        if (_local_4) {
            this._layer.removeMovieClip();
        }
        return(!_local_4);
    };
    anim.JadeSmokeAnim.prototype._initAnim = function (p) {
        this._layer = yota.McTop.create(this._jade.playground.getLayer());
        this._layer._x = this._jade.playground._horizontalPadding();
        this._layer._y = this._jade.playground._verticalPadding();
        this._gaz = yota.McTop.attach(this._layer, "jama_fx_Gaz");
        this._gaz.gotoAndStop("1");
        this._gaz._x = p.x * Consts.SPRITE_HEIGHT;
        this._gaz._y = p.y * Consts.SPRITE_WIDTH;
        this._anim = new anim.SteppedAnim(this._gaz);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.FruitMerge = function (f1, f2) {
        this._alpha = 100;
        this._steps = 15;
        this._alphaMod = this._alpha / this._steps;
        this._f1 = f1;
        this._f2 = f2;
        var _local_4 = new Coord(this._f2.mc._x, this._f2.mc._y);
        this._move = new anim.MoveAnim(this._f1, _local_4, this._steps);
    };
    anim.FruitMerge.prototype.update = function (tmod) {
        var _local_3 = this._move.update(tmod);
        this._alpha = this._alpha - (this._alphaMod * tmod);
        if ((_local_3 == false) || (this._alpha < 0)) {
            this._alpha = 0;
        }
        this._f1.mc._alpha = this._alpha;
        this._f2.mc._alpha = this._alpha;
        if (this._alpha == 0) {
            return(false);
        }
        return(_local_3);
    };
    if (!gui) {
        gui = new Object();
    }
    if (!gui.component) {
        gui.component = new Object();
    }
    gui.component.JamaButton = function (parent, label) {
        this._mc = yota.McTop.attach(parent, "jama_gui_Button");
        this._mc.label = label;
        this._mc.onRelease = Std.callback(this, "onClick");
    };
    gui.component.JamaButton.prototype.getMovieClip = function () {
        return(this._mc);
    };
    if (!yota) {
        yota = new Object();
    }
    yota.Keyboard = function (mode) {
        this._mode = mode;
        this._code = 0;
        this._lock = false;
        Key.addListener(this);
    };
    yota.Keyboard.prototype.destroy = function () {
        Key.removeListener(this);
    };
    yota.Keyboard.prototype.onKeyDown = function () {
        if ((!this._lock) && ((this._mode & yota.Keyboard.DOWN) == yota.Keyboard.DOWN)) {
            this._code = Key.getCode();
        }
    };
    yota.Keyboard.prototype.onKeyUp = function () {
        if ((!this._lock) && ((this._mode & yota.Keyboard.UP) == yota.Keyboard.UP)) {
            this._code = Key.getCode();
        }
    };
    yota.Keyboard.prototype.hasNext = function () {
        return(this._code != 0);
    };
    yota.Keyboard.prototype.next = function () {
        var _local_2 = this._code;
        this._code = 0;
        return(_local_2);
    };
    yota.Keyboard.prototype.clear = function () {
        this._code = 0;
    };
    yota.Keyboard.prototype.lock = function (l) {
        this._lock = l;
        if (this._lock) {
            this._code = 0;
        }
    };
    yota.Keyboard.DOWN = 1;
    yota.Keyboard.UP = 2;
    yota.Keyboard.BOTH = 3;
    if (!yota) {
        yota = new Object();
    }
    yota.Log = function (mc) {
        this._text = "";
        this._createDebugPane(mc);
        this._createTextArea();
        this.hide();
        Key.addListener(this);
    };
    yota.Log.prototype.show = function () {
        this._updateArea();
        this._pane._visible = true;
    };
    yota.Log.prototype.hide = function () {
        this._textArea.text = "";
        this._pane._visible = false;
    };
    yota.Log.prototype.clear = function () {
        this._text = "";
        this._textArea.text = "";
    };
    yota.Log.prototype.destroy = function () {
        this._pane.removeMovieClip();
        Key.removeListener(this);
    };
    yota.Log.prototype.trace = function (msg) {
        this._text = this._text + (msg + newline);
        if (this._pane._visible) {
            this._updateArea();
        }
    };
    yota.Log.prototype.onKeyDown = function () {
    };
    yota.Log.prototype.onKeyUp = function () {
        var _local_2 = Key.getCode();
        if (_local_2 == "$D".charCodeAt(1)) {
            this._toggleVisibility();
            return(undefined);
        }
        if (!this._pane._visible) {
            return(undefined);
        }
        switch (_local_2) {
            case Key.DELETEKEY : 
                this.clear();
                break;
            default : 
        }
    };
    yota.Log.prototype._createDebugPane = function (mc) {
        this._width = mc._width;
        this._height = mc._height;
        if (this._width == 0) {
            this._width = Stage.width;
        }
        if (this._height == 0) {
            this._height = Stage.height;
        }
        var _local_3 = this._width;
        var _local_4 = this._height;
        var _local_5 = 2000;
        this._pane = Std.createEmptyMC(mc, _local_5);
        this._pane.beginFill(3355443, 80);
        this._pane.lineStyle(2, 255, 100);
        this._pane.moveTo(0, 0);
        this._pane.lineTo(_local_3, 0);
        this._pane.lineTo(_local_3, _local_4);
        this._pane.lineTo(0, _local_4);
        this._pane.lineTo(0, 0);
        this._pane.endFill();
    };
    yota.Log.prototype._createTextArea = function () {
        var _local_2 = this._width;
        var _local_3 = this._height;
        this._textArea = Std.createTextField(this._pane, 2000);
        this._textArea._x = yota.Log._PADDING;
        this._textArea._y = yota.Log._PADDING;
        this._textArea._width = _local_2 - (yota.Log._PADDING * 2);
        this._textArea._height = _local_3 - (yota.Log._PADDING * 2);
        this._textArea.mouseWheelEnabled = true;
        this._textArea.wordWrap = true;
        this._textArea.multiline = true;
        var _local_4 = this._textArea.getTextFormat();
        _local_4["color"] = 15658751 /* 0xEEEEFF */;
        _local_4.bullet = false;
        _local_4.font = "courier";
        _local_4.size = 12;
        _local_4.leading = 0;
        this._textArea.setNewTextFormat(_local_4);
    };
    yota.Log.prototype._toggleVisibility = function () {
        if (this._pane._visible) {
            this.hide();
        } else {
            this.show();
        }
    };
    yota.Log.prototype._updateArea = function () {
        this._textArea.text = this._text;
        this._textArea.scroll = this._textArea.maxscroll;
    };
    yota.Log._PADDING = 5;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Fruit = function (data) {
        super(data);
        if ((this.param <= 0) || (this.param == null)) {
            this.param = this.defaultParameter();
        }
    };
    sprite.Fruit.prototype.__proto__ = Sprite.prototype;
    sprite.Fruit.prototype.__constructor__ = Sprite;
    sprite.Fruit.prototype.show = function () {
        this.subMc.gotoAndStop(this.param);
    };
    sprite.Fruit.prototype.requiresParameter = function () {
        return(true);
    };
    sprite.Fruit.prototype.defaultParameter = function () {
        return(1);
    };
    sprite.Fruit.prototype.setParameter = function (p) {
        if ((p > 5) || (p <= 0)) {
            p = 1;
        }
        if (!Jama.getPlayer().canUseFruit(p)) {
            return(this.param);
        }
        this.param = p;
        this.show();
        return(this.param);
    };
    sprite.Fruit.prototype.canBeCrossed = function (sprite, direction) {
        return((sprite.id == Element.FRUIT) && (this.param == sprite.param));
    };
    sprite.Fruit.prototype.crossed = function (sprite, d) {
        var _local_4 = new anim.FruitMerge(sprite, this);
        this.playground.getAnimManager().push(_local_4, 0);
        this.board.erase(this);
        this.alive = false;
        this.board.erase(sprite);
        sprite.alive = false;
    };
    sprite.Fruit.prototype.canBePushed = function (sprite) {
        return(sprite.id == Element.HERO);
    };
    sprite.Fruit.prototype.canMove = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        if (!this.board.isValid(_local_4)) {
            return(false);
        }
        return(this.board.get(_local_4).canBeCrossed(_local_3, d));
    };
    sprite.Fruit.prototype.move = function (d) {
        var _local_3 = this;
        var _local_4 = this.pos.next(d);
        var _local_5 = this.board.get(_local_4);
        _local_5.crossed(_local_3, d);
        if (_local_5.id != Element.FRUIT) {
            this.playground.move(this.pos, d, null);
        }
    };
    sprite.Fruit.prototype.burn = function () {
        this.mc.gotoAndStop("burn");
        return(new anim.SteppedAnim(this.mc));
    };
    sprite.Fruit.prototype.endBurn = function () {
        this.destroy();
    };
    if (!help) {
        help = new Object();
    }
    help.State = function (main) {
        this._jama = main;
        this._window = new help.Window(this._jama.newLayer(), "index");
        this._window.setStyle(this._jama.data().getHelpStyle());
        this._window.setContent("index", this._jama.data().getHelpSection("index"));
        this._window.requestContent = function (key) {
            return(main.data().getHelpSection(key));
        };
        this._window.requestQuit = function () {
            main.setState(new menu.State(main));
        };
    };
    help.State.prototype.update = function (tmod) {
        this._window.update(tmod);
        if (Key.isDown(Key.ESCAPE)) {
            this._jama.setState(new menu.State(this._jama));
            return(undefined);
        }
    };
    if (!adventure) {
        adventure = new Object();
    }
    adventure.TutorialPack = function () {
        super("Tutoriaux");
        this.levels.push(new adventure.Level("Tutorial 1 : par ou la sortie", "10033020-10b21-10"));
        this.levels.push(new adventure.Level("Tutorial 2 : pousse les fruits", "10044003-103301032010"));
        this.levels.push(new adventure.Level("Tutorial 3 : plus de pulpe", "10044003-1032010330103212033120"));
        this.levels.push(new adventure.Level("Tutorial 4 : bouge ta caisse", "10044201-10210-10022-10"));
        this.levels.push(new adventure.Level("Tutorial 5 : plouf la caisse", "10044022-10201-10210-10720-10730-10731-10732-10733-10723-10713-10703-10702-10711-10"));
        this.levels.push(new adventure.Level("Tutorial 6 : un mur est un mur", "10055802-10812-10832-10842-10013-10222-10831-10830-10833-10834-10"));
        this.levels.push(new adventure.Level("Tutorial 7 : sens unique", "10055004-10b01-10b11-10b21-10b31-12b41-10b32-12b33-12b34-13b24-13b14-13812-10823-10813-10b02-10b03-10b42-10b43-10b44-10222-10"));
        this.levels.push(new adventure.Level("Tutorial 8 : attention araignees", "10077006-10301103021036310353108300083100842008320083400844008350083600656-13660-13854-10"));
        this.levels.push(new adventure.Level("Tutorial 9 : tiki vs electrifikator", "14055522-10211-10231-10004-10"));
        this.levels.push(new adventure.Level("Tutorial 10 : petit pas ta pont", "10166m11-10m21-10m31-10m41-10m42-10m43-10m44-10m24-10m23-10m22-10714-10713-10712-10704-10703-10702-10710-10720-10730-10740-10750-10751-10753-10754-10705-10715-10755-10752-10732-10733-10734-10735-10025-12045-10"));
        this.levels.push(new adventure.Level("Tutorial 11 : la bobombe", "10066854-10c35403451030510724-1271402855-12051-11853-10852-10841-10c21207100272202723027440274302742027300274002750027040270302713027020271202"));
        this.levels.push(new adventure.Level("Tutorial 12 : Louki c'est mon copain", "10477033-10834-10743-10732-10723-10722-10742-10724-10716-10706-10756-10766-10726-10746-10700-10701-10702-10712-10710-10752-10762-10761-10760-10750-10730-10731-10744-10h64-10"));
    };
    adventure.TutorialPack.prototype.__proto__ = adventure.Pack.prototype;
    adventure.TutorialPack.prototype.__constructor__ = adventure.Pack;
    Level = function () {
        super();
        this.version = 1;
        this.startPos = new Coord(0, 0);
        this.size = new Dimension(0, 0);
        this.tiles = new Array();
    };
    Level.prototype.__proto__ = LevelEntry.prototype;
    Level.prototype.__constructor__ = LevelEntry;
    Level.createFromXml = function (xml) {
        var _local_3 = new Level();
        _local_3.setValuesFromXml(xml);
        _local_3.parse(xml.firstChild.nodeValue);
        return(_local_3);
    };
    Level.prototype.clone = function () {
        var _local_2 = new Level();
        _local_2.version = this.version;
        _local_2.startPos = this.startPos.clone();
        _local_2.size = this.size.clone();
        var _local_3 = 0;
        for ( ; _local_3 < this.tiles.length ; _local_3++) {
            _local_2.tiles.push(new Element(this.tiles[_local_3]));
        }
        return(_local_2);
    };
    Level.prototype.parse = function (packed) {
        this.tiles = new Array();
        var _local_3 = new Chunker(packed);
        this.version = _local_3.next();
        this.startPos.x = _local_3.next();
        this.startPos.y = _local_3.next();
        this.size.width = _local_3.next();
        this.size.height = _local_3.next();
        while (!_local_3.eos()) {
            var _local_4 = new Element(null);
            _local_4.id = _local_3.next();
            _local_4.pos.x = _local_3.next();
            _local_4.pos.y = _local_3.next();
            _local_4.param = _local_3.next();
            _local_4.orientation = _local_3.next();
            this.tiles.push(_local_4);
        }
    };
    Level.prototype.dump = function () {
        var _local_2 = "";
        _local_2 = _local_2 + Chunker.encode(this.version);
        _local_2 = _local_2 + Chunker.encode(this.startPos.x);
        _local_2 = _local_2 + Chunker.encode(this.startPos.y);
        _local_2 = _local_2 + Chunker.encode(this.size.width);
        _local_2 = _local_2 + Chunker.encode(this.size.height);
        var _local_3 = 0;
        for ( ; _local_3 < this.tiles.length ; _local_3++) {
            var _local_4 = this.tiles[_local_3];
            _local_2 = _local_2 + Chunker.encode(_local_4.id);
            _local_2 = _local_2 + Chunker.encode(_local_4.pos.x);
            _local_2 = _local_2 + Chunker.encode(_local_4.pos.y);
            _local_2 = _local_2 + Chunker.encode(_local_4.param);
            _local_2 = _local_2 + Chunker.encode(_local_4.orientation);
        }
        return(_local_2);
    };
    Level.prototype.toString = function () {
        var _local_2 = "";
        _local_2 = _local_2 + "Level -------------------\n";
        _local_2 = _local_2 + ((" *version : " + this.version) + newline);
        _local_2 = _local_2 + ((" *size    : " + this.size.toString()) + newline);
        _local_2 = _local_2 + ((" *start   : " + this.startPos.toString()) + newline);
        return(_local_2);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.ParallelAnimations = function () {
        this._timer = 0;
        this._anims = new Array();
    };
    anim.ParallelAnimations.prototype.push = function (anim, delay) {
        this._anims.push({delay:delay, anim:anim});
    };
    anim.ParallelAnimations.prototype.update = function (tmod) {
        this._timer = this._timer + tmod;
        var _local_3 = 0;
        for ( ; _local_3 < this._anims.length ; _local_3++) {
            var _local_4 = this._anims[_local_3];
            if (_local_4.delay <= this._timer) {
                var _local_5 = _local_4.anim.update(tmod);
                if (!_local_5) {
                    this._anims.remove(_local_4);
                    _local_3--;
                }
            }
        }
        return(this._anims.length > 0);
    };
    anim.ParallelAnimations.prototype.isEmpty = function () {
        return(this._anims.length == 0);
    };
    if (!anim) {
        anim = new Object();
    }
    anim.LurkerShotAnim = function (lurker, dest, dist) {
        this._lurker = lurker;
        this._layer = yota.McTop.create(this._lurker.playground.getGround());
        this._mc = yota.McTop.attach(this._layer, "jama_fx_LurkerShot");
        this._mc.stop();
        this._mc._x = this._lurker.mc._x;
        this._mc._y = this._lurker.mc._y;
        this._anim = new anim.McMoveAnim(this._mc, dest, dist * 4);
        this._mc._visible = false;
        this._state = anim.LurkerShotAnim._ST_INIT;
    };
    anim.LurkerShotAnim.prototype.update = function (tmod) {
        switch (this._state) {
            case anim.LurkerShotAnim._ST_INIT : 
                this._mc._visible = true;
                this._state = anim.LurkerShotAnim._ST_MOVE;
                this._counter = 2;
                return(true);
            case anim.LurkerShotAnim._ST_WAIT : 
                this._counter = this._counter - tmod;
                if (this._counter <= 0) {
                    this._state = anim.LurkerShotAnim._ST_MOVE;
                }
                return(true);
            case anim.LurkerShotAnim._ST_MOVE : 
                var _local_3 = this._anim.update(tmod);
                if (!_local_3) {
                    this._state = anim.LurkerShotAnim._ST_HIT;
                }
                return(true);
            case anim.LurkerShotAnim._ST_HIT : 
                var _local_4 = yota.McTop.create(this._layer);
                yota.Mc.fillSquare(_local_4, 16777215, 0, 0, Consts.WIDTH, Consts.HEIGHT);
                this._state = anim.LurkerShotAnim._ST_END;
                return(true);
            case anim.LurkerShotAnim._ST_END : 
                this._layer.removeMovieClip();
                this._lurker.show();
                return(false);
        }
        return(false);
    };
    anim.LurkerShotAnim._ST_INIT = 1;
    anim.LurkerShotAnim._ST_WAIT = 2;
    anim.LurkerShotAnim._ST_MOVE = 3;
    anim.LurkerShotAnim._ST_HIT = 4;
    anim.LurkerShotAnim._ST_END = 5;
    if (!sprite) {
        sprite = new Object();
    }
    sprite.Peeble = function (data) {
        super(data);
        this.below = true;
    };
    sprite.Peeble.prototype.__proto__ = Sprite.prototype;
    sprite.Peeble.prototype.__constructor__ = Sprite;
    sprite.Peeble.prototype.canBeCrossed = function (sprite, d) {
        return((sprite.id == Element.GHOST) || (sprite.id == Element.KOHL));
    };
