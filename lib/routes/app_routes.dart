import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/screens/screens.dart';

class AppRoutes {

  static String initialRoute = '/menu';

  static Map<String, Widget Function(BuildContext)> routes = {

    '/menu' : (BuildContext context) => const MenuScreen(),
    '/details' : (BuildContext context) => const InfoMovieScreen()
  };

}