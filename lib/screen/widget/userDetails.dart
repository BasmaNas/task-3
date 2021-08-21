import 'package:flutter/material.dart';
import 'package:task3/screen/MapScreen.dart';
import 'package:task3/utils.dart';
import 'package:task3/models/user.dart';

class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Card(
            child: Container(
              height: 15,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("${widget.user.name}")),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                launchURL("mailto:${widget.user.email}");
              },
              child: Text("Email:${widget.user.email}")),
          InkWell(
              onTap: () {
                launchURL("tel:${widget.user.phone}");
              },
              child: Text("phone:${widget.user.phone}")),
          Divider(),
          InkWell(
              onTap: () {
                launchURL("https://${widget.user.website}");
              },
              child: Text("web:${widget.user.website}")),
          MaterialButton(
            onPressed: () {
              pushPage(
                  context,
                  MapSample(
                    userloaction: widget.user.address.geo,
                  ));
            },
            child: Text("Map View"),
          ),
        ],
      ),
    );
  }
}
