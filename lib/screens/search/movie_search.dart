import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final_programacion/provider/movies_provider.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

class MovieSearch extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestions(context);
  }

  Widget _buildSuggestions(BuildContext context) {

    if(query.isEmpty){
      return Center(
        child: Text('Escribe el nombre de una película', style: TextStyle(color: AppThemes.font),),
      );
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    // llamar a la API
    moviesProvider.searchMovies(query);

    return Consumer<MoviesProvider>(
      builder: (_, provider, __) {
        final movies = provider.searchResults;

        if(movies.isEmpty){
          return Center(child: Text('No se encontraron resultados', style: TextStyle(color: AppThemes.font)),);
        }

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index) {
            final movie = movies[index];
            return ListTile(
              leading: FadeInImage(
                placeholder: const AssetImage('assets/440b9dc08fefeff13ec30dc0ae6a09df.gif'),
                image: NetworkImage(movie.fullPosterImg),
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(movie.title, style: TextStyle(color: AppThemes.font),),
              onTap: () => Navigator.pushNamed(context, '/details', arguments: movie),
            );
          },
        );
      },
    );
  }
}