import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_betta/model/bettacare.dart';
import 'package:project_betta/pages/about/about.dart';
import 'package:project_betta/pages/about/aboutcaredetail.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../home/home.dart';
import '../typebetta/type.dart';
import 'aboutdisease.dart';

class AboutCare extends StatefulWidget {

  static const routeName = '/aboutcare';

  const AboutCare({Key? key}) : super(key: key);

  @override
  State<AboutCare> createState() => _AboutCareState();
}

class _AboutCareState extends State<AboutCare> {

  getDatacare() async {
    String theUrlcare = 'https://aithaibetta.000webhostapp.com/getdatacare.php';
    var res = await http.get(Uri.parse(theUrlcare));
    var responseBody = json.decode(res.body);

    print(responseBody);

    return responseBody;
  }

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
          child: Column(
            children: [
              SizedBox(height: size.height * 0.005),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return const About();
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30.0,
                        color: Colors.brown.shade700,
                      ),
                    ),
                    Text(
                      'วิธีการดูแลปลากัด',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.brown.shade700,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    PopupMenuButton<int>(
                      child: const Icon(
                        Icons.menu_rounded,
                        size: 30.0,
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.home_rounded,
                                  color: Colors.brown,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "หน้าหลัก",
                                  style: TextStyle(
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: Row(
                              children: const [
                                Icon(
                                  TablerIcons.fish,
                                  color: Colors.brown,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "สายพันธุ์ปลากัด",
                                  style: TextStyle(
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 3,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.brown,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "วิธีการดูแลปลากัด",
                                  style: TextStyle(
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 4,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.health_and_safety_rounded,
                                  color: Colors.brown,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "โรคที่พบในปลากัด",
                                  style: TextStyle(
                                    color: Colors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        if(value == 1){
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
                        }else if(value == 2){
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
                        }else if(value == 3){
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
                        }else{
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
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Container(
                height: size.height * 0.85,
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: FutureBuilder(
                  future: getDatacare(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    List snap = snapshot.data ?? [];
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("ERROR!!!"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(
                                context,
                                AboutCareDetail.routeName,
                                arguments: Bettacare(
                                  id: snap[index]['id'],
                                  name: snap[index]['name'],
                                  nameeng: snap[index]['nameeng'],
                                  description: snap[index]['description'],
                                  descriptioneng: snap[index]['descriptioneng'],
                                  img1: snap[index]['img1'],
                                  img2: snap[index]['img2'],
                                  img3: snap[index]['img3'],
                                ),
                              );
                            },
                            child: Container(
                              height: 120.0,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 120.0,
                                    width: 120.0,
                                    decoration:BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fitHeight,
                                            image: NetworkImage(
                                                '${snap[index]['img1']}',
                                            ),
                                        ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            ( '${snap[index]['name']}'),
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.brown.shade600,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${snap[index]['nameeng']}',
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.brown.shade400,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

