class Wether{
  double temp_c;
  double lat;
  double lon;
  String condition;
  String time;
  String icn;

  Wether({
    this.temp_c=0,
    this.lat=0,
    this.lon=0,
    this.condition='Sunny',
    this.time='2011-04-17',
    this.icn='//cdn.weatherapi.com/weather/64x64/day/113.png"',
  });

  factory Wether.fromJson(Map<String,dynamic>json){
    return Wether(
      temp_c: json["current"]["temp_c"],
      lat: json["location"]["lat"],
      lon: json["location"]["lon"],
      condition: json["current"]["condition"]["text"],
      time: json["location"]["localtime"],
      icn: json["current"]["condition"]["icon"],
    );
  }
}
