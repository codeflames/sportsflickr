import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sportsflickr/app/core/api_service/file_picker_service.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class SportsflickrImageWidget extends StatefulWidget {
  const SportsflickrImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SportsflickrImageWidget> createState() =>
      _SportsflickrImageWidgetState();
}

class _SportsflickrImageWidgetState extends State<SportsflickrImageWidget> {
  File? imageFile;

  // final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        imageFile = await FilePickerService().pickImageFromGallery();
        setState(() {});
      },
      child: Container(
        height: 119,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: borderRadius6,
            color: ffffff,
            border: Border.all(
              color: e7e8ea,
              strokeAlign: BorderSide.strokeAlignInside,
            )),
        child: Center(
          child: imageFile == null
              ? const Icon(Icons.add_a_photo)
              : Image.file(imageFile!, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
