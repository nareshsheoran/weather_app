import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:weather_app/Shared/routes.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Mumbai",
      "Delhi",
      "Bhiwani",
      "Chennai",
      "Chandigarh",
      "Loharu"
    ];
    final _random = Random();
    var city = cityName[_random.nextInt(cityName.length)];
    Map data = ModalRoute.of(context).settings.arguments;

      String temp = (data["temp_Value"]).toString();
    String air = (data["air_Value"]).toString();

    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((data["temp_Value"]).toString()).substring(0, 4);
      air = ((data["air_Value"]).toString()).substring(0, 4);
    }

    String icon = data["icon_Value"].toString();
    String hum = data["hum_Value"].toString();
    String des = data["des_Value"].toString();
    String main = data["main_Value"].toString();
    String getCity = data["city_Value"].toString();
    print(temp);
    print(icon);
    print(hum);
    print(air);
    print(des);
    print(main);
    print(getCity);
    print(data);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blueAccent,
      //   ),
      // ),
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(0),
      //   child: GradientAppBar(
      //     gradient: LinearGradient(
      //         begin: Alignment.topCenter,
      //         end: Alignment.bottomCenter,
      //         colors: [
      //           Colors.blue,
      //           Colors.blue[200],
      //         ]),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.blue[800],
                  Colors.blue[300],
                ])),
            child: Column(
              children: <Widget>[
                Container(
                  //Search Container
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(' ', '') ==
                                '') {
                              print("Blank Search");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, Routes.LOADING_ACTIVITY, arguments: {
                                "searchText": searchController.text
                              });
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                              child: const Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                              ))),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city ...",
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            if (value == '') {
                              print("Please Enter Text To Search");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, Routes.HOME_ACTIVITY, arguments: {
                                "searchText": searchController.text
                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //Cloud Container
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Image.network(
                                "http://openweathermap.org/img/wn/$icon@2x.png"),
                            Column(
                              children: [
                                Text(
                                  "$des ",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "in $getCity",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //Temp Container
                        height: 270,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(4, 4, 20, 20),
                              child: Icon(
                                WeatherIcons.wiThermometer,
                                size: 40,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " $temp",
                                  style: const TextStyle(fontSize: 70),
                                ),
                                const Text(
                                  "C",
                                  style: TextStyle(fontSize: 32),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        //Humidity Container
                        height: 180,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    WeatherIcons.wiDayWindy,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "$air ",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "km/hr",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //Air Speed Container
                        height: 180,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    WeatherIcons.wiHumidity,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "$hum ",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Percent",
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Container(
                    //Name Container
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Made By Naresh"),
                        Text("Data Provided By Openweathermap.org")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
