import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/screens/screens.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

class MenuScreen extends StatefulWidget {
   
  const MenuScreen({
    super.key
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

int _currentIndex = 0;
final List<Widget> _pages = [
  HomeScreen(),
  SearchScreen(),
  InfoScreen()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _currentIndex == 1
            ? [
                IconButton(
                  icon: Icon(Icons.search, color: AppThemes.icon,),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: MovieSearch(), 
                    );
                  },
                )
              ]
            : [],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), 
          child: Container(
            color: Colors.grey[700],
            height: 1.0,
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: 
      BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Info Personal',
          ),
        ],
      ),
    );
  }
}