// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Cinema {
  String cinema_title;
  String cinema_address;
  List<double> cinema_prices;
  Cinema({
    required this.cinema_title,
    required this.cinema_address,
    required this.cinema_prices,
  });
  

  Cinema copyWith({
    String? cinema_title,
    String? cinema_address,
    List<double>? cinema_prices,
  }) {
    return Cinema(
      cinema_title: cinema_title ?? this.cinema_title,
      cinema_address: cinema_address ?? this.cinema_address,
      cinema_prices: cinema_prices ?? this.cinema_prices,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cinema_title': cinema_title,
      'cinema_address': cinema_address,
      'cinema_prices': cinema_prices,
    };
  }

  factory Cinema.fromMap(Map<String, dynamic> map) {
    return Cinema(
      cinema_title: map['cinema_title'] as String,
      cinema_address: map['cinema_address'] as String,
      cinema_prices: List<double>.from((map['cinema_prices'] as List<double>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cinema.fromJson(String source) => Cinema.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cinema(cinema_title: $cinema_title, cinema_address: $cinema_address, cinema_prices: $cinema_prices)';

  @override
  bool operator ==(covariant Cinema other) {
    if (identical(this, other)) return true;
  
    return 
      other.cinema_title == cinema_title &&
      other.cinema_address == cinema_address &&
      listEquals(other.cinema_prices, cinema_prices);
  }

  @override
  int get hashCode => cinema_title.hashCode ^ cinema_address.hashCode ^ cinema_prices.hashCode;
}
