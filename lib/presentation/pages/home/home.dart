import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:viaje_de_negocios/presentation/pages/balance/balance_menu.dart';
import 'package:viaje_de_negocios/presentation/pages/home/last_trip_card.dart';
import 'package:viaje_de_negocios/presentation/pages/home/trip_list.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageRoute1 = 'assets/stock.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const LastTrip(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "recent_trips".tr().toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).primaryTextTheme.titleLarge!.color),
                  ),
                  const Divider(),
                  const TripList(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "balance".tr().toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).primaryTextTheme.titleLarge!.color),
                  ),
                  const Divider(),
                  Hero(
                    tag: "balance",
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, BalanceMenu.routeName);
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "balance_options".tr(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .titleLarge!
                                            .color),
                                  ),
                                  Text(
                                    "explore_balance".tr(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .titleLarge!
                                            .color),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      imageRoute1,
                                      fit: BoxFit.fitWidth,
                                      width: 250,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "tools".tr().toUpperCase(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).primaryTextTheme.titleLarge!.color),
                  ),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 1,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "actions_trip".tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .titleLarge!
                                          .color),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.edit),
                                      color: Theme.of(context).indicatorColor,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.download_outlined),
                                      color: Theme.of(context).indicatorColor,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                      child: IconButton(
                                    icon: const Icon(Icons.upload_outlined),
                                    color: Theme.of(context).indicatorColor,
                                    onPressed: () {},
                                  )),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 1,
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "actions_product".tr(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .titleLarge!
                                          .color),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.share),
                                      color: Theme.of(context).indicatorColor,
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                      child: IconButton(
                                    icon: const Icon(Icons.download_outlined),
                                    color: Theme.of(context).indicatorColor,
                                    onPressed: () {},
                                  )),
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.upload_outlined),
                                      color: Theme.of(context).indicatorColor,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "rights".tr(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).primaryTextTheme.titleLarge!.color),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
