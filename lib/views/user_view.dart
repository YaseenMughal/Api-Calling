import 'package:apicallingproject/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Users extends StatelessWidget {
  final userid;
  const Users({super.key, required this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getuserid(userid),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Column(
                  children: [
                    Text(
                      snapshot.data.name,
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "${snapshot.data.id}",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "${snapshot.data.email}",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ));
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
