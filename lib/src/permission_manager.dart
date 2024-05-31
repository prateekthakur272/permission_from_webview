import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  // Check and request microphone permission
  Future<bool> requestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.request();
    return _handlePermissionStatus(status);
  }

  // Check and request camera permission
  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    return _handlePermissionStatus(status);
  }

  // Check the current status of microphone permission
  Future<bool> isMicrophonePermissionGranted() async {
    PermissionStatus status = await Permission.microphone.status;
    return status == PermissionStatus.granted;
  }

  // Check the current status of camera permission
  Future<bool> isCameraPermissionGranted() async {
    PermissionStatus status = await Permission.camera.status;
    return status == PermissionStatus.granted;
  }

  // Handle permission status
  bool _handlePermissionStatus(PermissionStatus status) {
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      print('Permission denied. Show a message to the user.');
    } else if (status.isPermanentlyDenied) {
      print('Permission permanently denied. Open app settings.');
      openAppSettings();
    }
    return false;
  }

  // Open app settings
  Future<void> openAppSettings() async {
    // bool isOpened = await openAppSettings();
    // if (!isOpened) {
    //   print('Failed to open app settings.');
    // }
  }
}
