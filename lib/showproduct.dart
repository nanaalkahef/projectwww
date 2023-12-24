/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:store/description.dart';

class ShowProduct extends StatelessWidget {
  static String id = 'HomePage';
  const ShowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade700,
          elevation: 0,
          title: Text(
            'Medicine',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
            child: GridView.builder(
                itemCount: 1,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 100,
                    mainAxisSpacing: 100),
                itemBuilder: (context, index) {
                  return CustomCard();
                })));
  }
}

class CustomCard extends StatefulWidget {
  CustomCard({
    super.key,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Description()));
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 50,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: Offset(10, 10))
          ]),
          child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Panadol",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    SizedBox(height: 3),
                    Text("Headache",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 16)),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("1000", style: TextStyle(fontSize: 16)),
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
            right: 32,
            top: -60,
            child: Image.asset(
              "lib/images/logo.jpg",
              height: 200,
              width: 200,
            ))
      ]),
    );
  }
}*/
