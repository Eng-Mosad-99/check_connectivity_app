import 'package:check_connectivity/helper/connectivity_controller.dart';
import 'package:check_connectivity/screens/home_screen.dart';
import 'package:check_connectivity/screens/no_network_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckConnectivityApp());
}

class CheckConnectivityApp extends StatelessWidget {
  const CheckConnectivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (!value) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Check Connectivity App',
            home: NoNetworkScreen(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Check Connectivity App',
            home: const HomeScreen(),
            builder: (context, child) {
              return Scaffold(
                body: Builder(
                  builder: (context) {
                    ConnectivityController.instance.init();
                    return child!;
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
