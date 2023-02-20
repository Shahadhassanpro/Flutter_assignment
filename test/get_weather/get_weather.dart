import 'current.dart';
import 'location.dart';

class GetWeather {
  Location? location;
  Current? current;

  GetWeather({this.location, this.current});

  factory GetWeather.fromJson(Map<String, dynamic> json) => GetWeather(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
      };
}
