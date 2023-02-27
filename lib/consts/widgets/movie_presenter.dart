import 'package:e_cinemav1/consts/colors.dart';
import 'package:e_cinemav1/home/model/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePresenter extends StatelessWidget {
  final Movie movie;
  const MoviePresenter({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.07),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          //IMG presenter
          IMGPresenter(
            img: movie.imglink,
          ),
          //rate PRESENTER
          RatePresenter(
            rate: movie.rate,
          ),
          //title presenter
          TitlePresenter(
            genre: movie.genres[0],
            title: movie.title,
          )
        ],
      ),
    );
  }
}

class IMGPresenter extends StatelessWidget {
  final String img;
  const IMGPresenter({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Container(
      height: mediaquery.size.height / 3.2,
      width: mediaquery.size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class TitlePresenter extends StatelessWidget {
  final String title;
  final String genre;
  const TitlePresenter({Key? key, required this.title, required this.genre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 15),
              Text(
                title,
                style: GoogleFonts.stickNoBills(
                    color: Colors.white, fontSize: 21, letterSpacing: 1.2),
              ),
              Text(
                genre,
                style: GoogleFonts.finlandica(
                  color: offColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 7)
            ],
          ),
          height: mediaquery.size.height / 11,
          width: mediaquery.size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class RatePresenter extends StatelessWidget {
  final double rate;
  const RatePresenter({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          alignment: Alignment.center,
          child: Text(rate.toString(),
              style: GoogleFonts.domine(
                color: Colors.white,
                fontSize: 16,
              )),
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            color: rate > 6.5 ? primaryOrangeColor : blackOffColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
