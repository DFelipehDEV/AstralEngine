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
                    _actionFrame = ds_list_find_value(ds_map_get(sysInput.buttonInputIcons, _actionName), 1);

                    switch (_actionFrame) {
                        case 0:
                            _newText += '[';
                            break;
                        case 1:
                            _newText += '\';
                            break;
                        case 2:
                            _newText += ']';
                            break;
                        case 3:
                            _newText += '^';
                            break;
                    }
                } else {
                    _actionFrame = ds_list_find_value(ds_map_get(sysInput.keyInputIcons, _actionName), 1);
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
