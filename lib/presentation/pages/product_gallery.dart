import 'package:flutter/material.dart';

class ProductGallery extends StatefulWidget {
  static const String routeName = '/product_gallery';

  const ProductGallery({Key? key}) : super(key: key);

  @override
  _ProductGalleryState createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("Product Gallery"),
    );
  }
}
