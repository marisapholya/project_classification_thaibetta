import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_betta/model/bettacare.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_betta/pages/about/aboutcare.dart';
import 'dart:ui';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:project_betta/pages/typebetta/type.dart';
import '../home/home.dart';
import 'aboutdisease.dart';

class AboutCareDetail extends StatefulWidget {
  static const routeName = '/aboutcaredetail';

  const AboutCareDetail({Key? key}) : super(key: key);

  @override
  State<AboutCareDetail> createState() => _AboutCareDetailState();
}

class _AboutCareDetailState extends State<AboutCareDetail> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgeq.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              header(),
              name(),
              imagecare(),
              Expanded(child: description()),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    final care = ModalRoute.of(context)!.settings.arguments as Bettacare;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    return const AboutCare();
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
                  care.name,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                Text(
                  care.nameeng,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
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
    );
  }

  Widget imagecare() {

    final care = ModalRoute.of(context)!.settings.arguments as Bettacare;

    var imgList = [
      care.img1,
      care.img2,
      care.img3,
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

  Widget name() {
    final care = ModalRoute.of(context)!.settings.arguments as Bettacare;

    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              care.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget description() {
    final care = ModalRoute.of(context)!.settings.arguments as Bettacare;

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
              care.description,
              maxLines: 60,
              overflow: TextOverflow.clip,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Divider(
              height: 10,
              thickness: 3,
              color: Colors.blueGrey.shade300,
            ),
            const SizedBox(height: 8),
            Text(
              care.descriptioneng,
              maxLines: 60,
              overflow: TextOverflow.clip,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }


}
