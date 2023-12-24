
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'dart:convert';
import 'package:file_picker/file_picker.dart';


//import 'package:flutter/widgets.dart';

import 'package:awesome_dialog/awesome_dialog.dart';


import 'package:http/http.dart' as http;

import 'package:projectw/main.dart';

import 'package:projectw/side_bar_menu.dart';




class addprodect extends StatefulWidget {
  const addprodect({super.key});

  @override
  State<addprodect> createState() => addprodectState();
}

class addprodectState extends State<addprodect>with SingleTickerProviderStateMixin {
  //Uint8List? selectedImageInBytes;
  //String? dropdownvalue;
    List<int>?selectedImage;
   //QuerySnapshot qs;
   var value;
   /* final PickedFile= ImagePicker();

    uploadImage()async{
      var pickImage=await PickedFile() 
    }*/


  final TextEditingController _c=new TextEditingController();
  
  final TextEditingController _s=new TextEditingController();
  
  final TextEditingController _pr=new TextEditingController();
  
  final TextEditingController _m=new TextEditingController();
  
  final TextEditingController _q=new TextEditingController();
  final TextEditingController _e=new TextEditingController();
  

  



Future<http.StreamedResponse> add_new_order(data,selectedImage ) async {
    
    var request =http.MultipartRequest("POST", Uri.https("testpharma-project.000webhostapp.com","/api/medicine/store"));
    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    var file = await http. MultipartFile.fromBytes(
    
    _c.text ,selectedImage
    );
    print(file.length);
    request.files.add(file);
    request.headers['Authorization'] = 'Bearer ${data['to']}';
    request.fields['commercial_name'] =data['commercial_name'];
    request.fields['scientific_name'] = data['scientific_name'];
    request.fields['manufacture_company'] =data['manufacture_company'] ;
    request.fields['quantity'] =data['quantity'] ;
    request.fields['category_id'] = data['category_id'];
    request.fields['expiration_date'] =data['expiration_date'];
    request.fields['price']=data['data'];

    var response = await request.send();
    var responseData = await response.stream.bytesToString();
    print(responseData);
   
         if (response.statusCode == 200){
       AwesomeDialog(width: MediaQuery.of(context).size.width/3,
              context: context,
               dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Successfully',
            desc: 'medicine stored successfuly',
            btnOkOnPress: () {},
            )..show();
       }
       else{
       AwesomeDialog(width: MediaQuery.of(context).size.width/3,
              context: context,
               dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'there is problem in store',
            btnOkOnPress: () {},
            ).show();
       }

     return response;





  }
  





 
  
  bool laoding=false;



