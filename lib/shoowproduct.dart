import 'dart:convert';


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:projectw/description.dart';

import 'package:projectw/getcar.dart';

import 'package:projectw/main.dart';
import 'package:projectw/prodect.dart';

import 'package:projectw/searchproduct.dart';
import 'package:projectw/side_bar_menu.dart';

import 'package:http/http.dart' as http;



//import 'package:flutter/widgets.dart';




class ShowProduct extends StatefulWidget {
  final int id;

  String namecate;

  ShowProduct({super.key, required this.id, required this.namecate});

  @override
  State<ShowProduct> createState() => _ShowProductState(id: id, namecate: namecate);
}

class _ShowProductState extends State<ShowProduct> {
     var to= shardpre!.getString('token');
     final int id;

     String namecate;
     
  _ShowProductState({ required this.id, required this.namecate});


       delete({required var to,required var id})async{
      final response =await http.post(Uri.https('testpharma-project.000webhostapp.com','/api/medicine/delete/$id'),
       headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $to'}

  );
      final data=jsonDecode(response.body);
       if (response.statusCode == 200){
               AwesomeDialog(width: MediaQuery.of(context).size.width/3,
              context: context,
               dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Successfully',
            desc: 'medicine deleted successfuly',
            btnOkOnPress: () {},
            )..show();
       }
       else{
          AwesomeDialog(width: MediaQuery.of(context).size.width/3,
              context: context,
               dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'there is problem in delete',
            btnOkOnPress: () {},
            ).show();
       }
       
       
       }
bool laoding=false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:laoding,
      child:
    Scaffold(
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //side menu
      Expanded(
        child: SideBar(),
      ),

      //main body

      Expanded(
        flex: 4,
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(30)),
          child: Row(children: [
            Expanded(
                flex: 2,

                //column1 tow container
                child: Column(
                  children: [
                    //////////////////To Make Search//////////////////////////////////////
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(30)),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Stack(children: [
                                    TextFormField(
                                      onTap: () {
                                        showSearch(
                                            context: context,
                                            delegate:DataSearch ());
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.search,
                                            color: Colors.green.shade200),
                                        hintText: "search medicine ...",
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),

                    //////////To Make Categories///////////////////////////////////////
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(30),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(30)),
                          child: FutureBuilder<dynamic>(
                              future: getallgagecore().getallcater(
                                  token:
                                      to),
                              builder: (context, snapshot) {
                                print("///////////////////////////////////");
                                print(snapshot.data);
                                if (snapshot.hasData) {
                                  List<Category> p = snapshot.data!;
                                  return GridView.builder(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      itemCount: p.length,
                                      clipBehavior: Clip.none,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 1.5,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                             builder: ((context) =>ShowProduct(id: p[index].id as int,namecate:p[index].name.toString()))));
                                              //Get.to(ShowProduct(id: p[index].id as int,namecate:p[index].name.toString()));
                                            },
                                            child: Container(
                                                width: 50,
                                                height: 50,
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      p[index].photo.toString(),
                                                      height: 100,
                                                      width: 100,
                                                    ),
                                                    Text(p[index]
                                                        .name
                                                        .toString())
                                                  ],
                                                )),
                                          ));
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                      ),
                    ),
                  ],
                )),

            //////////To Show Product////////////////////////////////////////////////////
            ///
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 190,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      FutureBuilder<dynamic>(
                        future: getallgagecore().getgagecore(
                            coryname:id,
                            token:
                                to),
                        builder: (context, snapshot) {
                          // print("///////////////////////////////////");
                          // print(snapshot.data);
                          if (snapshot.hasData) {
                            List<Data> p = snapshot.data!;
                            return ListView.builder(
                                itemCount: p.length,
                                itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Get.off(Description(
                                          p: p[index],
                                          category:
                                              p[index].categoryName.toString(),
                                        ));
                                      },
                                      child: Stack(children: [
                                        Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 20),
                                            height: 166,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(0, 25),
                                                    blurRadius: 25,
                                                    color: Colors.black12,
                                                  )
                                                ])),
                                        Container(
                                          height: 150,
                                          width: 175,
                                          margin: EdgeInsets.only(
                                              left: 35,
                                              right: 0,
                                              top: 25,
                                              bottom: 10),
                                          child: Image.network(
                                            p[index].image.toString(),
                                            height: 5,
                                            width: 5,
                                          ),
                                        ),
                                        Container(
                                          width: 480,
                                          height: 130,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                          Text(
                                                  p[index]
                                                      .commercialName
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                p[index]
                                                    .categoryName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                             
                                                  Text(
                                                    "price ${p[index].price}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.green[700]),
                                                
                                              )
                                            ],
                                          ),
                                        ),
                                      Positioned(top: 130,left: 450,
                                        child:
                                    IconButton(onPressed: (){
                                AwesomeDialog(width: MediaQuery.of(context).size.width/3,
                                     context: context,
                                     dialogType: DialogType.info,
                                     animType: AnimType.rightSlide,
                                     title: 'Delete',
                                     desc: 'Do you really want to delete?',
                                    btnCancelOnPress:() {},
                                     btnOkOnPress: () 
                                      async {
                               laoding =true;
                              setState( () {});
                              await  delete(to:to, id: p[index].id);
                                laoding =false;
                              setState(() {

                                
                              });
                                     },
                                     )..show();
                                                 


                                                  }, icon: Icon(Icons.delete_forever),color: Colors.red,),)
                                      ]),
                                    ));
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ))
          ]),
        ),
      ),
    ]))));
  }
}
