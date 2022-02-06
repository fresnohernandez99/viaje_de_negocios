import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:viaje_de_negocios/models/trip.dart';

class TripList extends StatefulWidget {
  const TripList({Key? key}) : super(key: key);

  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  var tripList = [
    Trip(0, "Russia", "12-feb-2022", "21-feb-2022", 'ru'),
    Trip(0, "Mexico", "12-mar-2022", "21-mar-2022", 'mx'),
    Trip(0, "Panama", "12-apr-2022", "21-apr-2022", 'pa'),
    Trip(0, "Nicaragua", "12-may-2022", "21-may-2022", 'ni'),
    Trip(0, "Turkey", "12-jun-2022", "21-jun-2022", 'tr')
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...tripList.map((t) => TripMiniItem(t)).toList(),
          SizedBox(
            width: 150,
            height: 150,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  icon: const Icon(
                    Icons.read_more_sharp,
                    size: 25,
                  ),
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TripMiniItem extends StatelessWidget {
  Trip trip;

  TripMiniItem(this.trip, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.8,
                child: CircleAvatar(
                  backgroundImage:
                      Image.asset('./assets/flags/${trip.flag}.png').image,
                ),
              ),
              Text(
                trip.country,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:
                        Theme.of(context).primaryTextTheme.titleMedium!.color),
              ),
              const Divider(),
              Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share_outlined,
                              size: 20,
                              color: Colors.white60,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("share".tr().toUpperCase(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white60
                            ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
