import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sign_up/view/user_profile.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../model/user_model.dart';

int buttonIndex = 0;
int currentIndex = 0;

class HomePage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;
  const HomePage(
      {super.key, required this.userModel, required this.firebaseUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "Home page",
            style: GoogleFonts.adamina(
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            SizedBox(
              width: 60,
              child: PopupMenuButton(
                onSelected: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfile(
                          firebaseUser: widget.firebaseUser,
                          userModel: widget.userModel,
                        ),
                      ));
                },
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(widget.userModel.profilepic!),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(
                      "View Your Profile",
                      style: GoogleFonts.adamina(
                        letterSpacing: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 0,
            ),
          ]),
      backgroundColor: const Color.fromARGB(255, 250, 242, 237),
    );
  }
}
