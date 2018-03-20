# Bridge to Native

An exercise to integrate React Native into an existing iOS (Swift) app as a singular tab bar view.

## Getting Started

To get this example running, first `git clone` the project and `cd bridge-to-native`.

### Install

Both of the native iOS and react-native apps must have the same versions of React and React Native installed. Run `yarn` from both the root project, as well as the `./react-native` directory:

```
yarn && cd react-native && yarn
```

### Build

The native iOS app can be built and ran from Xcode by opening Tabby.xcworkspace, located in the `./ios` directory. Before running, make sure to start the development server from within the `./react-native` directory:

```
yarn start
```

## Development

As the React Native app is developed, any React Native Components and APIs (e.g., `ListView`, `Image`, etc.) outside of the `Core` subspec, must be installed from the iOS `Podfile` if not already present. For more information regarding this, refer to the [Configuring CocoaPods dependencies](https://facebook.github.io/react-native/docs/integration-with-existing-apps.html#configuring-cocoapods-dependencies) section of the official documentation for [Integration with Existing Apps](https://facebook.github.io/react-native/docs/integration-with-existing-apps.html).

## Issues

Xcode fails to build the native iOS swift app when the yoga pod is installed from the latest React Native releases (v0.52.0 - v0.54.0). This [open issue](https://github.com/facebook/yoga/issues/711) is being tracked on the facebook/yoga repository.

Due to the yoga pod issue, this project uses [react-native@0.51.0](https://github.com/facebook/react-native/releases/tag/v0.51.0). However, v0.51.0 also comes with its own caveat, regarding an outdated import of `fishhook.h`. This particular case is temporarily solved by the following `postinstall` script in `package.json`:

```
"postinstall": "sed -i '' 's#<fishhook/fishhook.h>#\"fishhook.h\"#g' ./node_modules/react-native/Libraries/WebSocket/RCTReconnectingWebSocket.m"
```

The `postinstall` workaround will remain in place until all breaking changes have been fixed in a newer React Native release.

## References

Integrating React Native into existing native apps is still relatively under-documented, especially for iOS apps developed in Swift. The following sources were used to help with this exercise, though they still primarily focus on Objective-C:

- [Integration with Existing Apps](https://facebook.github.io/react-native/docs/integration-with-existing-apps.html)
- [React Native Hybrid App Examples](https://github.com/dsibiski/react-native-hybrid-app-examples/blob/master/README.md)
- [React Native Tutorial: Integrating in an Existing App](https://www.raywenderlich.com/136047/react-native-existing-app)
