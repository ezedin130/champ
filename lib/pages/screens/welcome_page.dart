import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map/pages/screens/register_page.dart';

class WelcomePage extends StatelessWidget {
  static const id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'POWER YOUR DRIVE',
                style: GoogleFonts.getFont(
                  'Lato',
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            'Welcome to Champ',
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 18,
              color: Colors.blueAccent,
            ),
          ),
          Image.asset(
            'lib/assets/car.webp',
            width:500,
            height:500,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterPage.id);
            },
            child: Text('Get Started',
                style: GoogleFonts.getFont(
                  'Lato',
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                )),
          )
        ],
      ),
    );
  }
}
