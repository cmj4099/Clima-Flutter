import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens//location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() {
    return _LoadingScreenState();
  }
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    var weatherData = await WeatherModel().getLocationWeather();


    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
          locationWeather:weatherData
      );
  }));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      )
    );
//앱이 실행되는 즉시 만들어야함
  }
}
