
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:projectw/description.dart';
import 'package:projectw/getallprodect.dart';
import 'package:projectw/main.dart';
import 'package:projectw/prodect.dart';
import 'package:projectw/searchcate.dart';

class DataSearch extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[ IconButton(onPressed:(){
      query="";
    }, icon:Icon(Icons.clear)) ,
    IconButton(onPressed:(){
       showSearch(context: context, delegate: CategorySearch());
      

    }, icon:Icon(Icons.search_sharp))
    
     ] ;
    
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back,color: Colors.green[700],size: 30,weight: 30,));
  }

  @override
  Widget buildResults(BuildContext context) {
        var to= shardpre!.getString('token');
  if(query==""){
    return
    
    Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: [ Text("Search Mediciens",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.green.shade700),),
        SizedBox(height: 20,),
        //Image.asset('lib/images/wibe.jpg',width: 300,height: 300,),

      //  Text("Pleas search heer about your product" ,style: TextStyle(color: Colors.green[700],fontSize:20),)
      ],
    ));}
    else{
       return
   FutureBuilder<dynamic>(
        future: getallpro().getpro(token:to),
         builder:(context, snapshot) {
           // print("///////////////////////////////////");
           // print(snapshot.data);
           
          if(snapshot.hasData){
          List<Data>p=snapshot.data! ;
      
            List fl=p.where((element) {
              return element.commercialName.toString().startsWith(query.toLowerCase())|| 
              element.categoryName.toString().startsWith(query.toLowerCase())||
              element.commercialName.toString().startsWith(query.toUpperCase())|| 
              element.categoryName.toString().startsWith(query.toUpperCase());
            }).toList();
         //   fl=p.where((element) {
           //   return element.scientificName.toString().startsWith(query);
         //   }).toList();
          
         
            print("////////////////////////////////////////");
        
          return ListView.builder(
         itemCount: fl.length,
         itemBuilder: (context, index) =>  InkWell(
          onTap: () {
      
            Get.off(Description(p: fl[index],category: fl[index].categoryId.toString(),));
          },
          child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 190,vertical: 20),
            height: 166,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
             Container(height: 150,
              width:  575,
              margin: EdgeInsets.only(left:35,right: 0,top: 25,bottom: 10),
        
                child: Image.network(fl[index].image.toString(),
                height: 20,width:20,),),
              
              Container(height:160,width: 1200,
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(fl[index].commercialName.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize:25,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text(fl[index].categoryName.toString(),style: TextStyle(fontSize: 19,color: Colors.grey,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                 Text("price ${fl[index].price}",
                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),)
              
            
            
            
            
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
  Widget buildSuggestions(BuildContext context) {
        var to= shardpre!.getString('token');
  if(query==""){
    return
    
    Center(child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("Search Mediciens",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.green.shade700),),
        SizedBox(height: 20,),
        //Image.asset('lib/images/wibe.jpg',width: 300,height: 300,),

      //  Text("Pleas search heer about your product" ,style: TextStyle(color: Colors.green[700],fontSize:20),)
      ],
    ));}
    else{
       return
   FutureBuilder<dynamic>(
        future: getallpro().getpro(token: to),
         builder:(context, snapshot) {
           // print("///////////////////////////////////");
           // print(snapshot.data);
           
          if(snapshot.hasData){
          List<Data>p=snapshot.data! ;
      
            List fl=p.where((element) {
              return element.commercialName.toString().startsWith(query.toLowerCase())|| 
              element.categoryName.toString().startsWith(query.toLowerCase())||
              element.commercialName.toString().startsWith(query.toUpperCase())|| 
              element.categoryName.toString().startsWith(query.toUpperCase());
            }).toList();
         //   fl=p.where((element) {
           //   return element.scientificName.toString().startsWith(query);
         //   }).toList();
          
         
            print("////////////////////////////////////////");
        
          return ListView.builder(
         itemCount: fl.length,
         itemBuilder: (context, index) =>  InkWell(
          onTap: () {
      
            Get.off(Description(p: fl[index],category: fl[index].categoryId.toString(),));
          },
          child: Stack(
            children: [Container(margin: EdgeInsets.symmetric(horizontal: 190,vertical: 20),
            height: 166,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color:Colors.white,boxShadow: [BoxShadow(
            offset: Offset(0, 25),
            blurRadius: 25,
            color: Colors.black12,
          )])
          ),
             Container(height: 150,
              width:  575,
              margin: EdgeInsets.only(left:35,right: 0,top: 25,bottom: 10),
        
                child: Image.network(fl[index].image.toString(),
                height: 20,width:20,),),
              
              Container(width: 1200,height:160,
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
              
                Text(fl[index].commercialName.toString() ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize:25,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text(fl[index].categoryName.toString(),style: TextStyle(fontSize: 19,color: Colors.grey,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                 Text("price ${fl[index].price}",
                 style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[700]),)
              
            
            
            
            
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