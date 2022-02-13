import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:viaje_de_negocios/presentation/pages/balance/balance_menu.dart';
import 'package:viaje_de_negocios/presentation/pages/create_product.dart';
import 'package:viaje_de_negocios/presentation/pages/create_trip.dart';
import 'package:viaje_de_negocios/presentation/pages/exchanges_admin/exchanges_admin.dart';
import 'package:viaje_de_negocios/presentation/pages/home/home.dart';
import 'package:viaje_de_negocios/presentation/pages/product_gallery.dart';
import 'package:viaje_de_negocios/presentation/pages/trip_gallery.dart';
import 'package:viaje_de_negocios/presentation/styles/theme.dart';
import 'package:viaje_de_negocios/presentation/styles/theme_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['en', 'es'],
    assetsDirectory: 'assets/lang/',
  );

  runApp(LocalizedApp(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightMode() {
      try {
        var brightness = SchedulerBinding.instance!.window.platformBrightness;
        return brightness == Brightness.light;
      } catch (e) {
        return true;
      }
    }

    return MaterialApp(
      localizationsDelegates: translator.delegates,
      // Android + iOS Delegates
      locale: translator.locale,
      // Active locale
      supportedLocales: translator.locals(),
      // Locals list
      theme: isLightMode()
          ? themesData[ThemeType.light]
          : themesData[ThemeType.dark],
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        BalanceMenu.routeName: (context) => BalanceMenu(),
        ExchangesAdmin.routeName: (context) => ExchangesAdmin(),
        CreateProduct.routeName: (context) => const CreateProduct(),
        CreateTrip.routeName: (context) => const CreateTrip(),
        ProductGallery.routeName: (context) => const ProductGallery(),
        TripGallery.routeName: (context) => const TripGallery(),
      },
    );
  }
}
