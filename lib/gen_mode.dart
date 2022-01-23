// ignore_for_file: camel_case_types
// In Visual Studio: Ctrl+K+C will comment, Ctrl+K+U Will uncomment
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/data_load/data_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'person_back.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:coop_hall_of_fame/search/search_mode.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'dart:math';
import 'frameback.dart';
import 'package:flip_card/flip_card.dart';

class gen_mode extends StatefulWidget {
  final String? appTitle;

  final String? fileName;
  final Color? bandcol;

  const gen_mode(
      {@required this.appTitle,
      @required this.fileName,
      @required this.bandcol,
      Key? key})
      : super(key: key);

  @override
  _gen_modeState createState() => _gen_modeState();
}

class _gen_modeState extends State<gen_mode> {
  List<List> datas = [];
  List<List> data = [
    [
      "01/21/2021",
      "Jessica Wan",
      "Email+messenger+linkedin+facebook",
      "jessica.wan0825@gmail.com+Send me a message in messenger+www.linkedin.com/in/jessicawan0825+https://www.facebook.com/jessica.wan.8",
      "Tianjin Zhongwang Aluminium co. ltd",
      "2 nd",
      "4 month",
      "hands-on+SEM",
      "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/jyw.jpg?raw=true",
      "sem",
      "f1",
      "purple",
      "ZXC",
      "1. Performed failure and fracture analysis for 2000 series aluminum coils and plates \n2. Operated the scanning electron microscope (SEM) on over 50 specimens for microstructure and chemical composition analysis (EDS)\n3.Developed and updated Standard Operating Procedures (SOPs) for the manufacture of 2024-T3 and 7075-T4 aluminum alloys"
    ],
    [
      "01/21/2022",
      "Melaina Del Grosso",
      "Messenger+linkedin+Email+facebook+discord",
      "Send me a message on messenger+www.linkedin.com/in/melaina-delgrosso+melaina.delgrosso@gmail.com+https://www.facebook.com/melaina.delgrosso/+Melaina#1900",
      "biotechfield",
      "1 st",
      "4 month",
      "experiential",
      "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/md.jpg?raw=true",
      "biosen",
      "f1",
      "blue",
      "ZXC",
      "1. Designed, preformed and analyzed experiments on product failure\n2.Organized team projects by managing, filling, and scheduling product production"
    ],
    [
      "01/22/2022",
      "Lily Baker",
      "Email + Messenger + linkedin + facebook",
      "lilyannebaker33@gmail.com + Send me a message on messenger+www.linkedin.com/in/lilybaker+https://www.facebook.com/profile.php?id=100007672845726",
      "Collins Aerospace + CAMC",
      "3 rd year + 3 rd year",
      "8 month + 2 month",
      "Chemical compliance + environmental sustainability",
      "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/lb.jpg?raw=true",
      "chem1",
      "l1",
      "blue",
      "x",
      "1. Chemical compliance, ensuring that all the materials in our designs comply with global environmental, health, and sustainability standards\n2.Identify materials of concern in the products, processes and parts we use, design and manufacture \n3.Research alternative products and materials to replace any hazardous substances we are trying to reduce, depending on global environmental, health, and sustainability guidelines + 1.Formal training in cutting, cold mounting, polishing and etching corroded Aluminum alloy samples \n2.Metallurgical examination with SEM and Light Optical Spectroscopy\n3. Research on corrosion, corrosion prevention and related matters in the field of Materials Engineering at the Centre for Automotive Materials and Corrosion (CAMC) at McMaster."
    ]
  ];
  // List<List> data = [
  //   [
  //     "11/21/2021",
  //     "Ray Lyu",
  //     "Email",
  //     "lyuz11@mcmaster.ca",
  //     "Apotex",
  //     "3rd",
  //     "12 month",
  //     "Manufacutirng+Pharmeutical",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/r.jpg?raw=true",
  //     "Phar",
  //     "g1",
  //     "Indigo",
  //     "ZXC",
  //     "qqq"
  //   ],
  //   [
  //     "11/21/2021",
  //     "Kevin Lassel ",
  //     "Email",
  //     "@mcmaster.ca",
  //     "ArcelorMittal Dofasco",
  //     "3rd year",
  //     "16 months",
  //     "Innovative+Welcoming ",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/kl.png?raw=true",
  //     "steel",
  //     "l1",
  //     "orange",
  //     "ZXC",
  //     "I work on the development of new products either collecting analyzing and organizing data within excel or through preparing and imaging samples using various techniques."
  //   ],
  //   [
  //     "01/04/2022",
  //     "Vaytiere Iglesias",
  //     "Email+LinkedIn+Discord+person",
  //     "Vay_tiere@hotmail.com+https://www.linkedin.com/in/vaytiereiglesias+DarthVader+Meet me in person",
  //     "Centre for Automotive Materials and Corrosion",
  //     "2nd & 3rd year",
  //     "4 + 4 months",
  //     "Unique",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/vl.jpeg?raw=true",
  //     "unique",
  //     "e1",
  //     "purple",
  //     "X",
  //     "- Worked with 3G advanced high steels to find the properties in bending\n- trained on optical microscopy equipment to observe the microstructure (SEM and optical microscopes!)\n- worked in a learning filled environment with many experts in their fields of metallurgy ",
  //   ],
  //   [
  //     "01/08/2022",
  //     "Arthur Carvalho",
  //     "Email",
  //     "arthur@sinistro.com.br",
  //     "Stackpole Internation",
  //     "3rd year",
  //     "15 Months",
  //     "Specialized+demanding",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/ac.jpg?raw=true",
  //     "additive",
  //     "o1",
  //     "indigo",
  //     "X",
  //     "1. Key member of the research focused division.\n2.Responsible for creating comprehensive reports and aid in the development of specialized products. \n3.Conducted a variety of mechanical and metallurgical tests"
  //   ],
  //   [
  //     "01/08/2022",
  //     "Alexi Buenaventura",
  //     "Email",
  //     "buenavea@mcmaster.ca",
  //     "Kinectrics",
  //     "3rd year",
  //     "16 months",
  //     "hands-on + experiential + active mentorship + unconventional",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/ab.jpg?raw=true",
  //     "handson",
  //     'f1',
  //     "indigo",
  //     "X",
  //     "1. Provide support to engineers by performing project management duties such as ressourcing allocation, tracking financials, and develping test programs and/or systems in the electricty and nuclear industry \n2. Provide technical lab support by performing a variety of activies such as strain gauging, mechanical testing, monitoring and operation of different systems and more\n3. Orange Badge, Strain Gauge, Working at Heights, Incoming Inspector qualified "
  //   ],
  //   [
  //     "01/08/2022",
  //     "Savannah Letendre",
  //     "Email",
  //     "savannahletendree@gmail.com",
  //     "ArcelorMittal Dofasco",
  //     "3rd year",
  //     "16 month",
  //     "Hands on+Experiential",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/sl.jpg?raw=true",
  //     "rd",
  //     "l1",
  //     "green",
  //     "X",
  //     "1. Metallurgical Sample Preparation\n2.Defect Analysis"
  //   ],
  //   [
  //     "01/10/2022",
  //     "Chiara Choi",
  //     "Email",
  //     "choic14@mcmaster.ca",
  //     "IESO",
  //     "3rd year",
  //     "8 month",
  //     "Innovative+Business-oriented",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/cc.jpg?raw=true",
  //     "business",
  //     "e1",
  //     "purple",
  //     "X",
  //     "1. Supported in managing 9.5M annual capital portfolio of the IESO’s Grid Innovation Fund.\n2. Assisted in managing the active portfolio of 43 pilots, as well as supported in the development of the 2021 Joint Targeted Call: DER Integration between the IESO and Ontario Energy Board."
  //   ],
  //   [
  //     "01/10/2022",
  //     "Zayaan Khan",
  //     "Email+LinkedIn+person",
  //     "zayaankhan444@gmail.com+https://www.facebook.com/profile.php?id=100017888445615+Person",
  //     "Stackpole Inc",
  //     "3rd year",
  //     "16 month",
  //     "Technical+Hands On",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/zk.jpg?raw=true",
  //     "powder",
  //     "g1",
  //     "green",
  //     "X",
  //     "1. Failure Analysis of Failed Rotor Parts \n2. Analysis of Heat Treatments Cycles on Powder Metals \n3. Material Development for Automotive Applications "
  //   ],
  //   [
  //     "01/14/2022",
  //     "Viraj Whabi",
  //     "Messenger+Linkedin+Email",
  //     "Message me in Messenger!+https://www.linkedin.com/in/viraj-whabi/+virajwhabi@gmail.com",
  //     "Celestica",
  //     "3 rd year",
  //     "16 month",
  //     "challenging+game-changing+novel+action-oriented",
  //     "https://github.com/RayLyu-Mac/Matls_Coop_HallofFame/blob/main/ast/profile/vw.jpeg?raw=true",
  //     "cpu",
  //     "l1",
  //     "purple",
  //     "X",
  //     "1. I had the great opportunity to work in a laboratory environment to evaluate quality of electronic components using optical, x-ray and cross-sectional analysis.\n2. I grew experienced with testing physical properties of polymers, metals, and ceramics through the use of an Instron mechanical tester and other mechanical apparatus.\n3.I gained a proficiency in using energy dispersive X-ray spectroscopy (EDX) and Fourier-transform infrared spectroscopy (FTIR) to conduct unknown residue and material failure investigations on customer products."
  //   ]
  // ];
  List<String> comp = [];
  List<String> datasplit = [];
  List<RotateAnimatedText> typ = [];
  List<String> imgs = [];

