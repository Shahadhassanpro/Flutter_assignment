import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:app_test/weather.dart';

class WeatherConfig {
  Future<Weather?> getdata(var latitude, var longitude) async {
    var callUri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=c0dbb6f1794640eeabf103014222805&q=$latitude,$longitude&aqi=no');
    var resp = await http.get(callUri);
    var body = jsonDecode(resp.body);
    return Weather.fromJson(body);
  }
}
