import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utility {
  static imageSelector(context, setSelectedImage) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    bottomSheetDialog(
      context,
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                var picker = ImagePicker();
                final pickedFile =
                    await picker.getImage(source: ImageSource.camera);
                setSelectedImage(pickedFile);
                Navigator.of(context).pop();
              },
              child: Column(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.indigo,
                    size: width * 0.10,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                var picker = ImagePicker();
                final pickedFile =
                    await picker.getImage(source: ImageSource.gallery);
                setSelectedImage(pickedFile);
                Navigator.of(context).pop();
              },
              child: Column(
                children: [
                  Icon(
                    Icons.photo_album_rounded,
                    color: Colors.indigo,
                    size: width * 0.10,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(color: Colors.indigo),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static bottomSheetDialog(context, child) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height * 0.20,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.04,
          ),
          child: child,
        );
      },
    );
  }
}
