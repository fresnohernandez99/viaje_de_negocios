import 'package:meta/meta.dart';

class Exchange {
  @required
  final int id;

  @required
  final String coin;

  @required
  final String coinName;

  @required
  final double oneDollarEquals;

  Exchange(this.id, this.coin, this.coinName, this.oneDollarEquals);
}