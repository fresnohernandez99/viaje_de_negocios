import 'package:meta/meta.dart';

class Trip {
  @required
  final int id;

  @required
  final String country;

  @required
  final String dateFrom;

  @required
  final String dateTo;

  @required
  final String flag;

  @required
  final int exchange;

  String otherData = "";

  Trip(this.id, this.country, this.dateFrom, this.dateTo, this.flag, this.exchange);

}