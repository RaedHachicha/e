// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:e_cinemav1/consts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:e_cinemav1/home/model/movie_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:unicons/unicons.dart';

import '../controller/session_manager.dart';
import '../model/session_model.dart';

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
  bool byTime = false;

  DateTime today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var movie = widget.movie;
    var sessionManager = SessionManager(widget.movie);
    var session_list = byTime
        ? sessionManager.getSessionByDateAndTimeSorted(today)
        : sessionManager.getSessionByDate(today);
    String dateToString() {
      DateFormat dateFormat = DateFormat("MMMM, dd");
      return dateFormat.format(today);
    }

    TextStyle tableTitleStyle = TextStyle(fontSize: 16, color: offColor);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primaryBlueColor,
          title: Text(movie.title),
          centerTitle: true,
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: primaryOrangeColor, width: 0.9))),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Sessions",
                    style:
                        GoogleFonts.raleway(fontSize: 22, color: Colors.white),
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      BottomPicker.date(
                                        minDateTime: DateTime(2021, 5, 1),
                                        maxDateTime: DateTime(2024, 8, 2),
                                        initialDateTime: DateTime(
                                            DateTime.now().year,
                                            DateTime.now().month,
                                            DateTime.now().day),
                                        title: "Choose the date",
                                        dateOrder: DatePickerDateOrder.dmy,
                                        pickerTextStyle: TextStyle(
                                          color: primaryBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        titleStyle: TextStyle(
                                          color: primaryBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        onSubmit: (index) {
                                          setState(() {
                                            today = DateTime(index.year,
                                                index.month, index.day);
                                          });
                                        },
                                        bottomPickerTheme:
                                            BottomPickerTheme.plumPlate,
                                      ).show(context);
                                    },
                                    icon: Icon(UniconsLine.calendar_alt,
                                        color: offColor, size: 30),
                                  ),
                                  Text(
                                    dateToString(),
                                    style: GoogleFonts.raleway(
                                        fontSize: 18, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  byTime = !byTime;
                                });
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(UniconsLine.exchange_alt,
                                        color: byTime
                                            ? primaryOrangeColor
                                            : offColor,
                                        size: 30),
                                    Text(
                                      "Time",
                                      style: GoogleFonts.raleway(
                                          fontSize: 18, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       byCinema = !byCinema;
                            //     });
                            //   },
                            //   child: Container(
                            //     child: Column(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         Icon(
                            //             byCinema
                            //                 ? UniconsLine.toggle_on
                            //                 : UniconsLine.toggle_off,
                            //             color: byCinema
                            //                 ? primaryOrangeColor
                            //                 : offColor,
                            //             size: 30),
                            //         Text(
                            //           "By cinema",
                            //           style: GoogleFonts.raleway(
                            //               fontSize: 18, color: Colors.white),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          color: blueDarkOffColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Time", style: tableTitleStyle),
                              Text(
                                "Adult",
                                style: tableTitleStyle,
                              ),
                              Text(
                                "Child",
                                style: tableTitleStyle,
                              ),
                              Text(
                                "Student",
                                style: tableTitleStyle,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(200.0),
                ),
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: primaryBlueColor,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                if (session_list.isEmpty) {
                  return _buildEmptySession();
                } else {
                  var session = session_list[index];
                  return _buildSessionItem(session);
                }
              }, childCount: session_list.isEmpty ? 1 : session_list.length))
            ],
          ),
        ));
  }

//Empty session widget
  Widget _buildEmptySession() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "No session available",
              style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
            ),
            Lottie.asset("assets/empty_box.json")
          ],
        ),
      ),
    );
  }

// session item widget
  Widget _buildSessionItem(Session session) {
    String timeToString() {
      var dateformat = DateFormat("HH:mm");
      return dateformat.format(session.time);
    }

    TextStyle itemStyle =
        GoogleFonts.rosario(fontSize: 22, color: Colors.white);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              timeToString(),
              style: itemStyle,
            ),
            SizedBox(
              width: 10,
            ),
            VerticalDivider(
              color: offColor,
              thickness: 0.5,
              endIndent: 20,
              indent: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  session.cinema.cinema_title,
                  style: itemStyle,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var price in session.cinema.cinema_prices)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              price.toString() + " £",
                              style: itemStyle,
                            ),
                          )
                      ],
                    ))
              ],
            )
          ],
        ),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: offColor, width: 0.8),
        )),
      ),
    );
  }
}

//SliverToBoxAdapter(
//   child: Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(width: mediaquery.width * 0.6),
//             Container(
//               decoration: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                           color: primaryOrangeColor, width: 0.8))),
//               alignment: Alignment.bottomRight,
//               child: Text(
//                 "Sessions",
//                 style: GoogleFonts.raleway(
//                     fontSize: 22, color: Colors.white),
//               ),
//               height: 70,
//             ),
//           ],
//         ),

//       ],
//     ),
//   ),
// ),
// // SliverToBoxAdapter(
// //   child: Divider(
// //     color: offColor,
// //     thickness: 0.8,
// //   ),
// // ),
// SliverToBoxAdapter(
//   child: Container(
//     height: 100,
//     width: mediaquery.width,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Icon(UniconsLine.calendar_alt,
//                   color: offColor, size: 35),
//               Text(
//                 "April, 18",
//                 style: GoogleFonts.raleway(
//                     fontSize: 18, color: Colors.white),
//               )
//             ],
//           ),
//         ),
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Icon(UniconsLine.exchange_alt,
//                   color: offColor, size: 35),
//               Text(
//                 "Time",
//                 style: GoogleFonts.raleway(
//                     fontSize: 18, color: Colors.white),
//               )
//             ],
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               byCinema = !byCinema;
//             });
//           },
//           child: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(
//                     byCinema
//                         ? UniconsLine.toggle_on
//                         : UniconsLine.toggle_off,
//                     color: byCinema ? primaryOrangeColor : offColor,
//                     size: 35),
//                 Text(
//                   "By cinema",
//                   style: GoogleFonts.raleway(
//                       fontSize: 18, color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
