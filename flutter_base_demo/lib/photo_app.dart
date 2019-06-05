import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];

  Future getImage(bool isCamera) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _getImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showImagePicker,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _getImages() {
    return _images.map((file) {
      return Stack(children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            )),
        Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              child: ClipOval(
                child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    )),
              ),
              onTap: () {
                this.setState(() {
                  _images.remove(file);
                });
              },
            ))
      ]);
    }).toList();
  }

  _showImagePicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150,
            child: Column(children: <Widget>[
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('拍照'),
                ),
                onTap: () {
                  getImage(true);
                },
              ),
              GestureDetector(
                child: ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('相册'),
                ),
                onTap: () {
                  getImage(false);
                },
              )
            ]),
          );
        });
  }
}
