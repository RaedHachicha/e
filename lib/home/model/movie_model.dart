// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:e_cinemav1/home/model/detailedInformation.dart';

class Movie {
  final String title;
  final String imglink;
  final double rate;
  final List<String> genres;
  final DetailedInformation detailedInformation;
  Movie({
    required this.title,
    required this.imglink,
    required this.rate,
    required this.genres,
    required this.detailedInformation,
  });

  Movie copyWith({
    String? title,
    String? imglink,
    double? rate,
    List<String>? genres,
    DetailedInformation? detailedInformation,
  }) {
    return Movie(
      title: title ?? this.title,
      imglink: imglink ?? this.imglink,
      rate: rate ?? this.rate,
      genres: genres ?? this.genres,
      detailedInformation: detailedInformation ?? this.detailedInformation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imglink': imglink,
      'rate': rate,
      'genres': genres,
      'detailedInformation': detailedInformation.toMap(),
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      imglink: map['imglink'] as String,
      rate: map['rate'] as double,
      genres: List<String>.from((map['genres'] as List<String>)),
      detailedInformation: DetailedInformation.fromMap(map['detailedInformation'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(title: $title, imglink: $imglink, rate: $rate, genres: $genres, detailedInformation: $detailedInformation)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imglink == imglink &&
      other.rate == rate &&
      listEquals(other.genres, genres) &&
      other.detailedInformation == detailedInformation;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      imglink.hashCode ^
      rate.hashCode ^
      genres.hashCode ^
      detailedInformation.hashCode;
  }
}
