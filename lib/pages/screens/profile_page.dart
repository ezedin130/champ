import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 81, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Center(
          child: Text(
            'Account',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Center(
                child: Text(
                  'YOUR ACCOUNTS',
                  style: GoogleFonts.getFont(
                    'Lato',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(50),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,width: 0.5),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(Icons.mail,color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Center(
                      child: Text(
                        'Email Address',
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Row(
                    children: [
                      const Padding(
                        padding:EdgeInsets.all(20.0),
                        child: Icon(Icons.car_crash,color:Color.fromARGB(255, 0, 0, 0),),
                      ),
                      Center(
                        child: Text(
                          'Vehicles',
                          style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                       ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}