import '../../consts/hardcoded_database/database.dart';
import '../model/movie_model.dart';

class HomeController {
  HomeController();

  List<Movie> getMovies() {
    return LocalDatabase.service.getMovies();
  }
}
