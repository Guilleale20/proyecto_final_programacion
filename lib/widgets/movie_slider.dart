import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/models/movie.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movie;
  final Function onNextPage;
  final String widgetName;

  const MovieSlider({
    super.key, 
    required this.movie, 
    required this.onNextPage, 
    required this.widgetName,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        print('Hemos llegado al final');
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
    return Container(
      width: double.infinity,
      height: 300,
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.widgetName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppThemes.font),),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movie.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 130,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Has seleccionado una peli');
                          Navigator.pushNamed(context, '/details', arguments: widget.movie[index]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/440b9dc08fefeff13ec30dc0ae6a09df.gif'), 
                            image: NetworkImage('${widget.movie[index].fullPosterImg}'),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('${widget.movie[index].title}', maxLines: 2, overflow: TextOverflow.ellipsis, 
                        style: TextStyle(
                          color: AppThemes.font
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}