import 'dart:io';
import 'package:flutter/material.dart';
import 'package:product_listing_app/component/generic_layout.dart';
import 'package:product_listing_app/component/utils/utility.dart';
import 'package:product_listing_app/model/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final Function setData;

  const ProductDetailScreen(
      {@required this.productName, @required this.setData});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final TextEditingController _productDetailsController =
      TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _pickedImage;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GenericLayout(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          widget.setData(
            ProductModel(
              image: _pickedImage,
              mrp: _mrpController.text,
              productName: widget.productName,
            ),
          );
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Utility.imageSelector(context, setSelectedImage);
                    },
                    child: Container(
                      width: width * 0.30,
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                  Visibility(
                    visible: _pickedImage != null,
                    child: Container(
                      margin: EdgeInsets.only(left: width * 0.05),
                      width: width * 0.30,
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: _pickedImage != null
                              ? Image.file(
                                  File(_pickedImage),
                                  fit: BoxFit.fill,
                                ).image
                              : AssetImage("assets/images/add-image.jpeg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Add product images",
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: "Product Name*"),
                initialValue: widget.productName,
              ),
            ),
            TextFormField(
              controller: _mrpController,
              validator: (amount) =>
                  amount.isEmpty ? "Please enter amount" : null,
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  "assets/images/rupee_icon.png",
                  width: width * 0.01,
                  height: height * 0.01,
                ),
                labelText: "MRP*",
                helperText: "Price",
              ),
            ),
            TextFormField(
              controller: _productDetailsController,
              decoration: InputDecoration(
                labelText: "Product Details",
              ),
            ),
          ],
        ),
      ),
    );
  }

  setSelectedImage(pickedFile) {
    setState(
      () {
        _pickedImage = pickedFile.path;
      },
    );
  }
}
