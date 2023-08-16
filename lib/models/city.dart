
import 'package:equatable/equatable.dart';

class City extends Equatable{
  final String name;

  final String country;

  final double lat;

  final double lon;

  City(
    {
      required this.name,
      required this.country,
      required this.lat,
      required this.lon
    }
  );

  factory City.fromJson(Map<String, dynamic> json){
    return City(
      country: json['country'],
      name: json['city'] ?? json['name'],
      lon: json['lon'],
      lat: json['lat']
    );
  }

  Map<String, dynamic> toJson() => 
    {
      'name': name,
      'country': country,
      'lat': lat,
      'lon': lon
    };


  @override
  String toString() {
    return "City($name, $country, $lat, $lon)";
  }
  
  @override
  List<Object?> get props => [name, country, lat, lon];
}
