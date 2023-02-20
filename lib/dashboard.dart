import 'package:app_test/const.dart';
import 'package:app_test/fetch_location.dart';
import 'package:app_test/search.dart';
import 'package:app_test/weatherconfig.dart';
import 'package:app_test/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

var dayinfo = DateTime.now();
var dateformat = DateFormat('EEE, d MMM, yyyy').format(dayinfo);

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

//fetching position start
  var client = WeatherConfig();
  var data;

  info() async {
    var position = await GetPosition();
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //data = await client.getdata(position.latitude, position.longitude);
    data = await client.getdata(position.latitude, position.longitude);

    return data;
  }
// fetching position end

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        if (data == null) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.50),
              child: Column(
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.purple,
                    color: Colors.white,
                    strokeWidth: 4,
                  ),
                  sbx,
                  sbx,
                  Text(
                    'Please Wait ',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
          );
        }

        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                height: size.height * 0.7,
                width: size.width,
                margin: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 185, 10, 176),
                      Color.fromARGB(255, 83, 1, 69),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          onPressed: () {
                            MySearchBar();
                          },
                          icon: Icon(Icons.search_outlined),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        style: TextStyle(
                          color: wcolor,
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                        ),
                        '${data?.cityName}'),
                    const SizedBox(height: 5),
                    Text(
                        style: TextStyle(
                          color: wcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        "$dateformat"),
                    const SizedBox(
                      height: 10,
                    ),
                    /*   Image.asset(
                      'assets/img/028-sun.png',
                      height: size.width * 0.3,
                    ), */
                    Image.network(
                      'https:${data?.icon}',
                      height: size.width * 0.3,
                    ),
                    Text(
                        style: TextStyle(
                          color: wcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        '${data?.condition}'),
                    Text(
                        style: TextStyle(
                          color: wcolor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        '${data?.temp}'),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/img/007-wind.png',
                              height: size.width * 0.1,
                            ),
                            const SizedBox(height: 15),
                            Text(
                                style: TextStyle(
                                  color: wcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                '${data?.wind} kmph'),
                            const Text(
                                style: TextStyle(
                                  color: wcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                "Wind"),
                          ],
                        )),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/004-cloud.png',
                                height: size.width * 0.1,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                  style: TextStyle(
                                    color: wcolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  '${data?.humidity} '),
                              const Text(
                                  style: TextStyle(
                                    color: wcolor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  "Humidity"),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/img/windsock.png',
                              height: size.width * 0.1,
                            ),
                            const SizedBox(height: 15),
                            Text(
                                style: TextStyle(
                                  color: wcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                                '${data?.windDir}'),
                            const Text(
                                style: TextStyle(
                                  color: wcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                "Wind Direction"),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // out of the Box Contents

              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          "Gust"),
                      sbx,
                      Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          '${data?.gust} kp/h'),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          "UV"),
                      sbx,
                      Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          '${data?.uv}'),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          "Wind"),
                      sbx,
                      Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          '${data?.wind} kmph'),
                    ],
                  )),
                ],
              ),

              //second row
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          "Pressure"),
                      sbx,
                      Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          '${data?.pressure} hps'),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          "Precipitation"),
                      sbx,
                      Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          '${data?.precipitation} mm'),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                          "Last Update"),
                      sbx,
                      Text(
                          style: TextStyle(
                            color: wcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          '${data?.lastUpdate}'),
                    ],
                  )),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
}
