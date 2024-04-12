import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/detail_product.dart';

class TestView extends StatefulWidget {

  String title;
  
  TestView({super.key, required this.title});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailProduct(),),);
          },
          child: Text('Back to details'),
        ),
      ),
    );
  }
}