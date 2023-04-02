import 'package:e_cinemav1/consts/hardcoded_database/_cineman_builder.dart';
import 'package:e_cinemav1/session/model/cinema_model.dart';
import 'package:e_cinemav1/session/model/session_model.dart';

class ISessionBuilder {
  ISessionBuilder();

  static List<Session> spiritedAwaySessions() => [spiritedAway1, spiritedAway2, spiritedAway3, spiritedAway4, spiritedAway5, spiritedAway6, spiritedAway7];
  static Session spiritedAway1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 14, 00),
      date: DateTime(2023, 04, 16));

  static Session spiritedAway2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 16, 30),
      date: DateTime(2023, 04, 23));

  static Session spiritedAway3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 5));

  static Session spiritedAway4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 22, 00),
      date: DateTime(2023, 04, 28));

  static Session spiritedAway5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 23, 20),
      date: DateTime(2023, 04, 22));

  static Session spiritedAway6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 11, 00),
      date: DateTime(2023, 04, 29));

  static Session spiritedAway7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 02));
  
  static List<Session> theMatrixSessions() => [theMatrix1, theMatrix2, theMatrix3, theMatrix4, theMatrix5, theMatrix6, theMatrix7];
static Session theMatrix1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 14, 00),
      date: DateTime(2023, 04, 16));

  static Session theMatrix2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 16, 30),
      date: DateTime(2023, 04, 23));

  static Session theMatrix3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 5));

  static Session theMatrix4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 22, 00),
      date: DateTime(2023, 04, 28));

  static Session theMatrix5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 23, 20),
      date: DateTime(2023, 04, 22));

  static Session theMatrix6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 11, 00),
      date: DateTime(2023, 04, 29));

  static Session theMatrix7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 02));
  
  static List<Session> inceptionsSessions() => [inceptions1, inceptions2, inception3, inception4, inception5, inception6, inception7];
static Session inceptions1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 14, 00),
      date: DateTime(2023, 04, 16));

  static Session inceptions2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 16, 30),
      date: DateTime(2023, 04, 23));

  static Session inception3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 5));

  static Session inception4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 22, 00),
      date: DateTime(2023, 04, 28));

  static Session inception5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 23, 20),
      date: DateTime(2023, 04, 22));

  static Session inception6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 11, 00),
      date: DateTime(2023, 04, 29));

  static Session inception7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 02));
  
  static List<Session> thegodfathersSessions() => [ thegodfathers1, thegodfathers2, thegodfathers3, thegodfathers4, thegodfathers5,thegodfathers6,thegodfathers7
      ];
  static Session thegodfathers1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 14, 00),
      date: DateTime(2023, 04, 16));

  static Session thegodfathers2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 16, 30),
      date: DateTime(2023, 04, 23));

  static Session thegodfathers3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 5));

  static Session thegodfathers4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 22, 00),
      date: DateTime(2023, 04, 28));

  static Session thegodfathers5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 23, 20),
      date: DateTime(2023, 04, 22));

  static Session thegodfathers6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 11, 00),
      date: DateTime(2023, 04, 29));

  static Session thegodfathers7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 02));
  static List<Session> unchartedSessions() => [ uncharted1, uncharted2, uncharted3, uncharted4, uncharted5,uncharted6,uncharted7
      ];
  static Session uncharted1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 14, 00),
      date: DateTime(2023, 04, 16));

  static Session uncharted2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 16, 30),
      date: DateTime(2023, 04, 23));

  static Session uncharted3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 5));

  static Session uncharted4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 22, 00),
      date: DateTime(2023, 04, 28));

  static Session uncharted5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 23, 20),
      date: DateTime(2023, 04, 22));

  static Session uncharted6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 11, 00),
      date: DateTime(2023, 04, 29));

  static Session uncharted7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 02));

  static psychoSessions() =>
      [psychoS1, psychoS2, psychoS3, pyschoS4, psychoS5, psychoS6, psycho7];

  static Session psychoS1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 13, 00),
      date: DateTime(2023, 04, 16));

  static Session psychoS2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 15, 30),
      date: DateTime(2023, 04, 23));

  static Session psychoS3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 12, 00),
      date: DateTime(2023, 05, 5));

  static Session pyschoS4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 20, 00),
      date: DateTime(2023, 04, 28));

  static Session psychoS5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 11, 20),
      date: DateTime(2023, 04, 22));

  static Session psychoS6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 9, 00),
      date: DateTime(2023, 04, 29));

  static Session psycho7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 05, 02));

  static batmanSessions() =>
      [batmanS1, batmanS2, batmanS3, batmanS4, batmanS5, batmanS6, batmanS7];

  static Session batmanS1 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 14, 30),
      date: DateTime(2023, 04, 16));

  static Session batmanS2 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 16, 30),
      date: DateTime(2023, 04, 16));

  static Session batmanS3 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 10, 30),
      date: DateTime(2023, 05, 5));

  static Session batmanS4 = Session(
      cinema: ICinemaBuilder.cinemaCGR,
      time: DateTime(1999, 1, 1, 21, 30),
      date: DateTime(2023, 04, 28));

  static Session batmanS5 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 20, 30),
      date: DateTime(2023, 04, 28));

  static Session batmanS6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 04, 16));

  static Session batmanS7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 18, 00),
      date: DateTime(2023, 04, 16));
}
