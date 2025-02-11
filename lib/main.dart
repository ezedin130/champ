import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map/pages/screens/filter_page.dart';
import 'package:map/pages/main_screen.dart';
import 'package:map/pages/screens/login_page.dart';
import 'package:map/pages/screens/noti.dart';
import 'package:map/pages/screens/profile_page.dart';
import 'package:map/pages/screens/register_page.dart';
import 'package:map/pages/screens/welcome_page.dart';
void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  Noti().initNotification();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
    MyApp({super.key});

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
        scaffoldBackgroundColor: Colors.black
      ),
      //initialRoute: MainScreen.id,
      routes: {
        'register': (context) => const RegisterPage(),
        'login': (context) => const LoginPage(),
        'home': (context) => const MainScreen()
      },
      home: const ProfilePage(),
      
    );
  }
}
