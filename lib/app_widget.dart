import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/module/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/module/home/home_page.dart';
import 'package:payflow/module/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/module/login/login_page.dart';
import 'package:payflow/module/splash/splash_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay FLow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      home: LoginPage(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/login": (context) => LoginPage(),
        "/barcode": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            )
      },
    );
  }
}
