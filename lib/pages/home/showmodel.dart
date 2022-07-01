import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_betta/pages/home/home.dart';


class ShowModel extends StatefulWidget {
  static const routeName = '/showmodel';
  const ShowModel({Key? key}) : super(key: key);

  @override
  State<ShowModel> createState() => _ShowModelState();
}

class _ShowModelState extends State<ShowModel> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // ย้อนกลับไปหน้า HOME & หัวข้อ
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
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
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 30.0,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          ' ผลการทำนาย ',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // เนื้อหา
                  SizedBox(height: size.height*0.2),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
