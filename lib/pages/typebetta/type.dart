import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:project_betta/model/typeclass.dart';
import 'package:project_betta/pages/about/about.dart';
import 'package:project_betta/pages/home/home.dart';
import 'package:project_betta/pages/typebetta/typedetail.dart';
import 'package:http/http.dart' as http;


class TypeBetta extends StatefulWidget {
  static const routeName = '/type';

  const TypeBetta({Key? key}) : super(key: key);

  @override
  State<TypeBetta> createState() => _TypeBettaState();
}

class _TypeBettaState extends State<TypeBetta> {
  late var typename;
  var data = [];

  getMethod() async {
    String theUrl = 'https://aithaibetta.000webhostapp.com/getdatatype.php';
    var res = await http.get(Uri.parse(theUrl));
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
              SizedBox(height: size.height * 0.006),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10.0,),
                    Text(
                      'สายพันธุ์ปลากัดในประเทศไทย',
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.brown.shade700,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    FutureBuilder(
                        future: getMethod(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          List snap = snapshot.data ?? [];
                          return PopupMenuButton<int>(
                            child: Icon(
                              Icons.search_outlined,
                              size: 30.0,
                              color: Colors.brown.shade700,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            color: Colors.purple.shade50,
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[0]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[0]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[1]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[1]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[2]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[2]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[3]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[3]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[4]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[4]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 6,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[5]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[5]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 7,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[6]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[6]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[7]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[7]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[8]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[8]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[9]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[9]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const PopupMenuDivider(),
                                PopupMenuItem<int>(
                                  value: 11,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snap[10]['shortname']} ',
                                        style: const TextStyle(
                                          color: Colors.teal,
                                        ),
                                      ),
                                      Text(
                                        '${snap[10]['nameeng']} ',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ];
                            },
                            onSelected: (value) {
                              if (value == 1) {
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[0]['id'],
                                    shortname: snap[0]['shortname'],
                                    name: snap[0]['name'],
                                    nameeng: snap[0]['nameeng'],
                                    description: snap[0]['description'],
                                    descriptioneng: snap[0]['descriptioneng'],
                                    shop: snap[0]['shop'],
                                    shoplink: snap[0]['shoplink'],
                                    img: snap[0]['img'],
                                    img1: snap[0]['img1'],
                                    img2: snap[0]['img2'],
                                    img3: snap[0]['img3'],
                                    img4: snap[0]['img4'],
                                    img5: snap[0]['img5'],
                                  ),
                                );
                              }else if(value == 2){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[1]['id'],
                                    shortname: snap[1]['shortname'],
                                    name: snap[1]['name'],
                                    nameeng: snap[1]['nameeng'],
                                    description: snap[1]['description'],
                                    descriptioneng: snap[1]['descriptioneng'],
                                    shop: snap[1]['shop'],
                                    shoplink: snap[1]['shoplink'],
                                    img: snap[1]['img'],
                                    img1: snap[1]['img1'],
                                    img2: snap[1]['img2'],
                                    img3: snap[1]['img3'],
                                    img4: snap[1]['img4'],
                                    img5: snap[1]['img5'],
                                  ),
                                );
                              }else if(value == 3){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[2]['id'],
                                    shortname: snap[2]['shortname'],
                                    name: snap[2]['name'],
                                    nameeng: snap[2]['nameeng'],
                                    description: snap[2]['description'],
                                    descriptioneng: snap[2]['descriptioneng'],
                                    shop: snap[2]['shop'],
                                    shoplink: snap[2]['shoplink'],
                                    img: snap[2]['img'],
                                    img1: snap[2]['img1'],
                                    img2: snap[2]['img2'],
                                    img3: snap[2]['img3'],
                                    img4: snap[2]['img4'],
                                    img5: snap[2]['img5'],
                                  ),
                                );
                              }else if(value == 4){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[3]['id'],
                                    shortname: snap[3]['shortname'],
                                    name: snap[3]['name'],
                                    nameeng: snap[3]['nameeng'],
                                    description: snap[3]['description'],
                                    descriptioneng: snap[3]['descriptioneng'],
                                    shop: snap[3]['shop'],
                                    shoplink: snap[3]['shoplink'],
                                    img: snap[3]['img'],
                                    img1: snap[3]['img1'],
                                    img2: snap[3]['img2'],
                                    img3: snap[3]['img3'],
                                    img4: snap[3]['img4'],
                                    img5: snap[3]['img5'],
                                  ),
                                );
                              }else if(value == 5){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[4]['id'],
                                    shortname: snap[4]['shortname'],
                                    name: snap[4]['name'],
                                    nameeng: snap[4]['nameeng'],
                                    description: snap[4]['description'],
                                    descriptioneng: snap[4]['descriptioneng'],
                                    shop: snap[4]['shop'],
                                    shoplink: snap[4]['shoplink'],
                                    img: snap[4]['img'],
                                    img1: snap[4]['img1'],
                                    img2: snap[4]['img2'],
                                    img3: snap[4]['img3'],
                                    img4: snap[4]['img4'],
                                    img5: snap[4]['img5'],
                                  ),
                                );
                              }else if(value == 6){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[5]['id'],
                                    shortname: snap[5]['shortname'],
                                    name: snap[5]['name'],
                                    nameeng: snap[5]['nameeng'],
                                    description: snap[5]['description'],
                                    descriptioneng: snap[5]['descriptioneng'],
                                    shop: snap[5]['shop'],
                                    shoplink: snap[5]['shoplink'],
                                    img: snap[5]['img'],
                                    img1: snap[5]['img1'],
                                    img2: snap[5]['img2'],
                                    img3: snap[5]['img3'],
                                    img4: snap[5]['img4'],
                                    img5: snap[5]['img5'],
                                  ),
                                );
                              }else if(value == 7){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[6]['id'],
                                    shortname: snap[6]['shortname'],
                                    name: snap[6]['name'],
                                    nameeng: snap[6]['nameeng'],
                                    description: snap[6]['description'],
                                    descriptioneng: snap[6]['descriptioneng'],
                                    shop: snap[6]['shop'],
                                    shoplink: snap[6]['shoplink'],
                                    img: snap[6]['img'],
                                    img1: snap[6]['img1'],
                                    img2: snap[6]['img2'],
                                    img3: snap[6]['img3'],
                                    img4: snap[6]['img4'],
                                    img5: snap[6]['img5'],
                                  ),
                                );
                              }else if(value == 8){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[7]['id'],
                                    shortname: snap[7]['shortname'],
                                    name: snap[7]['name'],
                                    nameeng: snap[7]['nameeng'],
                                    description: snap[7]['description'],
                                    descriptioneng: snap[7]['descriptioneng'],
                                    shop: snap[7]['shop'],
                                    shoplink: snap[7]['shoplink'],
                                    img: snap[7]['img'],
                                    img1: snap[7]['img1'],
                                    img2: snap[7]['img2'],
                                    img3: snap[7]['img3'],
                                    img4: snap[7]['img4'],
                                    img5: snap[7]['img5'],
                                  ),
                                );
                              }else if(value == 9){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[8]['id'],
                                    shortname: snap[8]['shortname'],
                                    name: snap[8]['name'],
                                    nameeng: snap[8]['nameeng'],
                                    description: snap[8]['description'],
                                    descriptioneng: snap[8]['descriptioneng'],
                                    shop: snap[8]['shop'],
                                    shoplink: snap[8]['shoplink'],
                                    img: snap[8]['img'],
                                    img1: snap[8]['img1'],
                                    img2: snap[8]['img2'],
                                    img3: snap[8]['img3'],
                                    img4: snap[8]['img4'],
                                    img5: snap[8]['img5'],
                                  ),
                                );
                              }else if(value == 10){
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[9]['id'],
                                    shortname: snap[9]['shortname'],
                                    name: snap[9]['name'],
                                    nameeng: snap[9]['nameeng'],
                                    description: snap[9]['description'],
                                    descriptioneng: snap[9]['descriptioneng'],
                                    shop: snap[9]['shop'],
                                    shoplink: snap[9]['shoplink'],
                                    img: snap[9]['img'],
                                    img1: snap[9]['img1'],
                                    img2: snap[9]['img2'],
                                    img3: snap[9]['img3'],
                                    img4: snap[9]['img4'],
                                    img5: snap[9]['img5'],
                                  ),
                                );
                              }else{
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[10]['id'],
                                    shortname: snap[10]['shortname'],
                                    name: snap[10]['name'],
                                    nameeng: snap[10]['nameeng'],
                                    description: snap[10]['description'],
                                    descriptioneng: snap[10]['descriptioneng'],
                                    shop: snap[10]['shop'],
                                    shoplink: snap[10]['shoplink'],
                                    img: snap[10]['img'],
                                    img1: snap[10]['img1'],
                                    img2: snap[10]['img2'],
                                    img3: snap[10]['img3'],
                                    img4: snap[10]['img4'],
                                    img5: snap[10]['img5'],
                                  ),
                                );
                              }
                            },
                          );
                        }),
                  ],
                ),
              ),
              // เนื้อหา
              SizedBox(height: size.height * 0.0009),
              Container(
                  height: size.height * 0.74,
                  width: size.width,
                  padding: const EdgeInsets.all(32.0),
                  child: FutureBuilder(
                    future: getMethod(),
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
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  TypeDetail.routeName,
                                  arguments: Typebetta(
                                    id: snap[index]['id'],
                                    shortname: snap[index]['shortname'],
                                    name: snap[index]['name'],
                                    nameeng: snap[index]['nameeng'],
                                    description: snap[index]['description'],
                                    descriptioneng: snap[index]['descriptioneng'],
                                    shop: snap[index]['shop'],
                                    shoplink: snap[index]['shoplink'],
                                    img: snap[index]['img'],
                                    img1: snap[index]['img1'],
                                    img2: snap[index]['img2'],
                                    img3: snap[index]['img3'],
                                    img4: snap[index]['img4'],
                                    img5: snap[index]['img5'],
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.network('${snap[index]['img']}',
                                    fit: BoxFit.fill,
                                  ),
                                  ListTile(
                                    leading: Icon(
                                      Icons.article_rounded,
                                      color: Colors.brown.shade400,
                                      size: 35.0,
                                    ),
                                    title: Text(
                                      '${snap[index]['shortname']}',
                                      style: TextStyle(
                                        color: Colors.brown.shade600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${snap[index]['nameeng']}',
                                      style: TextStyle(
                                        color: Colors.brown.shade400,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )),
            ],
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
              onPressed: () => {},
              padding: const EdgeInsets.all(3.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: const <Widget>[
                  Icon(
                    TablerIcons.fish,
                    size: 40.0,
                    color: Colors.amberAccent,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "สายพันธุ์ปลากัด",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 14.0),
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
              padding: const EdgeInsets.all(3.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: const <Widget>[
                  Icon(
                    Icons.menu_book,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "โรคและการดูแล",
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
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
