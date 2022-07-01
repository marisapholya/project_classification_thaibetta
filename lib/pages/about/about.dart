import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:project_betta/pages/about/aboutcare.dart';
import 'package:project_betta/pages/about/aboutdisease.dart';
import 'package:project_betta/pages/home/home.dart';
import '../typebetta/type.dart';

class About extends StatefulWidget {
  static const routeName = '/about';

  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text(
                            'โรคและการดูแล',
                            style: TextStyle(
                              fontSize: 45.0,
                              color: Colors.brown.shade700,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // เนื้อหา
                    SingleChildScrollView(
                      child: Container(
                        height: size.height * 0.7,
                        width: size.width*0.9,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index)  {
                            return Column(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation) {
                                            return const AboutCare();
                                          },
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.network(
                                          'https://media.discordapp.net/attachments/971446078354358352/976908801661894676/73.png',
                                          fit: BoxFit.fill,
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.brown.shade400,
                                            size: 35.0,
                                          ),
                                          title: Text(
                                            'วิธีการดูแลปลากัด',
                                            style: TextStyle(
                                              color: Colors.brown.shade600,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          subtitle: Text(
                                            'How to care for betta fish',
                                            style: TextStyle(
                                              color: Colors.brown.shade400,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double> secondaryAnimation) {
                                            return const AboutDisease();
                                          },
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Image.network(
                                            'https://media.discordapp.net/attachments/971446078354358352/971814163452166184/Disease3.png?width=1205&height=678',
                                          fit: BoxFit.fill,
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.health_and_safety_rounded,
                                            color: Colors.brown.shade400,
                                            size: 35.0,
                                          ),
                                          title: Text(
                                            'โรคที่พบในปลากัด',
                                            style: TextStyle(
                                              color: Colors.brown.shade600,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          subtitle: Text(
                                            'Diseases found in betta fish',
                                            style: TextStyle(
                                              color: Colors.brown.shade400,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        ),
                      ) ,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xffAF7AC5),
        width: size.width,
        height: size.height * 0.125,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return const TypeBetta();
                    },
                  ),
                );
              },
              padding: const EdgeInsets.all(3.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: const <Widget>[
                  Icon(
                    TablerIcons.fish,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "สายพันธุ์ปลากัด",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return const HomePage();
                    },
                  ),
                );
              },
              padding: const EdgeInsets.all(3.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: const <Widget>[
                  Icon(
                    Icons.home_rounded,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "หน้าหลัก",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {},
              padding: const EdgeInsets.all(3.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: const <Widget>[
                  Icon(
                    Icons.menu_book,
                    size: 40.0,
                    color: Colors.amberAccent,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "โรคและการดูแล",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
