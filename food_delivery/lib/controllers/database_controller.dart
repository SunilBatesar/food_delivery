import 'dart:convert';
import 'package:flutter/services.dart';

Future<List> getjsondata(String path) async {
  var jsondata = await rootBundle.loadString("assets/jsons/$path");
  return jsonDecode(jsondata) as List;
}
