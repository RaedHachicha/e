// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_cinemav1/consts/colors.dart';
import 'package:flutter/material.dart';

import 'package:e_cinemav1/home/model/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class SessionUI extends StatefulWidget {
  Movie movie;
  SessionUI({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<SessionUI> createState() => _SessionUIState();
}

class _SessionUIState extends State<SessionUI> {
  bool byCinema = false;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var movie = widget.movie;
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            title: Text(movie.title),
            centerTitle: true,
            pinned: true,
            snap: false,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(width: mediaquery.width * 0.6),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: primaryOrangeColor, width: 0.8))),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Sessions",
                      style: GoogleFonts.raleway(
                          fontSize: 22, color: Colors.white),
                    ),
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: offColor,
              thickness: 0.8,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              width: mediaquery.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(UniconsLine.calendar_alt,
                            color: offColor, size: 35),
                        Text(
                          "April, 18",
                          style: GoogleFonts.raleway(
                              fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(UniconsLine.exchange_alt,
                            color: offColor, size: 35),
                        Text(
                          "Time",
                          style: GoogleFonts.raleway(
                              fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        byCinema = !byCinema;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                              byCinema
                                  ? UniconsLine.toggle_on
                                  : UniconsLine.toggle_off,
                              color: byCinema ? primaryOrangeColor : offColor,
                              size: 35),
                          Text(
                            "By cinema",
                            style: GoogleFonts.raleway(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: offColor,
              thickness: 0.8,
            ),
          ),
        ],
      ),
    ));
  }
}
