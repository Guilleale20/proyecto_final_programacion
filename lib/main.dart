import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_programacion/provider/movies_provider.dart';
import 'package:proyecto_final_programacion/routes/app_routes.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget{
  
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(), lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: AppThemes.lighttheme,
    );
  }
}
