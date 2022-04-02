import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String> onPickImagesPressed(BuildContext context) async {
  List<PlatformFile> _paths;
  const _multiPick = false;
  const _filesType = FileType.custom;
  const _extensions = 'jpg , png , jpeg';
  FocusManager.instance.primaryFocus.unfocus();
  try {
    _paths = (await FilePicker.platform.pickFiles(
      type: _filesType,
      allowMultiple: _multiPick,
      allowedExtensions: _extensions.replaceAll(' ', '').split(','),
    ))
        ?.files;
  } on PlatformException catch (e) {
  } catch (ex) {}
  if (_paths != null) {
    return _paths[0].path ?? '';
  } else {
    return null;
  }
}
