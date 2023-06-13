// To parse this JSON data, do
//
//     final assetsFile = assetsFileFromJson(jsonString);

import 'dart:convert';

List<AssetsFile> assetsFileFromJson(String str) =>
    List<AssetsFile>.from(json.decode(str).map((x) => AssetsFile.fromJson(x)));

String assetsFileToJson(List<AssetsFile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssetsFile {
  String name;
  String path;

  AssetsFile({
    required this.name,
    required this.path,
  });

  factory AssetsFile.fromJson(Map<String, dynamic> json) => AssetsFile(
        name: json["name"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "path": path,
      };
}
