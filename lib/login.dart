import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:projectw/help/botton.dart';
import 'package:projectw/help/filed.dart';
import 'dart:convert';
//import 'package:awesome_dialog/awesome_dialog.dart';  awesome_dialog: ^3.1.0



import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';


import 'package:http/http.dart' as http;
import 'package:projectw/homepage.dart';
import 'package:projectw/main.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>with SingleTickerProviderStateMixin {
  final TextEditingController _ph=new TextEditingController();
final TextEditingController _pa=new TextEditingController();
AnimationController ?animationController;
Animation ?fadinganimations;
bool eyes=true;
showeyes(){
  setState(() {
    eyes=!eyes;
  });
}

@override
  void initState() {

    // TODO: implement initState
    super.initState();
    
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 600));
    fadinganimations=Tween<double>(begin:0.2,end: 1).animate(animationController!)..addListener(() {  setState(() {
       animationController?.repeat();
      });
      });
   
    animationController?.forward();}
       login()async{
      final response =await http.post(Uri.https('testpharma-project.000webhostapp.com','/api/owner/login'),body: {

        "phone":_ph.text,
        "password":_pa.text
      });
      final data=jsonDecode(response.body);
     
          



     

       if (response.statusCode == 200){
       
          var apiToken = data['data']['token']; 
                 //  print("???????????????????????????");

                   print(apiToken);
                 //  await storage?.write(key:'token',value:'$apiToken');
                   await shardpre!.setString('token',apiToken);

                //  print("2222222222222222222222222");
               //   print(await storage?.read(key:'token'));
              
                       Get.off(HomePage());
          ;}

            
       
         else if (response.statusCode == 422){
        /* Get.defaultDialog
              (buttonColor: Colors.green.shade700,
              textConfirm: "OK",onConfirm: () => 
                Navigator.pop(context),confirmTextColor:Colors.white ,
        
              
                  middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    title:'Error',middleText: 'Please enter the faileds' ,
                    titleStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold));*/
                   
          AwesomeDialog(width: MediaQuery.of(context).size.width/3,
              context: context,
               dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'Please enter the faileds',
            btnOkOnPress: () {},
            )..show();
       }
           else if (response.statusCode == 401){
          /*   Get.defaultDialog
              (buttonColor: Colors.green.shade700,
              textConfirm: "OK",onConfirm: () => 
                Navigator.pop(context),confirmTextColor:Colors.white ,
        
              
                  middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                    title:'Error',middleText: 'phone or password is incorrect !!!' ,
                    titleStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold));*/
                
                
            AwesomeDialog(width: MediaQuery.of(context).size.width/3,
             context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'phone or password is incorrect !!!',
            btnOkOnPress: () {},
            ).show();
           
      
           }
                   
                  
                  
    }
bool laoding=false;

    
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:laoding,
      child:Scaffold(backgroundColor: Colors.grey.shade200,
      body: 
      //SingleChildScrollView(child:
      // Container(height: MediaQuery.of(context).size.height,
                                                   // width:MediaQuery.of(context).size.width ,
                                                  // decoration: BoxDecoration(
                                                   // color: Colors.green.shade200
                                                      ///gradient: LinearGradient(
                                                     
                                                     // colors: [Color.fromARGB(255, 28, 108, 30),Color.fromARGB(255, 222, 209, 89),Color.fromARGB(255, 37, 180, 42)])
                                                   // ),
         // child:
           Stack(clipBehavior: Clip.none,

             children: [
              Positioned(left: 800,
                child: Image.asset('lib/images/logo1.jpg',width:MediaQuery.of(context).size.width/2,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,)),
               Container(margin: EdgeInsets.only(left: 150,top: 120,bottom: 80,right: 80),
                 child: Column(children: [SizedBox(height: 100,),
                 Positioned(top: 170,left: 400,
                 
                    
                            child:  Text('Wellcome In Medica Store',style: TextStyle(
                         color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),),
                         SizedBox(height: 10,),
                         Container(width:500,height:350,decoration:
                 BoxDecoration(color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
                 ),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [SizedBox(width: 95,),
                      Text('login to your account',
                      style: TextStyle(fontSize: 20,color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                 
                  SizedBox(height: 20,),
                  Container(width: 250,child: filed(th:" user phone ",icon: Icon(Icons.phone),controll:_ph,osb:false,vaild:(Value) {
                       if(Value!.isNotEmpty&&(!Value.startsWith("09")||Value.length!=10)){
                              return "The number is invalid ";}
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                   Container(width: 250,child: 
                   filed(th: " password ",icon: Icon(Icons.lock),osb: eyes,
                       sufix: IconButton(color: Colors.green[700],
                        icon:eyes
                        
                       ? Icon(Icons.visibility_off,size: 20,) 
                       :Icon(Icons.visibility,size: 20,), onPressed: () {showeyes() ; },),
                      controll:_pa,vaild: (Value) {
                    
                      },),
                  ),
                 SizedBox(height: 20,),
                     botton(tb: " login   ", tap:  ()async {
                            
                         
                         
                                         if(_pa.text.isEmpty||_ph.text.isEmpty){
                       /*     
                             Get.defaultDialog
                                       (buttonColor: Colors.green.shade700,
                                       textConfirm: "OK",onConfirm: () => 
                                         Navigator.pop(context),confirmTextColor:Colors.white ,
                                 
                                       
                            middleTextStyle: TextStyle(fontWeight: FontWeight.bold),
                              title:'Error',middleText: 'Please enter the faileds' ,
                              titleStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold));*/
                                         
                             
                         
                                    AwesomeDialog(width: MediaQuery.of(context).size.width/3,
                                     context: context,
                                     dialogType: DialogType.error,
                                     animType: AnimType.rightSlide,
                                     title: 'Erore',
                                     desc: 'Please enter the faileds',
                                    
                                     btnOkOnPress: () {},
                                     )..show();
                                
                                         }
                           else if (!_ph.text.startsWith("09")||_ph.text.length!=10){
                                }
                                
                                         else{
                              laoding =true;
                              setState( () {});
                              await  login();
                                laoding =false;
                              setState(() {

                                
                              });
                                         }
                                       
                                      
                                       }),
                 
             
                
                 ],),
                 )
                         ] ),
               ),
             ],
           )
         // ,)
         // ,)
     ) );
  }
}