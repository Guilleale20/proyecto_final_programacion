import 'dart:convert';

import 'package:proyecto_final_programacion/models/models.dart';

class TopRatedResponse {
    int page;
    List<Movie> movie;
    int totalPages;
    int totalResults;

    TopRatedResponse({
        required this.page,
        required this.movie,
        required this.totalPages,
        required this.totalResults,
    });

    factory TopRatedResponse.fromJson(String str) => TopRatedResponse.fromMap(json.decode(str));

    factory TopRatedResponse.fromMap(Map<String, dynamic> json) => TopRatedResponse(
        page: json["page"],
        movie: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}
