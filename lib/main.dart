

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:projectw/homepage.dart';
import 'package:projectw/login.dart';


import 'package:shared_preferences/shared_preferences.dart';


//SharedPreferences? shardpre;
//String? too;
//final storage =new FlutterSecureStorage();
var to;
SharedPreferences? shardpre;
void main() async{
WidgetsFlutterBinding.ensureInitialized();
shardpre=await SharedPreferences.getInstance();
to=shardpre!.getString('token');
  runApp(const MyApp());
}
// ! Flutter Secure Storage

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
       return GetMaterialApp (
      debugShowCheckedModeBanner: false,

      home: to == null ?  Login() : HomePage(),

   //    getPages: [
   //    GetPage(name: "/hh", page: () => HomePage(),),
     // GetPage(name: "/o", page: () => one(),), 
  //     GetPage(name: "/l", page: () => Login()),
  // ],
    );}}