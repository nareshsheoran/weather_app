import 'dart:convert';
import 'package:http/http.dart';

class Worker {
   String temp;
   String humidity;
   String airSpeed;
   String description;
   String main;
   String location;
   String icon;

  Worker({ this.location}) {
    location = this.location;
  }

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$location&appid=8f60f6dd9fd3935420024ccc97347f7c"));
      Map data = jsonDecode(response.body);

      //Getting Temp,humidity
      Map tempData = data["main"];
      String getHumidity = tempData["humidity"].toString();
      double getTemp = tempData["temp"] - 273.15;

      //Air Speed
      Map wind = data["wind"];
      double getAirSpeed = wind["speed"] / 0.27777777777778;

      //Getting Desc.
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getMainDes = weatherMainData['main'];
      String getDes = weatherMainData['description'];


      //Assigning Value
      temp = getTemp.toString(); //C
      humidity = getHumidity; //%
      airSpeed = getAirSpeed.toString(); //km/hr
      description = getDes.toString();
      main = getMainDes.toString();
      icon = weatherMainData["icon"].toString();

    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airSpeed = "NA";
      description = "Error Occurred!";
      main = "NA";
      icon = "09d";
    }
  }
}
