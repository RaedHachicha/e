import 'package:e_cinemav1/home/model/_api_service.dart';
import 'package:http/http.dart' as http;

class MovieAPI extends APIService {
  String API_key = "fe827b7bf86310040ff88b124b3baf94";
  final String base_url = "https://api.themoviedb.org/3/";
  String TABLE_NAME = "movie";

  void read_populair_movies(int page) {
      var request2 = http.Request(
      'GET',
      Uri.parse(base_url +
          TABLE_NAME +
          "/popular?" +
          "api_key=" +
          API_key +
          "&language=en-US&page=${page}"));
  }
}
