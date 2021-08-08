import 'package:covid19app/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height:30),
              LogoutButton(),
              SizedBox(height: 25),
              Text("About Me", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6) ))),
              SizedBox(height: 49),
              Container(
                padding: EdgeInsets.only(left: 33, bottom: 56, right: 33),
                width: 306,
                height: 415,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFF50DFC6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 2,
                      offset: Offset(2, 3), // changes position of shadow
                    ),
                  ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 26),
                    Container(
                      width: 108,
                      height: 108,
                      child: CircleAvatar(backgroundImage: AssetImage("assets/images/zuhalal.jpg"))
                    ),
                    SizedBox(height: 26),
                    Text("Zuhal 'Alimul Hadi",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.white
                        )
                      )
                    ),
                    SizedBox(height: 26),
                    Row(
                        children: [
                          Flexible(
                            child:
                              Container(
                                width:248,
                                child: Text("A college students who have motivated to learn web development and ui/ux design. Never stop learning was my motto.",
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white
                                    )
                                  )
                                ),
                              )
                          )
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}

class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 23),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Color(0xFF50DFC6)),
                    Text("Logout", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6) )))
                  ],
                )
            ),
          ],
        )
    );
  }
}

