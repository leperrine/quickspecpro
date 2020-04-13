import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class MediaPreview extends StatefulWidget {
  @override
  _MediaPreviewState createState() => _MediaPreviewState();
}

class _MediaPreviewState extends State<MediaPreview> {
  File _file;
  dynamic _pickImageError;
  bool _isVideo = false;
  VideoPlayerController _videoPlayerController;
  String _retrieveDataError;

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_videoPlayerController != null) {
      await _videoPlayerController.dispose();
      _videoPlayerController = null;
    }
  }

  Future<void> _playVideo(File file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      _videoPlayerController = VideoPlayerController.file(file);
      await _videoPlayerController.setVolume(1.0);
      await _videoPlayerController.initialize();
      await _videoPlayerController.setLooping(true);
      await _videoPlayerController.play();
      setState(() {});
    }
  }

  Widget _previewVideo() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_videoPlayerController == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: VideoPlayer(_videoPlayerController),
    );
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_file != null) {
      return Image.file(_file);
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> _retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        _isVideo = true;
        await _playVideo(response.file);
      } else {
        _isVideo = false;
        setState(() {
          _file = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isVideo ? _previewVideo() : _previewImage();
  }
  
  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  
}