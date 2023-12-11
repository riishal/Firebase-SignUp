import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sign_up/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_service.dart';

class UIHelper {
  static void showLoadingDialog(BuildContext context, String title) {
    AlertDialog loadingDialog = AlertDialog(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: Colors.black),
            SizedBox(
              height: 20,
            ),
            Text(title, style: GoogleFonts.adamina())
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => loadingDialog,
    );
  }

  static void showAlertDialog(
      BuildContext context, String title, String content) {
    AlertDialog alertDialog = AlertDialog(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: Text(title, style: GoogleFonts.adamina()),
      content: Text(content, style: GoogleFonts.adamina()),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok",
                style: GoogleFonts.adamina(fontWeight: FontWeight.bold)))
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }

  static void showLogOut(context) {
    AlertDialog alertDialog = AlertDialog(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: Text("Log out?", style: GoogleFonts.adamina()),
      content: Text(
        "Are you sure want to log out?",
        style: GoogleFonts.adamina(),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: GoogleFonts.adamina())),
        TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await FirebaseHelper().signout();
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Text(
              "Log out",
              style: GoogleFonts.adamina(color: Colors.red),
            )),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }
}
