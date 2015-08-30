# react-native-check-file-exists-ios

This is a wrapper for react-native that checks if a file exists in the app documents directory. Returns "yes" if exists, "no" if does not exists.

# Add it to your project

npm install react-native-check-file-exists-ios --save

In XCode, in the project navigator, right click Libraries ➜ Add Files to [your project's name]

Go to node_modules ➜ react-native-check-file-exists and add RNCheckFileExists.xcodeproj

In XCode, in the project navigator, select your project. Add libRNCheckFileExists.a to your project's Build Phases ➜ Link Binary With Libraries

Click RNCheckFileExists.xcodeproj in the project navigator and go the Build Settings tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for Header Search Paths and make sure it contains both $(SRCROOT)/../react-native/React and $(SRCROOT)/../../React - mark both as recursive.

Run your project (Cmd+R)

Setup trouble?

If you get stuck, take a look at Brent Vatne's blog. He was gracious enough to help out on this project, and his blog is my go to reference for this stuff.

# Api Setup

var {

    RNCheckFileExists

} = require('NativeModules');

RNCheckFileExists.checkFile(

    'MyFile.txt',                   // File name

    function errorCallback(results) {

        console.log('Error: ' + results['errMsg']);

    },

    function successCallback(results) {

        console.log('Success: ' + results['successMsg']);

        // if file exists - results['successMsg'] == "yes"
        // if file does not exist - results['successMsg'] == "no"

    }
);

# Error Callback

The following will cause an error callback (use the console.log to see the specific message):

1) File name not set in javascript

2) File name does not contain a valid extension. Hidden files are also not allowed

# Acknowledgements

Special thanks to Brent Vatne for his posts on creating a react native packager. Some portions of this code have been based on answers from stackoverflow. This package also owes a special thanks to the tutorial by Modus Create on how to create a custom react native module.
