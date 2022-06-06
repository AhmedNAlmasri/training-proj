import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//|||||||||||||||||||||||||||||||||||||||||||F||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\\
class Photo {
  final int id;
  final String title;
  final String thumbnailUrl;

  const Photo({
    @required this.id,
    @required this.title,
    @required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    //whats factory???!
    return Photo(
      id: json['id'],
      title: json['name'],
      thumbnailUrl: json['img'],
    );
  }
}

Future<List<Photo>> fetchJson(http.Client client) async {
  final response = await client.get(
    Uri.parse('http://192.168.0.250:8526/api/Ahmed/getAhmedDb'),
  );
  // Use the compute function to run convertImg in a separate isolate.
  return compute(convertImg, response.body); //i don't understands this part
}

List<Photo> convertImg(String response) {
  final convertJson = jsonDecode(response);
  return convertJson
      .map<Photo>(
        (json) => Photo.fromJson(json),
      )
      .toList();
}

Future<http.Response> deleteRow() async {
  final http.Response response = await http.delete(
    Uri.parse(
        'http://192.168.0.250:8526/api/Ahmed/AhmedDelete?nameToDelete=drake'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    // body: jsonEncode(<String, String>{
    //   'name': newName,
    // }),
  );
  return response;
}

Future<http.Response> updateRow(String newName, int targetedId) async {
  final http.Response response = await http.patch(
    Uri.parse(
        'http://192.168.0.250:8526/api/Ahmed/AhmedUpdate?newName=Samer&idIndex=4'),
    // body: jsonEncode(
    //   <String, dynamic>{'newName': newName, 'idIndex': targetedId},
    // ),
  );
  return response;
}

Future<List<Photo>> filterSearch(String searched, http.Client client) async {
  String url = "http://192.168.0.250:8526/api/Ahmed/AhmedFilter?searchedWord=$searched";
  print(url);
  final http.Response response = await client.get(
    Uri.parse(url),
    // body: jsonEncode(
    //   <String, dynamic>{'newName': newName, 'idIndex': targetedId},
    // ),
  );
  return compute(convertImg, response.body); //i don't understands
}

Future<http.Response> insertRow(int id, String newName, String imgUrl) async {
  final http.Response response = await http.post(
    Uri.parse('http://192.168.0.250:8526/api/Ahmed/AhmedInser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{
        'ID': 8,
        'Name': 'Nathan',
        "IMG": 'ss'
      },
    ),
  );
  return response;
}
