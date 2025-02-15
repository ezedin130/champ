import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyVehiclePage extends StatefulWidget {
    static const id = 'vehicle';
  const MyVehiclePage({super.key});

  @override
  State<MyVehiclePage> createState() => _MyVehiclePageState();
}

class _MyVehiclePageState extends State<MyVehiclePage> {
  List<String> mySelectedCars = [];

  @override
  void initState() {
    super.initState();
    _loadSelectedCars(); 
  }

  Future<void> _loadSelectedCars() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCars = prefs.getStringList('selectedCars') ?? [];
    setState(() {
      mySelectedCars = savedCars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Selected Vehicles",
        style: GoogleFonts.getFont(
          'Lato',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: mySelectedCars.isEmpty
                ?  Center(
                    child: Text("No vehicles selected",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold )
                        ),
                  )
                : ListView.builder(
                    itemCount: mySelectedCars.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(mySelectedCars[index],
                        style: GoogleFonts.getFont('Lato',
                        color: Colors.white),),
                        leading: const Icon(Icons.directions_car,color: Colors.white,),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}