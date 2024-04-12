import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/test_view.dart';

class DetailProduct extends StatefulWidget {

  String title;
  int price;
  Image img;
  String description;
  double rating;

  DetailProduct({super.key, required this.title, required this.price, required this.img, required this.description, required this.rating});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 300,
          child: Card(
                elevation: 10,
                color:Colors.yellow,
                child: Column(
                  children: [
                    widget.img,
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(widget.title),
                    ),
                    Text('R\$: ${widget.price.toString()}'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(widget.description),
                    ),
                    Text('Rating: ${widget.rating.toString()}'),
                  ],
                ) 
              ),
        ),
      ),
    );
  }
}