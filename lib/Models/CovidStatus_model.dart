import 'dart:convert';

class CovidStatus {
  final String name;
  final String value;

  CovidStatus(this.name, this.value);

}

CovidStatusModel CovidStatusModelFromJson(String str) => CovidStatusModel.fromJson(json.decode(str));
String CovidStatusModelToJson(CovidStatusModel data) => json.encode(data.toJson());

class CovidStatusModel {
  String name;
  String value;
  CovidStatusModel({required this.name, required this.value});

  factory CovidStatusModel.fromJson(Map<String, dynamic> json) => CovidStatusModel(
    name:json['name'],
    value: json['value']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
  };
}