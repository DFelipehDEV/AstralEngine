/// ParseDialogueText(text)
var _text, _newText, _tagName, _parsingTag;
_text = argument0;

_newText = "";
_tagName = "";
_parsingTag = false;

var i, _c;
i = 1 repeat (string_length(_text)) {
    _c = string_char_at(_text, i);
    i += 1;

    if (_c == '[') {
        _parsingTag = true;
    }

    if (!_parsingTag) {
        _newText += _c;
    } else {
        if (_c == ']') {
            _parsingTag = false;
            var _tagLength;
            _tagLength = string_length(_tagName);
            var _actionPos;
            _actionPos = string_pos("Input.", _tagName);
            if (_actionPos != 0) {
                var _actionName, _actionFrame;
                _actionName = string_copy(_tagName, _actionPos + string_length("Input."), _tagLength);
                if (joystick_exists(0)) {
                    _actionFrame = ds_map_get(World.buttonInputIcons, _actionName);

                    /* We are repeating the button sprites in the sprFontText font so that way we can
                        place buttons inside the dialogue. The font starts at ',' in the ascii table
                        and ends at 'Z'. After the 'Z', theres the xbox buttons, being mapped to '[', '\', ']' and '^'
                        respectively. After the xbox buttons, we have the playstation buttons, which are mapped to
                        '_', '`', 'a' and 'b'. The reason it was done this way is because our font is not monospaced,
                        and if we were to make our own draw_text implementation, the spacing would be off. Also theres
                        no way to know the spacing between letters that gamemaker calculates when creating the font.
                        Look for a ascii table to better understand how this works or when adding more buttons.
                    */
                    switch (_actionFrame) {
                        case gp_face1:
                            _actionFrame = 0;
                            break;
                        case gp_face2:
                            _actionFrame = 1;
                            break;
                        case gp_face3:
                            _actionFrame = 2;
                            break;
                        case gp_face4:
                            _actionFrame = 3;
                            break;
                    }

                    switch (World.buttonSprite) {
                        case sprPlaystationButtons:
                            _newText += chr(ord('_') + _actionFrame);
                            break;

                        case sprXboxButtons:
                            _newText += chr(ord('[') + _actionFrame);
                            break;
                    }

                } else {
                    _actionFrame = ds_map_get(World.keyInputIcons, _actionName);
                    _newText += chr(ord('A') + _actionFrame);
                }
            }
            _tagName = "";
            continue;
        }
        if (_c != '[') {
            _tagName += _c;
        }
        continue;
    }
}
return _newText;
