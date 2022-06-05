import 'package:flutter_api_php/views/screens/homepage.dart';
import 'package:flutter_api_php/views/screens/login.dart';
import 'package:get/get.dart';

class Approutes {
  //initialRoute
  static const login = Routes.login;
  static const homepage = Routes.homepage;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const Login(),
    ),
    GetPage(
      name: Routes.homepage,
      page: () =>  Homepage(),
    ),
  ];
}

class Routes {
  static const login = '/login';
  static const signin = '/signin';
  static const homepage = '/Homepage';
}
