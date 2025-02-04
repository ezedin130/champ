import 'package:flutter/material.dart';
import 'package:map/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                //call the slidable from right
              },
              child: const Icon(
                Icons.list,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
      // the body should read if there is identified acoount and if there is it displays the appropriate page
      body: const NoAccount(),
    );
  }
}

class NoAccount extends StatelessWidget {
  const NoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: inputdeco.copyWith(labelText: 'Enter Your Name'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: inputdeco.copyWith(labelText: 'Enter Your Email'),
          ),
        ),
        InkWell(
          onTap: () {
            //save the user details
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.grey),
            child: const Center(
                //add circular progress indicator
                child: Text(
              'save',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        )
      ],
    );
  }
}
class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}