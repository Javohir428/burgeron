import 'package:burgeron/AboutUsPage.dart';
import 'package:burgeron/InstructionPage.dart';
import 'package:burgeron/MyOrdersPage.dart';
import 'package:burgeron/SettingsPage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


class _HomePageState extends State<HomePage> {
  Widget appBarTitle = new Text('Burgeron', style: TextStyle(color: Color.fromRGBO(208, 1, 19, 1)));
  Icon actionIcon = new Icon(Icons.search, color: Color.fromRGBO(208, 1, 19, 1));
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: Theme(
            data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(208, 1, 19, 1),
        ),
          child: new Drawer(
            child: new ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset("assets/logo.png", width: 0.0, height: 0.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/d_header2.jpg"),
                          fit: BoxFit.cover)
                  ),
                ),
                new ListTile(
                  title: new Center(child: new Text("My Orders",
                    style: new TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0),)),
                  onTap: ()
                  {
                    Navigator.push(context, SlideRightRoute(page: new MyOrdersPage()));
                  },
                ),
                new ListTile(
                  title: new Center(child: new Text("Settings",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0),)),
                  onTap: ()
                  {
                    Navigator.push(context, SlideRightRoute(page: new SettingsPage()));
                  },
                ),
                new ListTile(
                  title: new Center(child: new Text("Instruction",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0),)),
                  onTap: ()
                  {
                    Navigator.push(context, SlideRightRoute(page: new InstructionPage()));
                  },
                ),
                new ListTile(
                  title: new Center(child: new Text("About Us",
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0),)),
                  onTap: ()
                  {
                    Navigator.push(context, SlideRightRoute(page: new AboutUsPage()));
                  },
                ),
              ],
            ),
          ),
        ),
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              new Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: new AppBar(title: appBarTitle,
                    iconTheme: new IconThemeData(color: Color.fromRGBO(208, 1, 19, 1)),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    actions: <Widget>[
                      new IconButton(icon: actionIcon, onPressed: (){
                      setState(() {
                                 if ( this.actionIcon.icon == Icons.search){
                                  this.actionIcon = new Icon(Icons.close, color: Color.fromRGBO(208, 1, 19, 1));
                                  this.appBarTitle = new TextField(
                                    style: new TextStyle(
                                      color: Color.fromRGBO(208, 1, 19, 1),
                      ),
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Color.fromRGBO(208, 1, 19, 1)),
                        hintText: "Find restaurant...",
                        hintStyle: new TextStyle(color: Color.fromRGBO(208, 1, 19, 1))
                      ),
                      );}
                      else {
                        this.actionIcon = new Icon(Icons.search, color: Color.fromRGBO(208, 1, 19, 1));
                        this.appBarTitle = new Text('Burgeron', style: TextStyle(color: Color.fromRGBO(208, 1, 19, 1)));
                      }
                      });
                      })
                    ],
                  ),
              ),
            ],
          )
    );
  }
}



