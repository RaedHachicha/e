import 'package:e_cinemav1/consts/hardcoded_database/_cineman_builder.dart';
import 'package:e_cinemav1/session/model/cinema_model.dart';
import 'package:e_cinemav1/session/model/session_model.dart';

class ISessionBuilder {
  ISessionBuilder();

  static psychoSessions() => [psychoS1, psychoS2, psychoS3, pyschoS4, psychoS5, psychoS6, psycho7];

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
      date: DateTime(2023, 04, 23));

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
      date: DateTime(2023, 04, 22));

  static Session batmanS6 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 15, 00),
      date: DateTime(2023, 04, 29));

  static Session batmanS7 = Session(
      cinema: ICinemaBuilder.pathe,
      time: DateTime(1999, 1, 1, 18, 00),
      date: DateTime(2023, 05, 02));
}
