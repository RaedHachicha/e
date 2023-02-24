import 'package:e_cinemav1/home/model/movie_model.dart';

import '_movies_builder.dart';

class LocalDatabase {
  // //singleton
  // static final LocalDatabase _instance = LocalDatabase._internal();
  // factory LocalDatabase() => _instance;
  // LocalDatabase._internal();

  LocalDatabase._privateConstructor();

  static final LocalDatabase service = LocalDatabase._privateConstructor();
  final movieBuilder = MovieBuilders();

  List<Movie> getMovies() {
    return service.movieBuilder.getMovies();
  }
}
