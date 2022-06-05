import 'package:flutter/material.dart';
import 'package:flutter_api_php/routes/routes.dart';
import 'package:flutter_api_php/services/themeservices.dart';
import 'package:flutter_api_php/views/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shP;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shP = await SharedPreferences.getInstance();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeServices().theme,
      getPages: Approutes.routes,
      initialRoute:
          shP.get('id') == null ? Approutes.login : Approutes.homepage,
    );
  }
}
