import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Shared/routes.dart';
import 'package:weather_app/Worker/worker.dart';

class LoadingActivity extends StatefulWidget {
  const LoadingActivity({Key key}) : super(key: key);

  @override
  _LoadingActivityState createState() => _LoadingActivityState();
}

class _LoadingActivityState extends State<LoadingActivity> {
  String temp;
  String humidity;
  String airSpeed;
  String description;
  String main;
  String location;
  String icon;
  String city = "Bhiwani";

  void startApp(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    airSpeed = instance.airSpeed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.HOME_ACTIVITY, arguments: {
        "temp_Value": temp,
        "hum_Value": humidity,
        "air_Value": airSpeed,
        "des_Value": description,
        "main_Value": main,
        "icon_Value": icon,
        "city_Value": city,
      });
    });
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context).settings.arguments;

    if (search?.isNotEmpty ?? false) {
      city = search["searchText"];
    } startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 50),
              Image.asset("assets/images/logo.jpg", height: 240, width: 240),
              const SizedBox(height: 16),
              const Text("Weather App",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 10),
              const Text("Made By Naresh",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              const SizedBox(height: 30),
              const SpinKitWave(
                color: Colors.white,
                size: 50,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
