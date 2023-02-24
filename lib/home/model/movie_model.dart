// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  final String title;
  final String imglink;
  final double rate;
  final List<String> genres;
  Movie({
    required this.title,
    required this.imglink,
    required this.rate,
    required this.genres,
  });

  

  Movie copyWith({
    String? title,
    String? imglink,
    double? rate,
    List<String>? genres,
  }) {
    return Movie(
      title: title ?? this.title,
      imglink: imglink ?? this.imglink,
      rate: rate ?? this.rate,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imglink': imglink,
      'rate': rate,
      'genres': genres,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      imglink: map['imglink'] as String,
      rate: map['rate'] as double,
      genres: List<String>.from((map['genres'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(title: $title, imglink: $imglink, rate: $rate, genres: $genres)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imglink == imglink &&
      other.rate == rate &&
      listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      imglink.hashCode ^
      rate.hashCode ^
      genres.hashCode;
  }
}
