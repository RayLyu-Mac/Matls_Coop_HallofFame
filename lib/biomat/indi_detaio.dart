import 'package:flutter/material.dart';
import 'bio_header.dart';
import 'bio_main.dart';

class bio_page extends StatefulWidget {
  bio_page({Key? key}) : super(key: key);

  @override
  _bio_pageState createState() => _bio_pageState();
}

class _bio_pageState extends State<bio_page> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [Bio_header(), bio_main()],
    );
  }
}
