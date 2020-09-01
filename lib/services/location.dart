import 'package:geolocator/geolocator.dart';
//location 리팩토링
class Location{

  double latitude ;
 double longitude ;


  Future<void> getCurrentLocation() async{
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.longitude;
      longitude= position.latitude;
    } catch(e){
      print(e);
    }
  }
}


//try {
//Position position = await Geolocator().getCurrentPosition(
//desiredAccuracy: LocationAccuracy.low);
//print(position);
//}
//catch(e){
//print(e);
//}