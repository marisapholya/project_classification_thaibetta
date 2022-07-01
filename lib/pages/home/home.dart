import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:project_betta/pages/about/about.dart';
import 'package:project_betta/pages/typebetta/type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:project_betta/pages/typebetta/typedetail.dart';
import 'package:tflite/tflite.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import '../../model/typeclass.dart';
import '../about/aboutcare.dart';
import '../about/aboutdisease.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading = true;
  late File _image;
  File? imageFile;
  List? _output;
  final picker = ImagePicker();
  String _name = "";
  String _nameth = "";
  String _confidence = "";
  var id;
  String detail = "";
  XFile? _pickedFile;


  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  // Model
  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model/modelver3.tflite",
        labels: "assets/model/labels.txt");
  }

  _getFromCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
    //cropImage(image.path);
  }

  _getFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
    //cropImage(image.path);
  }

  classifyImage(File _image) async {
    var output = await Tflite.runModelOnImage(
        path: _image.path,
        numResults: 3,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _loading = false;
      _output = output!;
      String str = _output![0]['label'];
      _name = str.substring(0);
      _confidence = _output != null ? (_output![0]['confidence']*100.0).toString().substring(0,5) + "%" : "";

        if(_name == "Butterfly Betta"){
          _nameth = "ปลากัดลายผีเสื้อ";
          id = 8;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Crowntail Betta" ){
          _nameth = "ปลากัดหางมงกุฏ";
          id = 5;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Double Tail Betta"){
          _nameth = "ปลากัดสองหาง";
          id = 6;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Dumbo Betta"){
          _nameth = "ปลากัดหูช้าง";
          id = 10;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Galaxy Betta"){
          _nameth = "ปลากัดลายหินอ่อน";
          id = 7;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Giant Betta"){
          _nameth = "ปลากัดยักษ์";
          id = 9;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Halfmoon Betta"){
          _nameth = "ปลากัดหางพระจันทร์ครึ่งซีก";
          id = 4;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Imbellis Betta"){
          _nameth = "ปลากัดป่า";
          id = 0;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "No Betta"){
          _nameth = "ไม่ใช่ปลากัด";
          id = 11;
          detail = " ";
        }else if(_name == "Shotfin Splendens Betta"){
          _nameth = "ปลากัดลูกหม้อ";
          id = 1;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Smaragdina Betta"){
          _nameth = "ปลากัดสังกะสี";
          id = 2;
          detail = "รายละเอียดเพิ่มเติม";
        }else if(_name == "Splendens Betta"){
          _nameth = "ปลากัดจีน";
          id = 3;
          detail = "รายละเอียดเพิ่มเติม";
        }
    });
    print(_output);
  }



  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  // database type betta

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
    return _output == null
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.040),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white70,
                              width: 3.0,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: const Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/pic2.png"),
                              width: 200.0,
                              height: 200.0,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.001),
                        // text box
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "BettaSify",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 40.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // button camera / gallery
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _getFromCamera();
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: 120.0,
                                      height: 120.0,
                                      child: Image.asset("assets/images/camera.png"),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  const Text(
                                    "ถ่ายรูป\nTake a photo",
                                    style: TextStyle(color: Colors.brown, fontSize: 14.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.1),
                            InkWell(
                              onTap: () {
                                _getFromGallery();
                              },
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: 120.0,
                                      height: 120.0,
                                      child: Image.asset("assets/images/photo.png"),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  const Text(
                                    "เลือกรูปภาพ\nUpload an Image",
                                    style: TextStyle(color: Colors.brown, fontSize: 14.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        const Text(
                          "เพื่อทำนายสายพันธุ์ปลากัดในประเทศไทย",
                          style:
                          TextStyle(color: Colors.brown, fontSize: 18.0),
                        ),
                        const Text(
                          "Predict betta fish in Thailand.",
                          style:
                          TextStyle(color: Colors.brown, fontSize: 16.0),
                        ),
                      ],
                    ),
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.0),
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
                          Icons.home_rounded,
                          size: 40.0,
                            color: Colors.amberAccent,
                        ),
                        SizedBox(height: 3),
                        Text(
                          "หน้าหลัก",
                          style: TextStyle(color: Colors.amberAccent,fontSize: 14.0),
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height*0.01),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 30.0,
                              color: Colors.brown.shade700,
                            ),
                          ),
                          Text(
                            "ผลการทำนาย",
                            style:TextStyle(
                              fontSize: 30.0,
                              color: Colors.brown.shade700,
                            ),
                          ),
                          PopupMenuButton<int>(
                            child: Icon(
                              Icons.menu_rounded,
                              size: 30.0,
                              color: Colors.brown.shade700,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
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
                    SizedBox(height: size.height*0.001),
                    Container(
                      width: double.infinity,
                      height: size.height*0.45,
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.file(
                          _image,
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(8.0),
                      ),
                    ) ,
                    SizedBox(height: size.height*0.0001),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            _nameth,
                            style:TextStyle(
                              fontSize: 30.0,
                              color: Colors.brown.shade700,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            _name,
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.brown.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.01),
                    Center(
                      child: Text(
                        "ความแม่นยำ : $_confidence",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.brown.shade700,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.01),
                    FutureBuilder(
                        future: getMethod(),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          List snap = snapshot.data ?? [];
                          return InkWell(
                            onTap: (){
                              if(id==0){
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
                              }else if(id == 1){
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
                              }else if(id == 2){
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
                              }else if(id == 3){
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
                              }else if(id == 4){
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
                              }else if(id == 5){
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
                              }else if(id == 6){
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
                              }else if(id == 7){
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
                              }else if(id == 8){
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
                              }else if(id == 9){
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
                              }else if(id == 10){
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
                              }else{
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
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  detail,
                                  style:TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.brown.shade700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                    SizedBox(height: size.height*0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _getFromCamera();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              child: Image.asset("assets/images/camera.png"),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.1),
                        InkWell(
                          onTap: () {
                            _getFromGallery();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              child: Image.asset("assets/images/photo.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

}

