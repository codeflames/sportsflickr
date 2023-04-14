import 'dart:developer';
import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    try {
      var image = await (_picker.pickImage(
          imageQuality: 60,
          source: ImageSource.gallery,
          requestFullMetadata: false));
      log('image gotten');

      final file = File(image!.path);

      return file;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
