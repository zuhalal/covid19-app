import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:covid19app/Models/DailyIndo_model.dart';
import 'package:http/http.dart' as http;

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily"),
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
                    Container(
                      width: 350,
                      child: Column(
                        children: [
                          Text("Indonesia\nDaily Case",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6)
                              )
                            )
                          ),
                          // Text("Last Update: 7 Agustus 2021",
                          //     textAlign: TextAlign.center,
                          //     style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6)
                          //     )
                          //   )
                          // )
                        ],
                      )
                    )
                  ],
                ),
                SizedBox(height: 16),
                DailyStatsIndo()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DailyStatsIndo extends StatefulWidget {
  const DailyStatsIndo({Key? key}) : super(key: key);

  @override
  _DailyStatsIndoState createState() => _DailyStatsIndoState();
}

class _DailyStatsIndoState extends State<DailyStatsIndo> {
  get id => null;

  @override
  getDailyData() async {
    final response = await http.get(Uri.parse("https://apicovid19indonesia-v2.vercel.app/api/indonesia/harian"));
    final jsonData = jsonDecode(response.body);
    final finalData = jsonData[jsonData.length-1];
    List<DailyIndo> dailyIndo = [];
    DailyIndo dailyInd = DailyIndo(finalData["positif"], finalData["sembuh"], finalData["meninggal"], finalData["tanggal"]);
    dailyIndo.add(dailyInd);

    return dailyIndo;
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      getDailyData();
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: getDailyData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                      child: Text("Loading...",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                              )
                          )
                      )
                  ),
                );
              } else {
                return Column(
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
                                      Text(snapshot.data[0].positif.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
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
                                      Text(snapshot.data[0].sembuh.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
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
                                      Text(snapshot.data[0].meninggal.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
                                    ],
                                  ),
                                ],
                              )
                          ),
                        )
                      ],
                    )
                  ],
                );
              }
            }
        )
      ],
    );
  }
}

