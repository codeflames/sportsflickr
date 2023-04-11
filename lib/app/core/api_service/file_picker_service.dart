import 'dart:developer';
import 'dart:io';

// import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerService {
  final ImagePicker _picker = ImagePicker();
//   Future<List<File?>> selectFile() async {
//     var result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: [
//         'jpg',
//         'jpeg',
//         'png',
//         'gif',
//         'svg',
//         'webp',
//         'bmp',
//         'pdf',
//         'doc',
//         'docx',
//         'xls',
//         'xlsx',
//         'ppt',
//         'pptx',
//         'txt',
//         'csv',
//         'zip',
//         'rar',
//         '7z',
//         'mp3',
//         'mp4',
//         'wav',
//         'avi',
//         'flv',
//         'mov',
//         'wmv',
//         'mpg',
//         'mpeg',
//         'm4v',
//         '3gp',
//         'mkv',
//         'webm',
//       ],
//     );

//     if (result != null) {
//       List<File?> files = [];
//       for (var file in result.files) {
//         files.add(File(file.path ?? ''));
//       }
//       // File? file = File(result.files.single.path!);
//       // log('image gotten');
//       return files;
//     } else {
//       // User canceled the picker
//       return [];
//     }
//   }

//   Future<File?> selectVideoFile() async {
//     var result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.custom,
//       allowedExtensions: [
//         'mp4',
//         'm4v',
//         'mov',
//         'm4a',
//         '3gp',
//         '3g2',
//         'mkv',
//         'avi',
//         'webm',
//       ],
//     );

//     if (result != null) {
//       File? file = File(result.files.single.path!);
//       log('video gotten');
//       if (file.lengthSync() < 50000000) {
//         return file;
//       } else {
//         return null;
//       }
//     } else {
//       // User canceled the picker
//       return null;
//     }
//   }

//   final _picker = ImagePicker();

//   Future<File?> pickImageFromCamera() async {
//     try {
//       var image = await (_picker.pickImage(
//           source: ImageSource.camera, imageQuality: 50));

//       if (image != null) {
//         File? file = File(image.path);
//         log('image gotten');
//         return file;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }

  Future<File?> pickImageFromGallery() async {
    try {
      var image = await (_picker.pickImage(
          imageQuality: 60,
          source: ImageSource.gallery,
          requestFullMetadata: false));
      log('image gotten');

      final file = File(image!.path);

      // if (image != null && image.isNotEmpty) {
      //   List<File?> file = image.map((i) => File(i.path)).toList();
      //   // File(image.path);

      return file;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

//   Future<File?> pickVideoFromGallery() async {
//     try {
//       var image = await (_picker.pickVideo(source: ImageSource.gallery));

//       if (image != null) {
//         File? file = File(image.path);
//         log('video gotten');
//         return file;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }

//   Future<void> getLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.files != null) {
//       for (final XFile file in response.files!) {
//         log(file.path);
//       }
//     } else {
//       log(response.exception.toString());
//     }
//   }
}
