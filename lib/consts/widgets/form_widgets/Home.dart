import 'package:e_cinemav1/consts/timeSelector.dart';
import 'package:flutter/material.dart';

import '../../Locations.dart';
import '../../bar_film.dart';
import '../../Date.dart';
import '../../paybutton.dart';
import '../../seat.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //app bar

          //date selector
          DateSelector(),

          TimeSelector(),

          LocationText(),

          //Seat selector
          SeatSelector(),

          //Pay button and seat categories
          PayButton(),
        ],
      ),
    ));
  }
}
