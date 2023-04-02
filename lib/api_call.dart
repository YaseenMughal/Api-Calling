import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCallView extends StatefulWidget {
  const ApiCallView({super.key});

  @override
  State<ApiCallView> createState() => _ApiCallViewState();
}

class _ApiCallViewState extends State<ApiCallView> {
  getUser() async {
    var users = [];
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "/users"));
    var jsonData = jsonDecode(response.body);

    for (var i in jsonData) {
      UserModel user = UserModel(i["name"], i["username"], i["email"]);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api-Calling"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.purple,
              ));
            } else
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data[i].name),
                    subtitle: Text(snapshot.data[i].email),
                  );
                },
              );
          },
        )
        // Center(
        //   child: ElevatedButton(onPressed: getUser, child: Text("Get")),
        // ),
        );
  }
}

class UserModel {
  var name;
  var username;
  var email;

  UserModel(this.name, this.username, this.email);
}
