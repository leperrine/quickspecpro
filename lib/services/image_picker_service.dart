import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerService {
  // Returns a [File] object pointing to the image that was picked.
  Future<File> pickImage({@required ImageSource source}) async {
    return ImagePicker.pickImage(source: source);
  }

  Future<File> pickVideo({@required ImageSource source}) async {
    return ImagePicker.pickVideo(source: source);
  }

  Future<void> retrieveLostData() async {
    return ImagePicker.retrieveLostData();
}

}
  