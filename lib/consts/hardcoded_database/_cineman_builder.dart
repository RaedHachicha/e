
import '../../session/model/cinema_model.dart';

class ICinemaBuilder {
  static Cinema cinemaCGR = Cinema(
      cinema_title: "Cinema CGR",
      cinema_address: "11 Rue du Port, Le Mans, France",
      cinema_prices: [20.0, 15, 9]);

  static Cinema pathe = Cinema(
      cinema_title: "Pathé",
      cinema_address: "3PI des jacobins, Le Mans, France",
      cinema_prices: [20.0, 15, 9]);
}