   var to= shardpre!.getString('token');
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:laoding,
      child:
    Scaffold(body:SafeArea(
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //side menu
            Expanded(
              child:SideBar(),
              )

            //main body 
            ,Expanded(
              flex: 4,
              child:Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(30),
          
        ),
        child: ListView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* CircleAvatar( backgroundImage:selectedImage==null ? null:FileImage(selectedImage!) ,
                                    radius: 150,backgroundColor: Colors.white,),

                  GestureDetector(onTap:() 
                              {pickImage();}
                             ,child: Icon(Icons.camera),),*/
                                                

                              
                Center(
                
                    child: Container(
                        
                        width: 250,
                        height: 250,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                             
                              Container(
                                
                                width: MediaQuery.of(context).size.width * 0.80,
                                height: MediaQuery.of(context).size.height * 0.80,
                                decoration: BoxDecoration(
                              
                                color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius:3 ,
                                          spreadRadius: 5)
                                    ],
                                    shape: BoxShape.circle),
                                    child: CircleAvatar(// child: Image.memory(bytes), objFile
                                    //backgroundImage:selectedImage==null ? null : Image.memory(selectedImage).image ,
                                    backgroundImage:selectedImage==null ? null : Image.memory(Uint8List.fromList( selectedImage!)).image ,
                                    radius: 150,backgroundColor: Colors.white,),
                              ),
                             /* Image.asset(
                                "lib/images/img_fever.png",
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.3,
                                fit: BoxFit.contain,
                              ),*/
                            // GestureDetector(onTap:() async{await pickImage();}
                             // async{
                              //  final image = await ImagePickerWeb.getImageAsBytes();
                              //  }
                           //  ,child:
                             // Icon(Icons.add),
                           //  ),
                             
                    
                            // Image.file(selectedImage)
                           // selectedImage!= null ? Image.file(selectedImage!): 
                            //  Text("")
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 25,),

                   GestureDetector(onTap:() async{//await pickImage()
                  await pickImage();}
                             
                             ,child:Container(
                              width: 180,
                              height: 50,
                              child: Row(children: [Icon(Icons.camera),Text("Please Select An Image")],),
                             decoration:BoxDecoration(color: Colors.green.shade100,borderRadius: BorderRadius.circular(30),)
                             )
                             
                             ),

                  SizedBox(height: 20,),


                Container(
                  width: 350,
                
                 
                  child: TextField(controller: _s,
                    decoration: InputDecoration(
                    labelText: "Scientafic Name",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
                    
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ),
                  
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                
                 
                  child: TextField(controller: _c,
                    decoration: InputDecoration(
                    labelText: "Comercial Name",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ),
                  
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                
                 
                  child: DropdownButtonFormField(
                  value: value,
                    icon: const Icon(Icons.arrow_downward),
                    decoration: InputDecoration(
                    labelText: "Classification",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ), items:[DropdownMenuItem(child: Text("selected category",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),value: "-1",),
                           DropdownMenuItem(child: Text("Antibiotics"),value: "3",onTap: () {
                             
                           },),
                           DropdownMenuItem(child: Text("Cough"),value: "4",onTap: (){},),
                            DropdownMenuItem(child: Text("Fever"),value: "5",),
                            DropdownMenuItem(child: Text("Digestive"),value: "1",),
                             DropdownMenuItem(child: Text("Skin"),value: "2",),
                              DropdownMenuItem(child: Text("Vitamins"),value: "6",),
                            
                             ]
                  , onChanged: (Object ?newvalue) { setState(() {
                          value = newvalue ;
                  }); },
                  
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                
                 
                  child: TextField(controller: _m,
                    decoration: InputDecoration(
                    labelText: "The Manufacture Company",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ),
                  
                  ),
                  
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                
                 
                  child: TextField(controller: _q,
                    decoration: InputDecoration(
                    labelText: "Quantity Available",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ),
                  
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                  child: TextField(controller: _pr,
                    decoration: InputDecoration(
                    labelText: "Price",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ),
                  
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 350,
                
                 
                  child: TextField(controller: _e,
                    decoration: InputDecoration(
                    labelText: "Expiry Date",
                    labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),
                    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
   focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide( color: Colors.green.shade700,)),
                   // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:BorderSide(color: Colors.green.shade700 ))
                  ),
                  
                  ),
                ),
                SizedBox(height: 30,),

                GestureDetector(onTap: () async{
                
                              laoding =true;
                              setState( () {});
                                  var data = {
                                    "to":to,
                    "commercial_name":_c.text,
                    "scientific_name":_s.text,
                "manufacture_company":_m.text,
                  "quantity":_q.text,
                "price":_pr.text,
              "category_id": value ,
                  "expiration_date":_e.text,
       
      };
                         await add_new_order(data,selectedImage);
                                laoding =false;
                              setState(() {

                                
                              });


                }, child: Container(alignment: Alignment.center,width: 250,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
              // gradient: LinearGradient(colors: [Color.fromARGB(255, 28, 108, 30),const Color.fromARGB(255, 220, 207, 88),const Color.fromARGB(255, 30, 108, 32)])
                   color: Colors.green.shade700
                   ),
                   child: Padding(padding: EdgeInsets.all(12),child: Text(
                    'Add Product',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                   ),
                   )
              ],),
          ],
        ),), )

        ],) ),
    /* Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(30),
        ),),*/
     ) );
  }




  Future <void> pickImage()async {

   FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  setState(() {
    
   selectedImage= result.files.single.bytes;
  });
} else {
  // User canceled the picker
}}
}