import 'package:flutter/material.dart';
import 'package:permission_from_webview/src/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Permission',
      home: HomeScreen(),
    );
  }
}
