import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:quickspecpro/services/firebase_storage_service.dart';
import 'package:quickspecpro/services/firestore_path.dart';
import 'package:quickspecpro/services/image_picker_service.dart';
import 'package:quickspecpro/shared/buttons/custom_raised_button.dart';

class MediaButton extends CustomRaisedButton {
  MediaButton({@required this.uid, @required this.userTemplateId}) : assert(uid != null);
  final String uid;
  final String userTemplateId;

  Future<void> _selectMedia(BuildContext context) async {
    try {
      final imagePicker = Provider.of<ImagePickerService>(context, listen: false);
      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        final storage = Provider.of<FirebaseStorageService>(context, listen: false);
        final downloadUrl = await storage.upload(file: file, path: FirestorePath.userTemplate(uid, userTemplateId), contentType: null);
        return downloadUrl;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomRaisedButton(
      child: Text('Add Media'),
      onPressed: () => _selectMedia(context),
    );
  }
}
