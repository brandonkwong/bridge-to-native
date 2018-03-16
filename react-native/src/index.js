import React, { Component } from 'react';
import { AppRegistry } from 'react-native';

import Home from './screens/Home';

class RNTab extends Component {
  render() {
    return <Home />;
  }
}

AppRegistry.registerComponent('RNTab', () => RNTab);
