import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:viaje_de_negocios/models/trip.dart';

class LastTrip extends StatefulWidget {
  const LastTrip({Key? key}) : super(key: key);

  @override
  _LastTripState createState() => _LastTripState();
}

class _LastTripState extends State<LastTrip> {
  String imageRoute= 'assets/last_trip_card_image.png';

  Trip trip = Trip(0, "Russia", "12-feb-2022", "21-feb-2022", 'ru');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Card(
            elevation: 5,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: Image.asset(imageRoute,
                            fit: BoxFit.cover, height: 120)),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'last_trip'.tr().toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'country'.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            './assets/flags/${trip.flag}.png',
                                            height: 10,
                                            width: 20,
                                          ),
                                          Text(
                                            trip.country,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'from'.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 15),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        trip.dateFrom,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'to'.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 15),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        trip.dateTo,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.play_circle_fill),
                        color: Theme.of(context).indicatorColor,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        color: Theme.of(context).indicatorColor,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.list_alt),
                        color: Theme.of(context).indicatorColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
