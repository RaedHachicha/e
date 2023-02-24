import '../../home/model/movie_model.dart';

class MovieBuilders {

  MovieBuilders();

  List<Movie> getMovies() {
    List<Movie> movies = [];
    movies.add(thebatman);
    movies.add(uncharted);
    return movies;
  }

  Movie thebatman = Movie(
      title: "The Batman",
      imglink:
          'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_.jpg',
      rate: 7.2,
      genres: ["Action", "Crime", "Drama"]);

  Movie uncharted = Movie(
      title: "Uncharted",
      imglink:
          'https://www.jeuxvideo-live.com/wp-content/uploads/jvl/2022/07/fi-uygzucamcxh0-1642152287-article.jpg',
      rate: 6.9,
      genres: ["Action", "Adventure", "Thriller"]);
}
