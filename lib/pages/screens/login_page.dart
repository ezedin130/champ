import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map/constant.dart';
import 'package:map/controllers/authcontroller.dart';
import 'package:map/pages/main_screen.dart';
import 'package:map/pages/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _authcontroller = AuthController();

  late String email;

  late String password;

  bool isLoading = false;

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authcontroller
        .signinuser(context: context, email: email, password: password)
        .whenComplete(() {
      _formKey.currentState!.reset();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login to Account',
                style: GoogleFonts.getFont(
                  'Lato',
                  color: const Color(0xff0d120e),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Explore the Power Exclusives',
                style: GoogleFonts.getFont(
                  'Lato',
                  color: const Color(0xff0d120e),
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Email';
                  } else {
                    return null;
                  }
                },
                decoration: inputdeco.copyWith(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'lib/assets/email.png',
                      color: Colors.black,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  labelText: 'Enter Your Email Address',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Your Password';
                  } else {
                    return null;
                  }
                },
                decoration: inputdeco.copyWith(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'lib/assets/password.png',
                      color: Colors.black,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  labelText: 'Enter Your Password',
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    loginUser();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please fill all fields correctly")));
                  }
                },
                child: Container(
                  width: 319,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.getFont(
                        'Lato',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Need An Account?',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, letterSpacing: 1),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.roboto(
                          color: const Color(0XFF103DE5),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
