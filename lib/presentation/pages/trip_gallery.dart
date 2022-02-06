import 'package:flutter/material.dart';

class TripGallery extends StatefulWidget {
  static const String routeName = '/trip_gallery';

  const TripGallery({Key? key}) : super(key: key);

  @override
  _TripGalleryState createState() => _TripGalleryState();
}

class _TripGalleryState extends State<TripGallery> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("Trip Gallery"),
    );
  }
}
