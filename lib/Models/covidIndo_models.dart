import 'dart:convert';

class CovidIndo {
  final String name;
  final String positif;
  final String sembuh;
  final String meninggal;
  final String dirawat;

  CovidIndo(this.name, this.positif, this.sembuh, this.meninggal, this.dirawat);

}

CovidIndoModel CovidIndoModelFromJson(String str) => CovidIndoModel.fromJson(json.decode(str));
String CovidIndoModelToJson(CovidIndoModel data) => json.encode(data.toJson());

class CovidIndoModel {
  String name;
  String positif;
  String sembuh;
  String meninggal;
  String dirawat;
  CovidIndoModel({required this.name, required this.positif, required this.sembuh, required this.meninggal, required this.dirawat});

  factory CovidIndoModel.fromJson(Map<String, dynamic> json) => CovidIndoModel(
      name:json['name'],
      positif: json['positif'],
      sembuh: json['sembuh'],
      meninggal: json['meninggal'],
      dirawat: json['dirawat']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "positif": positif,
    "sembuh": sembuh,
    "meninggal": meninggal,
    "dirawat": dirawat,
  };
}