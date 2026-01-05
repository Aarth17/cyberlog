import 'package:permission_handler/permission_handler.dart';

class PermissionService {

  /// CAMERA PERMISSION
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return status.isGranted;
  }

  /// STORAGE PERMISSION
  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    return status.isGranted;
  }
}
