// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final int id;
  final String originalTitle;
  final List<int> genreIds;
  final double voteAverage;
  MovieModel({
    required this.id,
    required this.originalTitle,
    required this.genreIds,
    required this.voteAverage,
  });
  
  


  MovieModel copyWith({
    int? id,
    String? originalTitle,
    List<int>? genreIds,
    double? voteAverage,
  }) {
    return MovieModel(
      id: id ?? this.id,
      originalTitle: originalTitle ?? this.originalTitle,
      genreIds: genreIds ?? this.genreIds,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'originalTitle': originalTitle,
      'genreIds': genreIds,
      'voteAverage': voteAverage,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int,
      originalTitle: map['originalTitle'] as String,
      genreIds: List<int>.from((map['genreIds'] as List<int>)),
      voteAverage: map['voteAverage'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(id: $id, originalTitle: $originalTitle, genreIds: $genreIds, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.originalTitle == originalTitle &&
      listEquals(other.genreIds, genreIds) &&
      other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      originalTitle.hashCode ^
      genreIds.hashCode ^
      voteAverage.hashCode;
  }
}
