import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

class InfoScreen extends StatelessWidget {
   
  const InfoScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),

          ListTile(
            title: Text('Guillermo Ramella'),
            subtitle: Text('C.I: 30.911.341'),
          ),
          ListTile(
            title: Text('Angel Daza'),
            subtitle: Text('C.I: 30870127'),
          ),
          ListTile(
            title: Text('Fabricio Moya'),
            subtitle: Text('C.I: 32501116'),
          ),
          ListTile(
            title: Text('Materia: Programacion III'),
          )
        ],
      ),
      backgroundColor: AppThemes.backgroundColor,
    );
  }
}