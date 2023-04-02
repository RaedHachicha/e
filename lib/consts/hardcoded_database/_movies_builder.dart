import 'package:e_cinemav1/consts/hardcoded_database/_detailedInformation_builder.dart';
import 'package:e_cinemav1/consts/hardcoded_database/_session_builder.dart';
import 'package:e_cinemav1/home/model/detailedInformation.dart';

import '../../home/model/movie_model.dart';

class MovieBuilders {
  DetailedInformationBuilder dIBuilder = DetailedInformationBuilder();
  MovieBuilders();
  List<Movie> getMovies() {
    List<Movie> movies = [];
    movies.add(thebatman);
    movies.add(uncharted);
    movies.add(theGodFather);
    movies.add(inception);
    movies.add(theMatrix);
    movies.add(spiritedAway);
    movies.add(psycho);
    return movies;
  }

  Movie psycho = Movie(
    sessions: ISessionBuilder.psychoSessions(),
    detailedInformation: DetailedInformationBuilder.psychoDI,
    title: "Psycho",
    imglink:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Psycho_%281960%29_theatrical_poster_%28retouched%29.jpg/1200px-Psycho_%281960%29_theatrical_poster_%28retouched%29.jpg",
    rate: 8.5,
    genres: ["Horror", "Mystery", "Thriller"],
  );

  Movie thebatman = Movie(
     sessions: ISessionBuilder.batmanSessions(),
      detailedInformation: DetailedInformationBuilder.thebatmanDI,
      title: "The Batman",
      imglink:
          'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_.jpg',
      rate: 7.2,
      genres: ["Action", "Crime", "Drama"]);

  Movie uncharted = Movie(
    sessions: ISessionBuilder.unchartedSessions(),
      detailedInformation: DetailedInformationBuilder.unchartedDI,
      title: "Uncharted",
      imglink:
          'https://www.jeuxvideo-live.com/wp-content/uploads/jvl/2022/07/fi-uygzucamcxh0-1642152287-article.jpg',
      rate: 6.9,
      genres: ["Action", "Adventure", "Thriller"]);

  Movie theGodFather = Movie(
    sessions: ISessionBuilder.thegodfathersSessions(),
      detailedInformation: DetailedInformationBuilder.theGDfatherDI,
      title: "The God Father",
      imglink:
          "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
      rate: 9.2,
      genres: ["Crime", "Drama"]);

  Movie inception = Movie(
  sessions: ISessionBuilder.inceptionsSessions(),
      detailedInformation: DetailedInformationBuilder.inceptionDI,
      title: "Inception",
      imglink:
          "https://resizing.flixster.com/8X8J8sNXmCWDBaxo3vueONLRj00=/206x305/v2/https://flxt.tmsimg.com/assets/p7825626_p_v8_af.jpg",
      rate: 8.8,
      genres: ["Action", "Adventure", "Sci-Fi"]);
  Movie theMatrix = Movie(
    sessions: ISessionBuilder.theMatrixSessions(),
      detailedInformation: DetailedInformationBuilder.theMatrixDI,
      title: "The Matrix",
      imglink:
          "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51EG732BV3L._AC_UF894,1000_QL80_.jpg",
      rate: 8.7,
      genres: ["Action", "Sci-Fi"]);

  Movie spiritedAway = Movie(
    sessions: ISessionBuilder.spiritedAwaySessions(),
      detailedInformation: DetailedInformationBuilder.spiritedAwayDI,
      title: "Spirited Away",
      imglink:
          "https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
      rate: 8.5,
      genres: ["Animation", "Adventure", "Family"]);
}
