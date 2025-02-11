import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map/pages/screens/noti.dart';

class NotificationPage extends StatelessWidget{
  const NotificationPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.black,

      title: Text('Notification',
      style: GoogleFonts.getFont(
        'Lato',
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold)
        )
      ),
      body: Row(
        children: [
          ElevatedButton(
            onPressed: (){
              Noti().showNotification(
                title: "Champ",
                body:"charge"
              );
            },
            child: Text('enable Notifications',
            style: GoogleFonts.getFont(
              'Lato',
              fontSize: 20,
              fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}