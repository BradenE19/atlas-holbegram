import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class AddPicture extends StatefulWidget {
  final String email;
  final String username;
  final String password;

  AddPicture({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;

  void selectImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = Uint8List.fromList(await pickedFile.readAsBytes());
      });
    }
  }

  void selectImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = Uint8List.fromList(await pickedFile.readAsBytes());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null) Image.memory(_image!),
            ElevatedButton(
              onPressed: selectImageFromGallery,
              child: Text('Select from Gallery'),
            ),
            ElevatedButton(
              onPressed: selectImageFromCamera,
              child: Text('Take from Camera'),
            ),
          ],
        ),
      ),
    );
  }
}