  List<String> hash = [];
  List<String> back_pics = [];
  List<String> join_time = [];
  List<String> contact = [];
  List<String> cols = [];
  List<String> contactD = [];
  Color b = colorS[
      colorS.keys.toList()[Random().nextInt(colorS.keys.toList().length)]]!;

  bool isLoad = true;
  double _screenWidth = 0;
  double _screenH = 0;
  TextEditingController controller = TextEditingController();

  // load() async {
  //   final bio_data = await rootBundle.loadString(widget.fileName!);
  //   setState(() {
  //     datas = const CsvToListConverter().convert(bio_data);
  //     datasplit = datas[0].toString().split("*");
  //     for (var k = 1; k < datasplit.length - 1; k++) {
  //       data.add(datasplit[k].toString().split(","));
  //     }
  //     for (var o = 0; o < data.length; o++) {
  //       imgs.add(data[o][8].toString().replaceAll(" ", ""));
  //       cols.add(data[o][11].toString().toLowerCase().replaceAll(" ", ""));
  //       comp.add(data[o][4]);
  //       back_pics.add(data[o][9].toString().toLowerCase().replaceAll(" ", ""));
  //       typ.add(RotateAnimatedText(data[o][7],
  //           textStyle: TextStyle(
  //               color: Colors.grey.shade100,
  //               fontSize: _screenH / 30)));
  //       typ.add(RotateAnimatedText(data[o][4],
  //           textStyle: TextStyle(
  //               color: Colors.grey.shade100,
  //               fontSize: _screenH / 30)));
  //       hash.add(data[o][7]);
  //     }
  //   });
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenH = MediaQuery.of(context).size.height;
    _screenWidth = 16 / 10 * _screenH;
  }

  @override
  void initState() {
    // TODO: implement initState
    // load();
    super.initState();
    setState(() {
      for (var o = 0; o < data.length; o++) {
        imgs.add(data[o][8].toString().replaceAll(" ", ""));
        cols.add(data[o][11].toString().toLowerCase().replaceAll(" ", ""));
        back_pics.add(data[o][9].toString().toLowerCase().replaceAll(" ", ""));
        comp.add(data[o][4]);
        typ.add(RotateAnimatedText(data[o][7],
            textStyle: TextStyle(
                color: Colors.grey.shade100, fontWeight: FontWeight.bold)));
        typ.add(RotateAnimatedText(data[o][4],
            textStyle: TextStyle(
                color: Colors.grey.shade100, fontWeight: FontWeight.bold)));
        hash.add(data[o][7]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: widget.bandcol!,
            title: SelectableText(
              widget.appTitle!,
              style: TextStyle(fontFamily: "b1"),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showGeneralDialog(
                        barrierColor: b,
                        transitionDuration: Duration(milliseconds: 300),
                        barrierDismissible: true,
                        barrierLabel: '',
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Container();
                        },
                        transitionBuilder: (context, a1, a2, widgets) {
                          return Transform.scale(
                              scale: a1.value,
                              child: Opacity(
                                  opacity: a1.value,
                                  child: SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 8, color: b),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    clipBehavior: Clip.hardEdge,
                                    backgroundColor: b.withOpacity(0.8),
                                    elevation: 20,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: _screenWidth / 15,
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          " Looking for: ",
                                          style: TextStyle(
                                              fontFamily: "b1",
                                              color: Colors.grey.shade100,
                                              fontSize: _screenH / 28,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width: 15, height: _screenH / 8),
                                        AnimatedTextKit(
                                            repeatForever: true,
                                            animatedTexts: typ)
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        width: _screenWidth / 1.5,
                                        height: _screenH / 1.5,
                                        child: search_main(
                                            border: b,
                                            controller: controller,
                                            compName: comp,
                                            searchS: hash,
                                            whole: data),
                                      )
                                    ],
                                  )));
                        });
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
          ),
          body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: (_screenH * 3.4 / _screenWidth),
              padding: EdgeInsets.symmetric(
                  horizontal: _screenWidth / 40, vertical: _screenH / 40),
              children: List.generate(data.length, (index) {
                return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    columnCount: 1,
                    child: ScaleAnimation(
                        child: FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            front: Person_back(
                                width: 0,
                                heigt: 0,
                                iconcolor: colorD[cols[index]],
                                year: data[index][5].toString(),
                                length: data[index][6].toString(),
                                spec: data[index][13].toString(),
                                border_c: colorL[cols[index]],
                                has_tag: hash[index].toString(),
                                nameFont: data[index][10].toString(),
                                contactType:
                                    data[index][2].toString().split("+"),
                                contactInfo:
                                    data[index][3].toString().split("+"),
                                join_date: data[index][0].toString(),
                                info: "Company: ${comp[index]}",
                                name: data[index][1].toString(),
                                typ: back_pics[index],
                                profile_img: imgs[index]),
                            back: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(imgs[index])),
                                  color: colorL[cols[index]]!.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    width: 5,
                                    color: colorL[cols[index]]!,
                                  )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        "McMaster MSE Co-op Honor\n${widget.appTitle} :#${data[index][12].toString()}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "s5",
                                            fontWeight: FontWeight.w800,
                                            fontSize: _screenH / 24,
                                            color:
                                                Colors.black.withOpacity(0.4))),
                                    Text(
                                        "\nJoined @${data[index][0].toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "c1",
                                            fontSize: _screenH / 25,
                                            color:
                                                Colors.black.withOpacity(0.4)))
                                  ],
                                ),
                              ),
                            ))));
              })));
    } else {
      return Container(
        color: Colors.white,
        width: 500,
        height: 500,
        child: Column(
          children: [
            Text(datas.toString()),
            CircularProgressIndicator(),
            Text(data.toString() + "QQQ\n" + datas.toString())
          ],
        ),
      );
    }
    ;
  }
}
