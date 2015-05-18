/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  TouchableHighlight,
  PixelRatio,
  View,
} = React;

var ToolTipMenu = require('NativeModules').ToolTipMenu;
var ToolTipText = require('./ToolTipText');

var tooltip = React.createClass({
  getInitialState: function() {
    return {
      input: 'chirag',
    }
  },
  handleChange: function(event) {
    this.setState({input: event.nativeEvent.text});
  },
  handleFocus: function(change) {
    ToolTipMenu.show(this.refs.input.getNodeHandle(), ['x', 'z']);
  },
  render: function() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
        <View style={styles.textinputContainer}>
          <ToolTipText
            suppressHighlighting={true}
            onChange={this.handleChange}
            onPress={this.handleFocus}
            ref={'input'}
            style={styles.textinput}
          >{this.state.input}</ToolTipText>
        </View>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  textinputContainer: {
    marginTop: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  textinput: {
    width: 60,
    marginVertical: 2,
    marginHorizontal: 2,
    borderWidth: 1 / PixelRatio.get(),
    borderRadius: 5,
    borderColor: '#c7c7cc',
    padding: 2,
    fontSize: 14,
    backgroundColor: 'white',
  },
});

AppRegistry.registerComponent('tooltip', () => tooltip);
