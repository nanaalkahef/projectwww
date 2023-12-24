import 'package:flutter/material.dart';

import 'package:projectw/gridview.dart';
import 'package:projectw/side_bar_menu.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              child: Grid())

        ],) ),
    );






  }
}

//flutter run -d chrome --web-browser-flag "--disable-web-security"
//

     /*  PlatformFile objFile = null;
        void chooseFileUsingFilePicker() async { 
     // -----pick file by file picker,
      var result = await FilePicker.platform.pickFiles( 
        withReadStream: true, // this will return PlatformFile object with read stream 
        );
         if (result != null) { 
          setState(() {
             objFile = result.files.single; }); } } 
             
             
             void uploadSelectedFile() async { 
          //---Create http package multipart request object final request = http.MultipartRequest( "POST", Uri.parse("Your API URL"), ); 
       // ----add other fields if needed
          request.fields["id"] = "abc"; //-
       // ----add selected file with request
         request.files.add(new http.MultipartFile( "Your parameter name on server side",
         objFile.readStream, objFile.size, filename: objFile.name));
          //-------Send request 
          var resp = await request.send(); //
          //------Read response
           String result = await resp.stream.bytesToString(); 
     //  ------Your response 
       print(result); }
        @override Widget build(BuildContext context) { 
        return Container( child: Column( children: [// ------Button to choose file using file picker plugin 
        RaisedButton(
           child: Text("Choose File"), onPressed: () => chooseFileUsingFilePicker()), //------Show file name when file is selected
            if (objFile != null) Text("File name : ${objFile.name}"), //------Show file size when file is selected 
            if (objFile != null) Text("File size : ${objFile.size} bytes"), 
            //------Show upload utton when file is selected 
            RaisedButton( child: Text("Upload"), onPressed: () => uploadSelectedFile()), ], ), ); } }*/