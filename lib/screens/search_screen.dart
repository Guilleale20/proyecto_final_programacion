import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_programacion/provider/movies_provider.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';
import 'package:proyecto_final_programacion/widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
   
  const SearchScreen({
    super.key
  });
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      body: MoviesGrid(
        movies: moviesProvider.popularMovies,
        onNextPage: () => moviesProvider.getPopularMovies(),  
      ),
      backgroundColor: AppThemes.backgroundColor,
    );
  }
}