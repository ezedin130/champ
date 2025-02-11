import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map/pages/screens/filter_page.dart';

class CarPage extends StatefulWidget {
  //static const id = 'vehicles';

  const CarPage({super.key});
 
  @override
  State<CarPage> createState() => _CarPageState();
} 

class _CarPageState extends State<CarPage> {
  List<String> selectedCars = []; 

@override
void initState(){
  super.initState();
  loadSavedCars();
}

 Future<void> loadSavedCars() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedCars = prefs.getString('selectedCars');

    if (savedCars != null) {
      setState(() {
        selectedCars = List<String>.from(jsonDecode(savedCars));
      });
    }
  }

  Future<void> saveCars() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCars', jsonEncode(selectedCars));
  }

  void deleteCar(int index) {
    setState(() {
      selectedCars.removeAt(index); 
    });
    saveCars(); 
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25), 
          onPressed: () {
           Navigator.pop(context); 
    },
  ),
        title:  Center(
            child: Text(
              'My Vehicles',
                style: GoogleFonts.getFont(
                'Lato',
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
          ),
        ),
        ),
      ),
        body: selectedCars.isEmpty
            ?  Center(child: Text(
              'No Item Selected',
              style: GoogleFonts.getFont
              ('Lato',
              color: Colors.white
              ),
            )
          )
            : ListView.builder(
                itemCount:selectedCars.length,
                itemBuilder: (context, index) {
                   return ListTile(
                   title: Text(selectedCars[index],
                   style:
                   GoogleFonts.getFont
                       ('Lato',
                        color: Colors.white
         ),
        ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => deleteCar(index), 
        ),
       );
      },
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VehiclePage()),
          );
              if (result != null && result is List<String>) {
            setState(() {
              selectedCars.addAll(result); 
              saveCars();
            });
          }
        },
        child: const Icon(Icons.add), 
      ),
    );
  }
 }
