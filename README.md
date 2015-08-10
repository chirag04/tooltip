# tooltip
example implementation of uimenucontroller for uitextfield with react-native.

Text component is not having onChange so we use category on RCTText to add eventDispatcher on it.

TooltipMenu module will show the uimenucontroller on the text component and call the selector in RCTText which will emit the change event.

#Api

```
var ToolTipMenu = require('NativeModules').ToolTipMenu;


In render:
<Text
    ref={'input'}
    onChange={this.handleChange}
    onFocus={this.handleFocus}
    style={styles.textinput}
  />

Show the menu on focus:

handleFocus: function(change) {
  ToolTipMenu.show(this.refs.input.getNodeHandle(), ['x', 'z']);
},
  
```

#Problems:
Keyboard also opens up along with the tooltip. UITextFieldDelegate could be of help but we couldn't make it work.

Possible solutions that din't work:
 - setting panResponders to disable keyboard. In this case onFocus is not triggred.
 - setting pointer-event to box-only also does not trigger onFocus.
 - setting editable false and having TouchableHighlight onPress to trigger show does not work either.

Here is how it looks:
![Demo gif](https://github.com/chirag04/tooltip/blob/master/screenshot.png)


#Credits

This was only possible because of help from
 
 [@brentvatne](https://github.com/brentvatne)
 [@ide](https://github.com/ide)
 [@robertjpayne](https://github.com/robertjpayne)
