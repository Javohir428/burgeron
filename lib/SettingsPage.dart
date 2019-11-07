import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            new Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: new AppBar(title: new Text("Settings", style: TextStyle(color: Color.fromRGBO(208, 1, 19, 1))),
                iconTheme: new IconThemeData(color: Color.fromRGBO(208, 1, 19, 1)),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
            ),
          ],
        )
    );
  }
}
