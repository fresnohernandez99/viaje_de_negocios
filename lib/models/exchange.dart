import 'package:meta/meta.dart';

class Exchange {
  //identifier
  int id = 0;

  //coin codename for localize it on internet
  @required
  String coin;

  //display text label
  @required
  String coinName;

  //value of the equivalent of one dollar for the coin
  @required
  double oneDollarEquals;

  Exchange(this.coin, this.coinName, this.oneDollarEquals);
}