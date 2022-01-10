import 'package:weather_app/Activity/home_activity.dart';
import 'package:weather_app/Activity/loading_activity.dart';

class Routes{
  static const String HOME_ACTIVITY = "/homeActivity";
  static const String LOADING_ACTIVITY = "/loadingActivity";
}

final routes ={
  Routes.HOME_ACTIVITY: (context) =>  HomeActivity(),
  Routes.LOADING_ACTIVITY: (context) => LoadingActivity(),
};