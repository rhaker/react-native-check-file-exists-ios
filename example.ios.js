/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var {
    RNCheckFileExists
} = require('NativeModules');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var testComp = React.createClass({
  componentDidMount() {
    RNCheckFileExists.checkFile(
        'MyFile1.txt',                   // File name
        function errorCallback(results) {
            console.log('Error: ' + results['errMsg']);
        },
        function successCallback(results) {
            console.log('Success: ' + results['successMsg']);
        }
    );
  },
  render: function() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Check File Exist - View Xcode Log
        </Text>
        <Text style={styles.instructions}>
          File Exists - Log == "yes"
        </Text>
        <Text style={styles.instructions}>
          File Does Not Exist - Log == "no"
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
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
});

AppRegistry.registerComponent('testComp', () => testComp);
