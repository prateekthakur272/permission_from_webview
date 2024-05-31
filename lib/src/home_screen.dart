import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_from_webview/src/permission_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController(
      onPermissionRequest: (permission) {
        log(permission.toString());
        log(permission.platform.types.first.name);
        switch(permission.platform.types.first.name){
          case 'microphone':{
            PermissionManager().requestMicrophonePermission();
          }
        }
        permission.grant();
      }
    );
    controller.setOnConsoleMessage((message) {
      log(message.message);
    });
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse('https://translate.google.co.in/?sl=en&tl=hi&op=translate'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
