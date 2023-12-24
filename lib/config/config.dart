

 import 'dart:html';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

 GetIt config = GetIt.instance;

 setup()async{
 config.registerSingleton( await new FlutterSecureStorage());
 }