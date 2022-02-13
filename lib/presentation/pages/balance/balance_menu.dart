import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:viaje_de_negocios/presentation/pages/exchanges_admin/exchanges_admin.dart';

import 'custom_progress_btn.dart';
import 'labeled_checkbox.dart';

class BalanceMenu extends StatefulWidget {
  static const String routeName = '/balance_menu';

  @override
  State<BalanceMenu> createState() => _BalanceMenuState();
}

class _BalanceMenuState extends State<BalanceMenu> {
  final String imageRoute1 = "assets/admin_exchange.png";

  bool isDefaultCupChecked = false;
  bool isShowSellingPrice = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "balance",
        child: Scaffold(
          body: SafeArea(
            child:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "manage".tr().toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                    ),
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, ExchangesAdmin.routeName);
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "admin_exchange".tr(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .titleLarge!
                                            .color),
                                  ),
                                  Text(
                                    "admin_exchange_info".tr(),
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "online".tr().toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                    ),
                    const Divider(),
                    SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          elevation: 3,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "update_exchange".tr(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .titleLarge!
                                            .color),
                                  ),
                                  Text(
                                    "update_exchange_info".tr(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .titleLarge!
                                            .color),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Center(child: CustomProgressBtn())
                                ],
                              )),
                        )),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "visual".tr().toUpperCase(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge!
                              .color),
                    ),
                    const Divider(),
                    LabeledCheckbox(
                      label: 'show_price_cup'.tr(),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      value: isDefaultCupChecked,
                      onChanged: (bool newValue) {
                        setState(() {
                          isDefaultCupChecked = newValue;
                        });
                      },
                    ),
                    LabeledCheckbox(
                      label: 'show_selling_price'.tr(),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      value: isShowSellingPrice,
                      onChanged: (bool newValue) {
                        setState(() {
                          isShowSellingPrice = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
