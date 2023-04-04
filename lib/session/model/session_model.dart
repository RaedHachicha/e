// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:e_cinemav1/session/model/cinema_model.dart';

class Session {
  final Cinema cinema;
  final DateTime time;
  final DateTime date;
  Session({
    required this.cinema,
    required this.time,
    required this.date,
  });
  

  Session copyWith({
    Cinema? cinema,
    DateTime? time,
    DateTime? date,
  }) {
    return Session(
      cinema: cinema ?? this.cinema,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cinema': cinema.toMap(),
      'time': time.millisecondsSinceEpoch,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      cinema: Cinema.fromMap(map['cinema'] as Map<String,dynamic>),
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Session.fromJson(String source) => Session.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Session(cinema: $cinema, time: $time, date: $date)';

  @override
  bool operator ==(covariant Session other) {
    if (identical(this, other)) return true;
  
    return 
      other.cinema == cinema &&
      other.time == time &&
      other.date == date;
  }

  @override
  int get hashCode => cinema.hashCode ^ time.hashCode ^ date.hashCode;
  }
