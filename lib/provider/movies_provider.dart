import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final_programacion/models/models.dart';

class MoviesProvider extends ChangeNotifier {

  final String _apiKey = '402a2b5c49abb1ea40fa7a263ab7de7a';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topratedMovies = [];

  List<Movie> searchResults = []; 

  int _popularPage = 0;
  int _topratedPage = 0;

  MoviesProvider(){
    print('MoviesProvider se esta inicializando');

    getNowOnDisplayMovies();
    getPopularMovies();
    getTopRatedMovies();
  }

  Future<String> _getJsonData(String endpoint, [int? page = 1, Map<String, String>? params]) async {

    final queryParams = {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '$page',
      if (params != null) ...params,
    };

    var url = Uri.https(_baseUrl, endpoint, queryParams);

    final response = await http.get(url);
    print(response.body);
    return response.body;
  }

  Future<void> searchMovies(String query) async {

    if(query.isEmpty){
      searchResults = [];
      notifyListeners();
      return;
    }

    final jsonData = await _getJsonData('/3/search/movie', 1, {'query': query});
    final searchResponse = PopularResponse.fromJson(jsonData); 
    searchResults = searchResponse.movie;
    notifyListeners();
  }

  getNowOnDisplayMovies() async {
    final jsonData = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    nowPlayingMovies = nowPlayingResponse.movie;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.movie];
    notifyListeners();
  }

  getTopRatedMovies() async {
    _topratedPage++;
    final jsonData = await _getJsonData('/3/movie/top_rated', _topratedPage);
    final topratedResponse = TopRatedResponse.fromJson(jsonData);
    topratedMovies = [...topratedMovies, ...topratedResponse.movie];
    notifyListeners();
  }

}