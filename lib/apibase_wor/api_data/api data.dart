
// to retrive the data
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modals/nsaa api modal.dart';
class apidatamodal{

  Future<nasaapimodal> getdata() async{

     final response = await http.get(Uri.parse('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000'
         '&api_key=6HuemNSqcRl56UAAq1XgdZtCcGoRfxCVbyiuDWre'));
     var data = jsonDecode(response.body.toString());
     if(response.statusCode==200){

       return nasaapimodal.fromJson(data);
     }
     else{
       return throw Exception('no data');
     }

  }
}