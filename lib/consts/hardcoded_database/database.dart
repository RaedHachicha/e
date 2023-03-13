import 'package:e_cinemav1/home/model/movie_model.dart';

import '_movies_builder.dart';

class LocalDatabase {

  LocalDatabase._privateConstructor();

  static final LocalDatabase service = LocalDatabase._privateConstructor();
  final movieBuilder = MovieBuilders();

  List<Movie> getMovies() {
    return service.movieBuilder.getMovies();
  }
}
