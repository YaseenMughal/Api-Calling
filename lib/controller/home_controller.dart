import 'dart:convert';

import 'package:apicallingproject/model/user_model.dart';
import 'package:http/http.dart' as http;

getusers() async {
  var userdata = [];
  var baseUrl = "https://jsonplaceholder.typicode.com/users";
  var url = Uri.parse(baseUrl);
  var res = await http.get(url);
  var jsonRes = jsonDecode(res.body);
  print(res.body);
  for (var i in jsonRes) {
    userdata.add(userData.fromJson(i));
  }

  return userdata;
}

getuserid(id) async {
  var baseUrl = "https://jsonplaceholder.typicode.com/users/$id";
  var url = Uri.parse(baseUrl);
  var res = await http.get(url);
  var jsonRes = jsonDecode(res.body);

  return userData.fromJson(jsonRes);
}

get(a) async {
  var b = 333 * a;
  return b;
}
