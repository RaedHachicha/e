// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DetailedInformation {
 String desciption;
 int certified;
 String director;
 List<String> actors;
 DateTime releaseDate;
 String trailer;
  DetailedInformation({
    required this.desciption,
    required this.certified,
    required this.director,
    required this.actors,
    required this.releaseDate,
    required this.trailer,
  });

  DetailedInformation copyWith({
    String? desciption,
    int? certified,
    String? director,
    List<String>? actors,
    DateTime? releaseDate,
    String? trailer,
  }) {
    return DetailedInformation(
      desciption: desciption ?? this.desciption,
      certified: certified ?? this.certified,
      director: director ?? this.director,
      actors: actors ?? this.actors,
      releaseDate: releaseDate ?? this.releaseDate,
      trailer: trailer ?? this.trailer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'desciption': desciption,
      'certified': certified,
      'director': director,
      'actors': actors,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'trailer': trailer,
    };
  }

  factory DetailedInformation.fromMap(Map<String, dynamic> map) {
    return DetailedInformation(
      desciption: map['desciption'] as String,
      certified: map['certified'] as int,
      director: map['director'] as String,
      actors: List<String>.from((map['actors'] as List<String>)),
      releaseDate: DateTime.fromMillisecondsSinceEpoch(map['releaseDate'] as int),
      trailer: map['trailer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailedInformation.fromJson(String source) => DetailedInformation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DetailedInformation(desciption: $desciption, certified: $certified, director: $director, actors: $actors, releaseDate: $releaseDate, trailer: $trailer)';
  }

  @override
  bool operator ==(covariant DetailedInformation other) {
    if (identical(this, other)) return true;
  
    return 
      other.desciption == desciption &&
      other.certified == certified &&
      other.director == director &&
      listEquals(other.actors, actors) &&
      other.releaseDate == releaseDate &&
      other.trailer == trailer;
  }

  @override
  int get hashCode {
    return desciption.hashCode ^
      certified.hashCode ^
      director.hashCode ^
      actors.hashCode ^
      releaseDate.hashCode ^
      trailer.hashCode;
  }
}
