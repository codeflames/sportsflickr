import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/api_service/file_picker_service.dart';
import 'package:sportsflickr/app/features/register/providers/register_providers.dart';

final profileControllerProvider = Provider<ProfileController>((ref) {
  return ProfileController(ref);
});

final userChangesProvider =
    StreamProvider((ref) => FirebaseAuth.instance.userChanges());

class ProfileController extends StateNotifier {
  ProfileController(this.ref) : super(null);
  final Ref ref;

  Future<void> reloadUserAfterSomeSeconds() async {
    // reload after every 10 seconds and stop after the 9th reload
    for (var i = 0; i < 9; i++) {
      await Future.delayed(const Duration(seconds: 10));
      final user = FirebaseAuth.instance.userChanges();
      log('reloaded user ${i + 1} times');
      log(user.toString());
    }
  }

  Future<File?> _getImageFromGallery() async {
    File? image;
    final pickedFile = await FilePickerService().pickImageFromGallery();
    if (pickedFile != null) {
      image = File(pickedFile.path);
      return image;
    }
    return null;
  }

  Future<void> uploadImageToFirebase() async {
    File? image = await _getImageFromGallery();
    if (image != null) {
      EasyLoading.show(status: 'Uploading image...');
      final User user = FirebaseAuth.instance.currentUser!;

      final Reference storageRef =
          FirebaseStorage.instance.ref().child('avatars/${user.uid}.png');
      final UploadTask uploadTask = storageRef.putFile(image);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = (await downloadUrl.ref.getDownloadURL());

      await user.updatePhotoURL(url);
      await user.reload();
      EasyLoading.showSuccess('Image uploaded successfully');
    } else {
      EasyLoading.showError('No image selected');
    }
  }
}
