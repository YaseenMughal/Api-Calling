import 'package:apicallingproject/controller/home_controller.dart';
import 'package:apicallingproject/views/user_view.dart';
import 'package:flutter/material.dart';

class Home_Screeen extends StatefulWidget {
  const Home_Screeen({super.key});

  @override
  State<Home_Screeen> createState() => _Home_ScreeenState();
}

class _Home_ScreeenState extends State<Home_Screeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API-Calling"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getusers(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Users(userid: snapshot.data[index].id)));
                    },
                    child: ListTile(
                      title: Text(snapshot.data[index].address.street),
                      subtitle: Text(snapshot.data[index].email),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
