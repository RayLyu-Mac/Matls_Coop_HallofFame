import 'package:flutter/material.dart';
import 'package:coop_hall_of_fame/header_mode.dart';
import 'package:coop_hall_of_fame/gen_mode.dart';

class bio_page extends StatefulWidget {
  bio_page({Key? key}) : super(key: key);

  @override
  _bio_pageState createState() => _bio_pageState();
}

class _bio_pageState extends State<bio_page> {
  List<List<dynamic>> datas = [];
  PageController controller = PageController(initialPage: 0);
  void load_res() async {
    controller.animateTo(500,
        duration: const Duration(microseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [
        header(
            right: "true",
            back_pic: "ast/9.png",
            buttonName: "Explore Biomaterials",
            cont:
                "Biomaterials are essential in engineering devices to solve today’s healthcare challenges. Materials Engineers design and develop new biomaterials for applications in implants, tissue engineering, drug-delivery and biosensing. McMaster Materials Engineering students have completed co-ops on topics including material processing and surface modification, healthcare statistics and administration, advanced manufacturing, sensor development, and more!",
            pageTo: ElevatedButton(
              child: Text("Go Bio!",
                  style:
                      TextStyle(fontFamily: "g2", fontWeight: FontWeight.bold)),
              onPressed: load_res,
            ),
            title: "Biomaterials"),
        gen_mode(
          appTitle: "Biomaterial",
          fileName: "ast/csv/bio.csv",
        )
      ],
    );
  }
}
