// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map/pages/screens/filter_page.dart';
import 'package:map/pages/main_screen.dart';
import 'package:map/pages/screens/login_page.dart';
import 'package:map/pages/screens/my_vehicle.dart';
import 'package:map/pages/screens/profile_page.dart';
import 'package:map/pages/screens/register_page.dart';
import 'package:map/pages/screens/welcome_page.dart';

void main() => runApp(
  
      DevicePreview(
       enabled: !kReleaseMode,
       builder: (context) => 
        const MyApp(),
      )
    
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Champ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: WelcomePage.id,
      routes: {
        'welcome': (context) =>  WelcomePage(),
        'register': (context) => const RegisterPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const MainScreen(),
        'profile': (context) =>  ProfilePage(),
        'vehicles': (context) =>  const CarPage(),
      },
    );
  }
}
