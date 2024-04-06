import 'package:amigo_doctor/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:amigo_doctor/app/pages/splashScreen/splash.screen.binding.dart';
import 'package:amigo_doctor/app/pages/splashScreen/splash.screen.page.dart';
import 'package:amigo_doctor/core/routes/pages.dart';
import 'package:amigo_doctor/core/routes/routes.dart';
import 'package:amigo_doctor/core/theme/app_theme.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/providers/api.enviroments.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String environment = String.fromEnvironment(Keys.environment);
  ApiEnvironment().initConfig(environment);
  await initializeDateFormatting('ES');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme,
      initialRoute: Routes.splashScreen,
      defaultTransition: Transition.cupertino,
      initialBinding: SplashScreenBinding(),
      getPages: Pages.pages,
      home: const SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
