import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:projectw/getcar.dart';
import 'package:projectw/main.dart';
import 'package:projectw/prodect.dart';

import 'package:projectw/searchproduct.dart';
import 'package:projectw/shoowproduct.dart';


class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  

    var to= shardpre!.getString('token');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //side menu
      /* Expanded(
        child: SideBar(),
      ),*/

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
                                   showSearch(context: context, delegate: DataSearch());

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
                          child:  FutureBuilder<dynamic>(
                                        future: getallgagecore().getallcater(token:to
                                        ),
                                         builder:(context, snapshot) {
                                          print("1111111111111");
                                          print(to);
                                          print(snapshot.data);
                                       if(snapshot.hasData){
                                          List<Category>p=snapshot.data!;
                                        return 
                          GridView.builder(
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
                              itemBuilder:(context, index) => 
                                InkWell(
                                  onTap: (){Get.to(ShowProduct( id:p[index].id as int,namecate:p[index].name.toString()));},
                                  child: Container(
                                      width: 50,
                                      height: 50,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            p[index].photo.toString(),
                                            height: 100,width: 100,
                                          ),
                                          Text(p[index].name.toString())
                                        ],
                                      )),
                                ));
                              
                               }
                                          else{
                                      return  Center(child: CircularProgressIndicator(),);
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
             /* child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 190,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
                  FutureBuilder<dynamic>(
        future: getallgagecore().getgagecore(coryname:,token:"10|c5PRehewHrJZjpxo13I02wdzMljrivk387az0ua954705e0f"),
           builder:(context, snapshot) {
           // print("///////////////////////////////////");
           // print(snapshot.data);
          if(snapshot.hasData){
            List<Medicines>p=snapshot.data!;
                  ListView.builder(
                      itemCount: p.length,
                      itemBuilder: (context, index) => 
                         InkWell( onTap: () {
                           
                         },

                          child: Container(
                              alignment: Alignment.center,
                              height: 116,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 25),
                                      blurRadius: 25,
                                      color: Colors.black12,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  //To Add image
                                  Container(
                                    height: 90,
                                    width: 90,
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                        p[index].image.toString()),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 13),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                        // To add Title
                                        Text(
                                        p[index].commercialName.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade900),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
          
          ));
                            
                             }
         else{
        return  Center(child: CircularProgressIndicator(),);
       }}
       ,)

                ],
              ),*/
            ))
          ]),
        ),
      ),
    ])));
  }
}
