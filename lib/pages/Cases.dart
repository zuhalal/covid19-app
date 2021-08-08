import 'package:covid19app/Models/CaseProvince_models.dart';
import 'package:covid19app/pages/DetailCase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CasePage extends StatefulWidget {
  const CasePage({Key? key}) : super(key: key);

  @override
  _CasePageState createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  @override
  getProvinceData() async {
    final response = await http.get(Uri.parse("https://api.kawalcorona.com/indonesia/provinsi"));
    final jsonData = jsonDecode(response.body);
    List<ProvinceCase> provinceCases = [];
    for (var data in jsonData) {
      ProvinceCase cases = ProvinceCase(data["attributes"]["Provinsi"], data["attributes"]["Kasus_Posi"], data["attributes"]["Kasus_Semb"],data["attributes"]["Kasus_Meni"]);
      provinceCases.add(cases);
    }
    return provinceCases;
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      getProvinceData();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Case"),
        backgroundColor: Color(0xFF50DFC6)
      ),
      body: Column(
        children: [
            SizedBox(height: 28),
            Center(
              child:
                  Text("Province case sorted by total cases",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF50DFC6)
                      )
                    )
                  )
            ),
          SizedBox(height: 28),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child:
            SizedBox(
              height: 500,
              child:
              FutureBuilder(
                future: getProvinceData(),
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
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].provinsi),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailCase(
                              province:snapshot.data[index].provinsi,
                              positif: snapshot.data[index].kasus_Posi,
                              sembuh: snapshot.data[index].kasus_Semb,
                              meninggal: snapshot.data[index].kasus_Meni,
                            )));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 1,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      )
    );
  }
}
