# Bridge to Native

An exercise to integrate React Native components into an existing iOS app, based on React Native's [official guide](https://facebook.github.io/react-native/docs/integration-with-existing-apps.html).

## Issues

Xcode fails to build the native iOS swift app when the yoga pod is installed from the latest React Native releases (v0.52.0 - v0.54.0). This [open issue](https://github.com/facebook/yoga/issues/711) is being tracked on the facebook/yoga repository.

Due to the yoga pod issue, this project uses [react-native@0.51.0](https://github.com/facebook/react-native/releases/tag/v0.51.0). However, v0.51.0 also comes with its own caveat, regarding an outdated import of `fishhook.h`. This particular case is temporarily solved by the following `postinstall` script in `package.json`:

```
"postinstall": "sed -i '' 's#<fishhook/fishhook.h>#\"fishhook.h\"#g' ./node_modules/react-native/Libraries/WebSocket/RCTReconnectingWebSocket.m"
```

The `postinstall` workaround will remain in place until all breaking changes have been fixed in a newer React Native release.
