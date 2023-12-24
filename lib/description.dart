import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:projectw/homepage.dart';
import 'package:projectw/prodect.dart';

class Description extends StatelessWidget {
  final Data p;
  String category;
  Description({super.key, required this.p, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade700,
          elevation: 0,
          title: Text(
            'Description',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: (() {
                //Navigator.of(context).pop();
                Get.to(HomePage());
              }),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: Container(
                      width: 300,
                      height: 300,
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
                                        blurRadius: 3,
                                        spreadRadius: 5)
                                  ],
                                  shape: BoxShape.circle),
                            ),
                            Image.network(
                              p.image.toString(),
                              height: 200,
                              width: 200,
                              // height: MediaQuery.of(context).size.height * 0.3,
                              // width: MediaQuery.of(context).size.width * 0.3,
                              // fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ))),
            )),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(50),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Scientifice Name :     ${p.scientificName}",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Comercial Name :  ${p.commercialName} ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "The Manufacture Company : ${p.manufactureCompany}  ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Quantity Available :  ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Price  :   ${p.price} ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Expiry Date  :    ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        )));
  }
}
