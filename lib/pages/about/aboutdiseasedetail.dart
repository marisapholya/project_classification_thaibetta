import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:project_betta/pages/about/aboutdisease.dart';
import '../../model/diseaseclass.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../home/home.dart';
import '../typebetta/type.dart';
import 'aboutcare.dart';

class AboutDiseaseDetail extends StatefulWidget {

  static const routeName = '/aboutdiseasedetail';

  const AboutDiseaseDetail({Key? key}) : super(key: key);

  @override
  State<AboutDiseaseDetail> createState() => _AboutDiseaseDetailState();
}

class _AboutDiseaseDetailState extends State<AboutDiseaseDetail> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgdi.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              header(),
              name(),
              imagedisease(),
              Expanded(child: description()),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    final disease = ModalRoute.of(context)!.settings.arguments as Disease;

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
                    return const AboutDisease();
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
                  disease.name,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                Text(
                  disease.nameeng,
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

  Widget name() {
    final disease = ModalRoute.of(context)!.settings.arguments as Disease;

    return Container(
      color: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              disease.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  Widget imagedisease() {

    final disease = ModalRoute.of(context)!.settings.arguments as Disease;
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.95,
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          disease.img,
          fit: BoxFit.fill,
        ),
      ),
    );

  }

  Widget description() {
    final disease = ModalRoute.of(context)!.settings.arguments as Disease;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "ลักษณะของโรค",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              disease.description,
              maxLines: 60,
              overflow: TextOverflow.clip,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "วิธีการดูแลรักษา",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              disease.treatment,
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
            const Text(
              "Detail of Disease",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              disease.descriptioneeng,
              maxLines: 60,
              overflow: TextOverflow.clip,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              "Treatment",
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              disease.treatmenteng,
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
