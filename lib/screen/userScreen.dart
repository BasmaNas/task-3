import 'package:flutter/material.dart';
import 'package:task3/screen/widget/userDetails.dart';
import 'package:task3/service/userServices.dart';
import 'package:task3/utils.dart';
import 'package:task3/models/user.dart';

class usersScreen extends StatefulWidget {
  @override
  _usersScreenState createState() => _usersScreenState();

  getusers() {}
}

class _usersScreenState extends State<usersScreen> {
  bool loading = true;
  List<User> user = [];
  getPostlist() async {
    user = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Screen"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: user.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      pushPage(context, UserDetails(user[index]));
                    },
                    child: Card(
                      child: Container(
                        height: 15,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text("${user[index].name}")),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
