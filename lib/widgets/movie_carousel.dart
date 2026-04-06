import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/models/movie.dart';

class MovieCarousel extends StatelessWidget {

  final List<Movie> movie;

  const MovieCarousel({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: CarouselSlider.builder(
        itemCount: movie.length,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: (){
              print("Has pulsado esta peli");
              Navigator.pushNamed(
                context, 
                '/details',
                arguments: movie[index]
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: const AssetImage('assets/440b9dc08fefeff13ec30dc0ae6a09df.gif'),
                image: NetworkImage(movie[index].fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: size.height * 0.5,
          enlargeCenterPage: true,
          viewportFraction: 0.6,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
        ),
      ),
    );
  }
}