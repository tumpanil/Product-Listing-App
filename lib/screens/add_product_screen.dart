import 'package:flutter/material.dart';
import 'package:product_listing_app/component/generic_layout.dart';
import 'package:product_listing_app/screens/product_detail_screen.dart';

class AddProductScreen extends StatefulWidget {
  final Function setData;

  const AddProductScreen({@required this.setData});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List _item;
  String _selectedItem;

  @override
  void initState() {
    _item = ["Laptop", "Mobile", "Pen", "Copy"];
    _selectedItem = _item[0];
  }

  @override
  Widget build(BuildContext context) {
    return GenericLayout(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productName: _selectedItem,
              setData: widget.setData,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Product Name",
            style: TextStyle(color: Colors.blue),
          ),
          DropdownButton<String>(
            underline: Container(color: Colors.transparent),
            value: _selectedItem,
            items: _item.map<DropdownMenuItem<String>>(
              (data) {
                return DropdownMenuItem<String>(
                  value: data,
                  child: Text(data),
                );
              },
            ).toList(),
            isExpanded: true,
            onChanged: (String newData) {
              setState(
                () {
                  _selectedItem = newData;
                },
              );
            },
          ),
          Divider(
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}
