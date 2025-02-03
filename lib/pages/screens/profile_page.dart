import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
      body:  SingleChildScrollView(
        child: Column(
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
                        child: Icon(Icons.mail,color: Color.fromARGB(255, 48, 115, 240)),
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
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top:0),
                    child: Row(
                      children: [
                        const Padding(
                          padding:EdgeInsets.all(20.0),
                          child: Icon(Icons.car_crash,color:Color.fromARGB(255, 50, 209, 122)),
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
            Text(
              'PREFERENCES',
               style: GoogleFonts.getFont(
                'Lato',
                 fontSize: 16,
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
             ),
             ),
            Container(
              margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 0.5),
                borderRadius: BorderRadius.circular(8)
              ),
              child: 
               Column(
                 children: [
                   Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(Icons.message,color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Center(
                            child: Text(
                              'Notification',
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
                      const Divider(),
                      Column(
                        children: [
                          Row(
                            children: [
                            const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(Icons.local_gas_station,color: Color.fromARGB(255, 48, 115, 240)),
                          ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                  ///Navigator.pushNamed(context, savedstations.id);
                                  },
                                  child: Text(
                                    'My Stations',
                                     style: GoogleFonts.getFont(
                                     'Lato',
                                     fontSize: 16,
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                 ],
               ),
             ),
             Text(
              'Contact Us',
                style: GoogleFonts.getFont(
                 'Lato',
                 fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
               ),
             ),
             Container(
               margin: const EdgeInsets.all(50),
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:Image.asset('lib/assets/instagram.png',width: 50,height: 50,)
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Image.asset('lib/assets/twitter.png',width: 50,height: 50,)
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Image.asset('lib/assets/facebook.png',width: 50,height: 50,)
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              ),
             ),
             Container(
              
               child: Text('Log Out',
                 style: GoogleFonts.getFont(
                   'Lato',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                 ),),
             )
          ],
        ),
      ),
    );
  }
}