import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapplicationtest/models/Movie.dart';


class ApiMovies {
  final String Url = "https://api.themoviedb.org/3";
  final String Key = "f5a8a486fb069fcb10396a7a3e49ceb4";
  final String Lang = "fr-FR";


  static bool tryGetCatalog()
  {
    return true;
  }

  Future<Map<String,dynamic>> getPopular() async{
    http.Response response;
    String completeUrl = Url + "/movie/popular?api_key=" + Key + "&language="+Lang;
    print(completeUrl);
    response = await http.get(Uri.parse(completeUrl));
    Map<String,dynamic> map = {
      "code":1,
      "body":""
    };
    if(response.statusCode==200){
      map["code"] = 0;
      map["body"] = jsonDecode(response.body);
    }else{
      map["code"] = 1;
      map["body"] = "error etc.";
    }
    return map;
  }



}