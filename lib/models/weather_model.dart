class WeatherModel {
// String ?feel ;
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  double? gust;
  weather? main;
  int? sea_level;

  WeatherModel({
    // this.feel,
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.gust,
    this.main,
    this.sea_level,
  });

  WeatherModel.fromJson(Map<String, dynamic> data) {
    // feel =data['weather']['main'];
    cityName = data["name"];
    temp = data["main"]["temp"];
    wind = data["wind"]["speed"];
    pressure = data["main"]["pressure"];
    humidity = data["main"]["humidity"];
    feels_like = data["main"]["feels_like"];
    gust = data["wind"]["gust"];
    main = weather.fromJson(data['main']);
    sea_level = data['main']['sea_level'];
  }

  Map<String, dynamic> toJson() {
    return {
      "cityName": cityName,
      "temp": temp,
      "wind": wind,
      "pressure": pressure,
      "humidity": humidity,
      "feels_like": feels_like,
      "gust": gust,
      "sea_level": sea_level,
      // "main":main,
    };
  }
}

class weather {
  String? main;

  weather();
  weather.fromJson(Map<String, dynamic> item) {
    main = item['main'];
  }

  Map<String, dynamic> toJson() {
    return {
      "main": main,
    };
  }
}
