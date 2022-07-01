import 'dart:convert';
import 'dart:ui';
import 'package:project_betta/pages/about/aboutcare.dart';
import 'package:project_betta/pages/about/aboutdisease.dart';
import 'package:project_betta/pages/home/home.dart';
import 'package:project_betta/pages/typebetta/typedetailEng.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_betta/pages/typebetta/type.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../model/typeclass.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class TypeDetail extends StatefulWidget {
  static const routeName = '/typedetail';

  const TypeDetail({Key? key}) : super(key: key);

  @override
  State<TypeDetail> createState() => _TypeDetailState();
}

class _TypeDetailState extends State<TypeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgbetta.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              header(),
              name(),
              imagebetta(),
              Expanded(child: description()),
            ],
          ),
        ),
      ),
    );
  }

  Widget imagebetta() {
    final type = ModalRoute.of(context)!.settings.arguments as Typebetta;

    var imgList = [
      type.img1,
      type.img2,
      type.img3,
      type.img4,
      type.img5,
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: CarouselSlider.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              imgList[index],
              fit: BoxFit.fill,
            ),
          );
        },
        options: CarouselOptions(
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget header() {
    final type = ModalRoute.of(context)!.settings.arguments as Typebetta;

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color(0xff95D1CC),
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
                    return const TypeBetta();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 30.0,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  type.shortname,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                Text(
                  type.nameeng,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
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
              if (value == 1) {
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
              } else if (value == 2) {
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
              } else if (value == 3) {
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
              } else {
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
    );
  }

  Widget name() {
    final type = ModalRoute.of(context)!.settings.arguments as Typebetta;

    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              type.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget description() {
    final type = ModalRoute.of(context)!.settings.arguments as Typebetta;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.blue.shade100.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topLeft:  Radius.circular(40.0),
              topRight: Radius.circular(40.0))
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              type.description,
              maxLines: 60,
              overflow: TextOverflow.clip,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(height: 8),
            shop(),
            const SizedBox(height: 8),
            Divider(
              height: 10,
              thickness: 3,
              color: Colors.blueGrey.shade300,
            ),
            const SizedBox(height: 8),
            Text(
              type.descriptioneng,
              maxLines: 60,
              overflow: TextOverflow.clip,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
            shop2(),
          ],
        ),
      ),
    );
  }

  Widget shop() {
    final type = ModalRoute.of(context)!.settings.arguments as Typebetta;

    return Row(
      children: [
        const Text("สนใจซื้อได้ที่ : ",
            style: TextStyle(color: Colors.black87, fontSize: 16)),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => launch(type.shoplink),
          child: Text(
            type.shop,
            style: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget shop2() {
    final type = ModalRoute.of(context)!.settings.arguments as Typebetta;

    return Row(
      children: [
        const Text("Shop : ",
            style: TextStyle(color: Colors.black87, fontSize: 16)),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => launch(type.shoplink),
          child: Text(
            type.shop,
            style: TextStyle(
              color: Colors.blue.shade800,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
