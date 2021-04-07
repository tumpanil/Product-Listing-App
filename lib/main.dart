import 'package:flutter/material.dart';
import 'package:product_listing_app/screens/catalogue.dart';

void main() {
  runApp(
    ProductListingApp(),
  );
}

class ProductListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Catalogue(),
    );
  }
}
