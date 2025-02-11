import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStationPage extends StatefulWidget{
    const MyStationPage ({super.key});

        @override
  State<MyStationPage> createState() => _MyStationPage();
}

class _MyStationPage extends State<MyStationPage>{
    List<String> selectedStations = []; 

@override
void initState(){
  super.initState();
  //loadSavedStations();
 }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Stations',
        style: GoogleFonts.getFont(
          'Lato',
          fontSize: 25,
          fontWeight: FontWeight.bold
       )
      )
     )
    );
  } 
}
