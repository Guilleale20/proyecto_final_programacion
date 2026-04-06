import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_programacion/provider/movies_provider.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';
import 'package:proyecto_final_programacion/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieCarousel(movie: moviesProvider.nowPlayingMovies,),
            MovieSlider(
              movie: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
              widgetName: 'Películas populares',
            ),
            MovieSlider(
              movie: moviesProvider.topratedMovies, 
              onNextPage: () => moviesProvider.getTopRatedMovies(), 
              widgetName: 'Peliculas con mejor valoracion')
          ],
        ),
      ),
      backgroundColor: AppThemes.backgroundColor,
    );
  }
}