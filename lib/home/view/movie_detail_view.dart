// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_cinemav1/consts/colors.dart';
import 'package:e_cinemav1/session/view/session_view.dart';
import 'package:flutter/material.dart';

import 'package:e_cinemav1/home/model/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailUI extends StatefulWidget {
  Movie movie;
  MovieDetailUI({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailUI> createState() => _MovieDetailUIState();
}

class _MovieDetailUIState extends State<MovieDetailUI> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var movie = widget.movie;
    var videoID =
        YoutubePlayer.convertUrlToId(movie.detailedInformation.trailer);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoID!,
    );
    String stringList(List<String> list) {
      String result = "";
      for (String str in list) {
        result += str + ", ";
      }
      return result;
    }

    //UI
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (ctx, player) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => SessionUI(movie: movie)));
                },
                backgroundColor: primaryOrangeColor,
                child: Icon(UniconsLine.ticket),
              ),
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      elevation: 0.5,
                      backgroundColor: backgroundColor,
                      snap: false,
                      floating: true,
                      title: Text(movie.title),
                    ),
                    SliverToBoxAdapter(
                      child: Hero(
                        tag: movie.imglink,
                        child: Container(
                          height: mediaquery.height * 0.3,
                          width: mediaquery.width,
                          child: player,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Divider(
                        color: offColor,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: mediaquery.height * 0.1,
                        width: mediaquery.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                children: <TextSpan>[
                                  TextSpan(
                                    //manually spacing :D
                                    text: "  " + movie.rate.toString(),
                                    style: GoogleFonts.acme(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '\nIMDB',
                                      style: GoogleFonts.acme(
                                        color: offColor,
                                      )),
                                ],
                              ),
                              textScaleFactor: 0.5,
                            ),
                            VerticalDivider(
                              color: Colors.white,
                              thickness: 2,
                              indent: 10,
                              endIndent: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 45),
                                children: <TextSpan>[
                                  TextSpan(
                                    //manually spacing :D
                                    text: "      " +
                                        (movie.rate - 2.1).toStringAsFixed(1),
                                    style: GoogleFonts.acme(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                      text: '\nKinopoisk',
                                      style: GoogleFonts.acme(
                                        color: offColor,
                                      )),
                                ],
                              ),
                              textScaleFactor: 0.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Divider(
                        thickness: 1,
                        color: offColor,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(movie.detailedInformation.desciption,
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _buildDetails(
                              "Certificate",
                              movie.detailedInformation.certified.toString() +
                                  "+"),
                          _buildDetails(
                              "Release",
                              movie.detailedInformation.releaseDate.year
                                  .toString()),
                          _buildDetails(
                              "Director", movie.detailedInformation.director),
                          _buildDetails("Actors",
                              stringList(movie.detailedInformation.actors)),
                          _buildDetails("Genre", stringList(movie.genres)),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ));
  }

  Widget _buildDetails(String info, String value) {
    TextStyle value_style = GoogleFonts.quicksand(
        fontSize: 16, color: Colors.white, letterSpacing: 1.1);
    TextStyle info_style = GoogleFonts.quicksand(
        fontSize: 20, color: offColor, fontWeight: FontWeight.w700);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 350,
        child: Row(
          children: [
            Expanded(
              child: Text(
                info,
                style: info_style,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: value_style,
              ),
            )
          ],
        ),
      ),
    );
  
  }
}
