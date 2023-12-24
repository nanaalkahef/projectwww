import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectw/addProduct.dart';
import 'package:projectw/history.dart';
import 'package:projectw/homepage.dart';
import 'package:projectw/login.dart';
import 'package:projectw/main.dart';


class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.green.shade500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Image.asset("lib/images/pharma.jpg")),
            DrawerList(
                title: "DashBoard",
                press: () {
                  Get.to(HomePage());
                }),
            DrawerList(title: "AddProduct", press: () {
              Get.to(addprodect());
            }),
            DrawerList(
                title: "History",
                press: () {
                  Get.to(History());
                }),
            DrawerList(title: "Reports", press: () {}),
            DrawerList(title: "Logout", press: () {  
             

                                     AwesomeDialog(width: MediaQuery.of(context).size.width/3,
                                     context: context,
                                     dialogType: DialogType.info,
                                     animType: AnimType.rightSlide,
                                     title: 'Logout',
                                     desc: 'Do you really want to sign out?',
                                    btnCancelOnPress:() {},
                                     btnOkOnPress: () 
                                      async {
                                     await  shardpre!.clear();
                                        Get.off(Login());
                                     },
                                     )..show();

            })
          ],
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const DrawerList({super.key, required this.title, required this.press});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: Image.asset(name),
      title: Text(
        title,strutStyle: StrutStyle(fontSize:25,fontWeight: FontWeight.bold),
        style: TextStyle(color: Colors.white),
      ),
      onTap: press,
    );
  }
}
