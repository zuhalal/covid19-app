import 'package:covid19app/pages/About.dart';
import 'package:covid19app/pages/Cases.dart';
import 'package:covid19app/pages/Home.dart';
import 'package:covid19app/pages/MainApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 128, bottom: 71),
              child: Text("COVID-19 APP", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: Color(0xFF50DFC6))),),
            ) ,
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 51,right: 51),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Email", textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
                        ]
                      ),
                      SizedBox(height: 14),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "johndoe@gmail.com",
                          hintStyle: GoogleFonts.poppins(),
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )
                        ),
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 51,right: 51),
                  child: Column(
                    children: [
                      Row(
                          children: [
                            Text("Password", textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
                          ]
                      ),
                      SizedBox(height: 14),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "******",
                            hintStyle: GoogleFonts.poppins(),
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 51), //End for form login,
            Column(
              children: [
                Container(
                  width: 283,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF50DFC6),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(width: 1, color: Color(0xFF50DFC6))// <-- Radius
                      )
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>MainApp()));
                    },
                    child: Text("Login", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400))),
                  ),
                ),
                SizedBox(height: 14),
                Text("Or", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
                SizedBox(height: 14),
                Container(
                  width: 283,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(width: 1, color: Color(0xFF50DFC6))// <-- Radius
                      )
                    ), 
                    onPressed: () {},
                    child: Text("Register", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6)))),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
