import 'package:flutter/material.dart';

class CreateTrip extends StatefulWidget {
  static const String routeName = '/create_trip';

  const CreateTrip({Key? key}) : super(key: key);

  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("Create Trip"),
    );
  }
}
