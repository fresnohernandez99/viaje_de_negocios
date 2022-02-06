import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  static const String routeName = 'create_product';

  const CreateProduct({Key? key}) : super(key: key);

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("Create Product"),
    );
  }
}
