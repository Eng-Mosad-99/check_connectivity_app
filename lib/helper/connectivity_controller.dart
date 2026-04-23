import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();

  static final ConnectivityController instance = ConnectivityController._();
  ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);

  Future<void> init() async {
    // Initialize connectivity monitoring here
    final result = await Connectivity().checkConnectivity();
    isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(isInternetConnected);
  }

  bool isInternetConnected(List<ConnectivityResult> results) {
    // Implement logic to check internet connectivity
    if (results.contains(ConnectivityResult.none)) {
      isConnected.value = false;
      return false; // No connectivity results available
    } else if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi)) {
      isConnected.value = true;
      return true; // Internet is connected
    }
    return false; // No internet connection
  }
}
