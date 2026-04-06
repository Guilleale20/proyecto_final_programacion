import 'package:flutter/material.dart';
import 'package:proyecto_final_programacion/models/models.dart';
import 'package:proyecto_final_programacion/themes/app_themes.dart';

class InfoMovieScreen extends StatelessWidget {
   
  const InfoMovieScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final Movie movieModal = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _CustomAppBar(movie: movieModal,),
          SliverList(delegate: SliverChildListDelegate([
            _PosterTitle(movie: movieModal,),
            _Overview(movie: movieModal,),
          ]))
        ],
      ),
      backgroundColor: AppThemes.backgroundColor,
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('${movie.overview}', textAlign: TextAlign.justify, style: TextStyle(color: AppThemes.font),),
    );
  }
}

class _PosterTitle extends StatelessWidget {

  final Movie movie;

  const _PosterTitle({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'), 
              image: NetworkImage('${movie.fullPosterImg}'),
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width * 0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${movie.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppThemes.font), maxLines: 2, overflow: TextOverflow.ellipsis,),
                Text('${movie.originalTitle}', style: TextStyle(color: AppThemes.font),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: AppThemes.rate,),
                    SizedBox(width: 5,),
                    Text('${movie.voteAverage.round()}/10', style: TextStyle(color: AppThemes.font,))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black38,
          child: Text('${movie.title}', style: TextStyle(color: AppThemes.font), maxLines: 2, overflow: TextOverflow.ellipsis,)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'), 
          image: NetworkImage('${ movie.fullPosterImg }'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}