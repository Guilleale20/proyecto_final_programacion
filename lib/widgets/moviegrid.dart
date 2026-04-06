import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/models/models.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

class MoviesGrid extends StatefulWidget {

  final List<Movie> movies;
  final Function onNextPage;

  const MoviesGrid({
    super.key,
    required this.movies,
    required this.onNextPage,
  });

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

      if(scrollController.position.pixels >=
         scrollController.position.maxScrollExtent - 500){

        widget.onNextPage();
      }

    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GridView.builder(

      controller: scrollController,

      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),

      itemCount: widget.movies.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        childAspectRatio: 0.60,
      ),

      itemBuilder: (context, index){

        final movie = widget.movies[index];

        return GestureDetector(
          onTap: (){
            Navigator.pushNamed(
              context,
              '/details',
              arguments: movie
            );
          },

          child: Column(
            children: [

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/Documento sin imagen disponible.png'),
                    image: NetworkImage(movie.fullPosterImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppThemes.font
                ),
              )
            ],
          ),
        );
      },
    );
  }
}