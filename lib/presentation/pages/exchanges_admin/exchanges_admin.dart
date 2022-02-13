import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:viaje_de_negocios/models/exchange.dart';

class ExchangesAdmin extends StatefulWidget {
  const ExchangesAdmin({Key? key}) : super(key: key);

  static const String routeName = '/exchanges_admin';

  @override
  _ExchangesAdminState createState() => _ExchangesAdminState();
}

class _ExchangesAdminState extends State<ExchangesAdmin> {
  final Exchange _dollar = Exchange("USD", "USD", 100.0);
  final Exchange _euro = Exchange("EURO", "Euro", 120.0);
  final List<Exchange> _exchangesList = [];

  void addNewCoin(Exchange newCoin) async {
    setState(() {
      _exchangesList.add(newCoin);

      // TODO saving process
      // show loader

      Navigator.of(context).pop();
    });
  }

  void deleteCoin(Exchange coin) async {
    setState(() {
      _exchangesList.remove(coin);
      // TODO removing process
    });
  }

  void setCoinValue(int _id, double _newValue) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "foreign_exchange".tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryTextTheme.titleLarge!.color),
            ),
            const Divider(),
            ForeignExchangesForm(coin: _dollar, setCoinValue: setCoinValue),
            const SizedBox(
              height: 10,
            ),
            ForeignExchangesForm(coin: _euro, setCoinValue: setCoinValue),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              "custom_foreign_exchange".tr().toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryTextTheme.titleLarge!.color),
            ),
            const Divider(),
            CustomForeignExchanges(
                exchangesList: _exchangesList,
                addNewCoin: addNewCoin,
                deleteCoin: deleteCoin,
                setCoinValue: setCoinValue),
          ],
        ),
      ),
    )));
  }
}

class CustomForeignExchanges extends StatefulWidget {
  List<Exchange> exchangesList = [];
  Function addNewCoin;
  Function setCoinValue;
  Function deleteCoin;

  CustomForeignExchanges(
      {Key? key,
      required this.exchangesList,
      required this.addNewCoin,
      required this.setCoinValue,
      required this.deleteCoin})
      : super(key: key);

  @override
  _CustomForeignExchangesState createState() => _CustomForeignExchangesState();
}

class _CustomForeignExchangesState extends State<CustomForeignExchanges> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      key: Key(widget.exchangesList.length.toString()),
      shrinkWrap: true,
      children: [
        ...widget.exchangesList
            .map((c) => CustomForeignExchangesForm(
                coin: c,
                setCoinValue: widget.setCoinValue,
                deleteCoin: widget.deleteCoin))
            .toList(),
        ElevatedButton.icon(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await showInformationDialog(context, widget.addNewCoin);
              //widget.addNewCoin(Exchange(0, "CUSTOM", "Csasss", 200.0));
            },
            label: Text("add".tr()))
      ],
    );
  }
}

class ForeignExchangesForm extends StatefulWidget {
  final Exchange coin;
  final Function setCoinValue;

  const ForeignExchangesForm(
      {Key? key, required this.coin, required this.setCoinValue})
      : super(key: key);

  @override
  _ForeignExchangesFormState createState() => _ForeignExchangesFormState();
}

class _ForeignExchangesFormState extends State<ForeignExchangesForm> {
  final _formKey = GlobalKey<FormState>();
  bool notSave = false;

  String getCoinName() {
    String actualName = widget.coin.coinName;

    for (int i = 0; i < 8 - actualName.length; i++) {
      actualName = "$actualName  ";
    }

    return actualName;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getCoinName(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryTextTheme.titleLarge!.color),
            ),
            Text(
              "1 =",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryTextTheme.titleLarge!.color),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CUP:".tr(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color:
                        Theme.of(context).primaryTextTheme.titleLarge!.color),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          notSave = true;
                        });
                      },
                      initialValue: widget.coin.oneDollarEquals.toString(),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                      ],
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'complete_form'.tr();
                        }
                        widget.setCoinValue(
                            widget.coin.id, double.parse(value));
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: IconButton(
                      icon: const Icon(Icons.check),
                      color: notSave
                          ? Theme.of(context).errorColor
                          : Theme.of(context).indicatorColor,
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            notSave = false;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomForeignExchangesForm extends StatefulWidget {
  final Exchange coin;
  final Function setCoinValue;
  final Function deleteCoin;

  const CustomForeignExchangesForm(
      {Key? key,
      required this.coin,
      required this.setCoinValue,
      required this.deleteCoin})
      : super(key: key);

  @override
  _CustomForeignExchangesFormState createState() =>
      _CustomForeignExchangesFormState();
}

class _CustomForeignExchangesFormState
    extends State<CustomForeignExchangesForm> {
  final _formKey = GlobalKey<FormState>();
  bool notSave = false;

  String getCoinName() {
    String actualName = widget.coin.coinName;

    for (int i = 0; i < 8 - actualName.length; i++) {
      actualName = "$actualName  ";
    }

    return actualName;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "USD:",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).primaryTextTheme.titleLarge!.color),
                ),
                Text(
                  "1 =",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).primaryTextTheme.titleLarge!.color),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getCoinName(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleLarge!
                            .color),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              notSave = true;
                            });
                          },
                          initialValue: widget.coin.oneDollarEquals.toString(),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                          ],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .titleLarge!
                                  .color),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'complete_form'.tr();
                            }
                            widget.setCoinValue(
                                widget.coin.id, double.parse(value));
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: IconButton(
                          icon: const Icon(Icons.check),
                          color: notSave
                              ? Theme.of(context).errorColor
                              : Theme.of(context).indicatorColor,
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                notSave = false;
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            widget.deleteCoin(widget.coin);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

Future<void> showInformationDialog(
    BuildContext context, Function addNewCoin) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Exchange newCoin = Exchange("", "Coin", 0.0);

  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "create_exchange".tr().toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .titleLarge!
                                .color),
                      ),
                    ),
                    const Divider(),
                    Text(
                      "put_coin_name".tr().toUpperCase(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      initialValue: "coin".tr(),
                      maxLines: 1,
                      maxLength: 8,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'complete_form'.tr();
                        }
                        newCoin.coinName = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "put_dollar_value".tr().toUpperCase(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      initialValue: 0.toString(),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                      ],
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'complete_form'.tr();
                        }
                        newCoin.oneDollarEquals = double.parse(value);
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: IconButton(
                            icon: const Icon(Icons.check),
                            color: Theme.of(context).indicatorColor,
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                addNewCoin(newCoin);
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            color: Theme.of(context).errorColor,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
      });
}
