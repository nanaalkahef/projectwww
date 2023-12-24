
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projectw/getcar.dart';
import 'package:projectw/main.dart';
import 'package:projectw/prodect.dart';
import 'package:projectw/shoowproduct.dart';



class CategorySearch extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[ IconButton(onPressed:(){
      query="";
    }, icon:Icon(Icons.clear)) ,
   
    
     ] ;
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back,color: Colors.green[700],size: 30,weight: 30,));
  }



  @override
  Widget buildSuggestions(BuildContext context) {
   var to= shardpre!.getString('token');
  if(query==""){
    return
    
    Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Search Category",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.green.shade700),),
        SizedBox(height: 20,),
      //  Image.asset('lib/images/wibe.jpg',width: 300,height: 300,),

       // Text("Pleas search heer about your product" ,style: TextStyle(color: Colors.green[700],fontSize:20),)
      ],
    ));}
    else{
       return FutureBuilder<dynamic>(
            future: getallgagecore().getallcater(token:to),
             builder:(context, snapshot) {
             // print("///////////////////////////////////");
             // print(snapshot.data);
           if(snapshot.hasData){
              List<Category>p=snapshot.data!;
      
            List fl=p.where((element) {
              return element.name.toString().startsWith(query[0].toLowerCase())||element.name.toString().startsWith(query[0].toUpperCase());
            }).toList();
         //   fl=p.where((element) {
           //   return element.scientificName.toString().startsWith(query);
         //   }).toList();
          
         
            print("////////////////////////////////////////");
        
           return ListView
            
            
            .builder(
          
           itemCount: fl.length,
           itemBuilder: (context, index) =>InkWell(
            onTap: () {
            
                        Get.to( ShowProduct(id: fl[index].id as int,namecate:fl[index].name.toString(),)
                         );
             
            },
           
              child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 190,vertical: 10),
            height: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
             Container(height: 110,
              width:  510,
              margin: EdgeInsets.only(left:25,right: 0,top: 19,bottom: 0),
        
                child: Image.network(fl[index].photo.toString(),
                height: 20,width:20,),),
              
              Container(width: 1200,height:160,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(fl[index].name.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize:27,
                color: Colors.black),),
                  ],),
            )
              
           
            ]
            ),
        )
          
       );
 
       

          }
        
    
         
         else{
        return  Center(child: CircularProgressIndicator(),);
       
       }
       
         }
       );

    }

}

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
     var to= shardpre!.getString('token');
  if(query==""){
    return
    
    Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Search Category",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.green.shade700),),
        SizedBox(height: 20,),
        Image.asset('lib/images/wibe.jpg',width: 300,height: 300,),

      //  Text("Pleas search heer about your product" ,style: TextStyle(color: Colors.green[700],fontSize:20),)
      ],
    ));}
    else{
       return FutureBuilder<dynamic>(
            future: getallgagecore().getallcater(token:to),
             builder:(context, snapshot) {
             // print("///////////////////////////////////");
             // print(snapshot.data);
           if(snapshot.hasData){
              List<Category>p=snapshot.data!;
      
            List fl=p.where((element) {
              return element.name.toString().startsWith(query.toLowerCase())||element.name.toString().startsWith(query.toUpperCase());
            }).toList();
         //   fl=p.where((element) {
           //   return element.scientificName.toString().startsWith(query);
         //   }).toList();
          
         
            print("////////////////////////////////////////");
        
           return ListView
            
            
            .builder(
          
           itemCount: fl.length,
           itemBuilder: (context, index) =>InkWell(
            onTap: () {
            
                        Get.to( ShowProduct(id: fl[index].id as int,namecate:fl[index].name.toString(),)
                         );
             
            },
           
              child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 190,vertical: 10),
            height: 130,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
             Container(height: 110,
              width:  510,
              margin: EdgeInsets.only(left:25,right: 0,top: 19,bottom: 0),
        
                child: Image.network(fl[index].photo.toString(),
                height: 20,width:20,),),
              
              Container(width: 1200,height:160,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(fl[index].name.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize:27,
                color: Colors.black),),
                  ],),
            )
              
           
            ]
            ),
        )
          
       );
 
       

          }
        
    
         
         else{
        return  Center(child: CircularProgressIndicator(),);
       
       }
       
         }
       );

    }


  }
  }