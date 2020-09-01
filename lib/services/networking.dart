import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);

final String url;

Future getDate() async{
  http.Response response = await http.get(url);//Response클래스입니다. 클래스명은 response입니다.

  if(response.statusCode == 200){
    String data = response.body;

    return jsonDecode(data);
  }else{
    print(response.statusCode);
  }
}
}