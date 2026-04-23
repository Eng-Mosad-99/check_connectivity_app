import 'package:check_connectivity/screens/no_network_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckConnectivityApp());
}

class CheckConnectivityApp extends StatelessWidget {
  const CheckConnectivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Check Connectivity App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NoNetworkScreen(),
    );
  }
}
