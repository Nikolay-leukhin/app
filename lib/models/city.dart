class City {
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
      country: json['country'] ?? 'wha country',
      name: json['city'] ?? 'who name',
      lon: json['lon'],
      lat: json['lat']
    );
  }


  @override
  String toString() {
    return "Ciry($name, $country, $lat, $lon)";
  }
}
