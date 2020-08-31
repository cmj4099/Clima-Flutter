import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    getDate();
  }



  void getLocation() async{
   Location location = Location();
   await location.getCurrentLocation();
   print(location.longitude);
   print(location.latitude);

  }


  void getDate()async{//비동기화 시켜야함

    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02');
    print(response.statusCode);

    if(response.statusCode == 200 ){
      String data = response.body;

      var decodeDate = jsonDecode(data);
      var temperature = decodeDate['main']['temp'];
      var condition = decodeDate['weather'][0]['id'];
      var cityName = decodeDate['name'];

      
    }else{
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold();
//앱이 실행되는 즉시 만들어야함
  }

}
