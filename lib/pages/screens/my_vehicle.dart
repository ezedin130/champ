import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarPage extends StatefulWidget {
  static const id = 'my vehicles';

  const CarPage({super.key});
 
  @override
  State<CarPage> createState() => _CarPageState();
} 

class _CarPageState extends State<CarPage> {
  List<String> selectedCars = []; // To store multiple selected cars

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
            'My Vehicles',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            
          ),
        ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             /* Center(
                child: Text(
                  'Welcome to Champ',
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold                     
                ),
               ),
              ),*/
            ],
          ),
        ),
    );
  }
}