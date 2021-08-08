import 'dart:convert';

import 'package:covid19app/Models/CovidStatus_model.dart';
import 'package:covid19app/Models/covidIndo_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color(0xFF50DFC6),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 17, right: 17),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Global", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6))))
                    ],
                  ),
                  Column(
                    children: [
                      Statistics(
                          urlPositive: "https://api.kawalcorona.com/positif",
                          urlSembuh: "https://api.kawalcorona.com/sembuh",
                          urlMeninggal:"https://api.kawalcorona.com/meninggal")
                    ],
                  ),
                  SizedBox(height: 60),
                  Row(
                    children: [
                      Text("Indonesia", textAlign: TextAlign.center,style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6))))
                    ],
                  ),
                  Column(
                    children: [
                      CovidIndoStat()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Statistics extends StatefulWidget {
  const Statistics({Key? key, required this.urlPositive, required this.urlSembuh, required this.urlMeninggal}) : super(key: key);
  final String urlPositive, urlSembuh, urlMeninggal;

  @override
  _StatisticsState createState() => _StatisticsState();
}


class _StatisticsState extends State<Statistics> {
  get id => null;

  @override

  getPositiveData() async {
    final response = await http.get(Uri.parse(widget.urlPositive));
    var jsonData = jsonDecode(response.body);
    List<CovidStatus> covidStatuss = [];

    CovidStatus covidStats = CovidStatus(jsonData["name"], jsonData["value"]);
    covidStatuss.add(covidStats);

    return covidStatuss;
  }

  getSembuhData() async {
    final response = await http.get(Uri.parse(widget.urlSembuh));
    var jsonData = jsonDecode(response.body);
    List<CovidStatus> covidStatuss = [];

    CovidStatus covidStats = CovidStatus(jsonData["name"], jsonData["value"]);
    covidStatuss.add(covidStats);

    return covidStatuss;
  }

  getMeninggalData() async {
    final response = await http.get(Uri.parse(widget.urlMeninggal));
    var jsonData = jsonDecode(response.body);
    List<CovidStatus> covidStatuss = [];

    CovidStatus covidStats = CovidStatus(jsonData["name"], jsonData["value"]);
    covidStatuss.add(covidStats);

    return covidStatuss;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      getPositiveData();
    });
  }
  Widget build(BuildContext context) {
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
                          FutureBuilder(
                              future: getPositiveData(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                        child: Text("Loading...",
                                              style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                            )
                                          )
                                        )
                                    ),
                                  );
                                } else {
                                  return Text(snapshot.data[0].value,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                            )
                                        )
                                  );
                                }
                            }
                          ),

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
                        FutureBuilder(
                          future: getSembuhData(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.data == null) {
                                return Container(
                                  child: Center(
                                  child: Text("Loading...",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          )
                                      )
                                  )
                                ),
                              );
                                } else {
                                  return Text(snapshot.data[0].value,
                                    style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)));
                                  }
                              }
                            )
                        ]
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
                          FutureBuilder(
                              future: getMeninggalData(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.data == null) {
                                  return Container(
                                    child: Center(
                                        child: Text("Loading...",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                )
                                            )
                                        )
                                    ),
                                  );
                                } else {
                                  return Text(snapshot.data[0].value,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white)));
                                }
                              }
                          )
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

class CovidIndoStat extends StatefulWidget {
  const CovidIndoStat({Key? key}) : super(key: key);

  @override
  _CovidIndoStatState createState() => _CovidIndoStatState();
}

class _CovidIndoStatState extends State<CovidIndoStat> {
  @override
  getData() async {
    final response = await http.get(Uri.parse("https://api.kawalcorona.com/indonesia"));
    var jsonData = jsonDecode(response.body);
    List<CovidIndo> covidIndo = [];

    for (var data in jsonData) {
      CovidIndo covidInd = CovidIndo(data["name"], data["positif"], data["sembuh"], data["meninggal"], data["dirawat"]);
      covidIndo.add(covidInd);
    }

    return covidIndo;
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      getData();
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: getData(),
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
                                      Text(snapshot.data[0].positif, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
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
                                      Text(snapshot.data[0].sembuh, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
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
                                      Text(snapshot.data[0].meninggal, style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white)))
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
