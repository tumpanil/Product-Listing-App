import 'package:flutter/material.dart';
import 'package:product_listing_app/model/product_model.dart';
import 'package:product_listing_app/screens/add_product_screen.dart';

class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  List<ProductModel> _products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProductScreen(
                setData: setData,
              ),
            ),
          );
        },
      ),
      body: _products.length > 0
          ? ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              shrinkWrap: true,
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_products[index].productName),
                  subtitle: Text(_products[index].mrp),
                );
              },
            )
          : Center(
              child: Text("Add product"),
            ),
    );
  }

  setData(productModel) {
    setState(
      () {
        _products.add(productModel);
      },
    );
  }
}
