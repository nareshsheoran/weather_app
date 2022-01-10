import 'package:flutter/material.dart';
import 'package:weather_app/Activity/loading_activity.dart';
import 'Shared/routes.dart';


void main() {
  runApp( MaterialApp(
    home: const LoadingActivity(),
    routes: routes,
    debugShowCheckedModeBanner: false,
  ));
}
