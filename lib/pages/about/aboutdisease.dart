import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_betta/model/bettacare.dart';
import 'package:project_betta/model/diseaseclass.dart';
import 'package:project_betta/pages/about/about.dart';
import 'package:project_betta/pages/about/aboutcaredetail.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../home/home.dart';
import '../typebetta/type.dart';
import 'aboutcare.dart';
import 'aboutdiseasedetail.dart';

class AboutDisease extends StatefulWidget {

  static const routeName = '/aboutdisease';

  const AboutDisease({Key? key}) : super(key: key);

  @override
  State<AboutDisease> createState() => _AboutDiseaseState();
}

class _AboutDiseaseState extends State<AboutDisease> {

  getDataDisease() async {
    String theUrldisease = 'https://aithaibetta.000webhostapp.com/getdatadisease.php';
    var res = await http.get(Uri.parse(theUrldisease));
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
                        size: 40.0,
                        color: Colors.brown.shade700,
                      ),
                    ),
                    Text(
                      'โรคที่พบในปลากัด',
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
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: getDataDisease(),
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
                                AboutDiseaseDetail.routeName,
                                arguments: Disease(
                                  id: snap[index]['id'],
                                  name: snap[index]['name'],
                                  nameeng: snap[index]['nameeng'],
                                  description: snap[index]['description'],
                                  descriptioneeng: snap[index]['descriptioneeng'],
                                  treatment: snap[index]['treatment'],
                                  treatmenteng: snap[index]['treatmenteng'],
                                  img: snap[index]['img'],
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
                                                '${snap[index]['img']}',
                                            ),
                                        ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            ( '${snap[index]['name']}'),
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.brown.shade600,
                                            ),
                                          ),
                                          Text(
                                            '${snap[index]['nameeng']}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.brown.shade400,
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

