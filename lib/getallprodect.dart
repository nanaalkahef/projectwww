
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:projectw/prodect.dart';
class getallpro{

getpro({required var token})async{

 final response =await http.get(Uri.https('testpharma-project.000webhostapp.com','/api/medicine/'),
 headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $token'});
  
if(response.statusCode==200){

var data=jsonDecode(response.body);
print(data);
  var s=  data["data"];
   print(s);
 List<Data> p=[];
 for(int i=0;i<s.length;i++){
 p.add(Data.fromJson(s[i]) );

}

return p;}

else{
  throw Exception('there is problem in ${response.statusCode}');
}


}






       }

 
