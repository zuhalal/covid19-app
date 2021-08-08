import 'package:covid19app/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCase extends StatefulWidget {
  const DetailCase({Key? key, required this.province, required this.positif, required this.sembuh, required this.meninggal}) : super(key: key);
  final String province;
  final int positif, sembuh, meninggal;

  @override
  _DetailCaseState createState() => _DetailCaseState();
}

class _DetailCaseState extends State<DetailCase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF50DFC6)
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.only(left: 17, right: 17),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.province,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF50DFC6)
                        )
                      )
                    )
                  ],
                ),
      Column(
        children: [
          Row(
            children: [
              Card(
                color: Color(0xFFFFC93D),
                child: Container(
                    padding: EdgeInsets.only(left: 19, bottom: 18),
                    width: 341,
                    child: Column(
                      children: [
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Text("Positif", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)))
                          ],
                        ),
                        Row(
                          children: [
                            Text(widget.positif.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
                          ],
                        ),
                      ],
                    )
                ),
              )
            ],
          ),
          Row(
            children: [
              Card(
                color: Color(0xFF50DFC6),
                child: Container(
                    padding: EdgeInsets.only(left: 13, bottom: 6),
                    width: 167,
                    child: Column(
                      children: [
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Text("Sembuh", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)))
                          ],
                        ),
                        Row(
                          children: [
                            Text(widget.sembuh.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
                          ],
                        ),
                      ],
                    )
                ),
              ),
              Card(
                color: Color(0xFFF96262),
                child: Container(
                    padding: EdgeInsets.only(left: 13, bottom: 6),
                    width: 166,
                    child: Column(
                      children: [
                        SizedBox(height: 9),
                        Row(
                          children: [
                            Text("Meninggal", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)))
                          ],
                        ),
                        Row(
                          children: [
                            Text(widget.meninggal.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
                          ],
                        ),
                      ],
                    )
                ),
              )
            ],
          )
        ],
      )

      ],
            ),
          )
        ],
      ),
    );
  }
}
