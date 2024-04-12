import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/services/requests_http.dart';
import 'package:flutter_application_1/views/detail_product.dart';
import 'package:flutter_application_1/views/test_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.builder(
                itemCount: 12,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailProduct(
                              title: snapshot.data[index]['title'],
                              price: snapshot.data[index]['price'],
                              img: Image.network(
                                snapshot.data[index]['images'][0],
                                width: 200,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              description: snapshot.data[index]['description'],
                              rating: snapshot.data[index]['rating'],
                            ),
                          ),
                        );
                      },
                      child: Card(
                          elevation: 10,
                          color: Colors.yellow,
                          child: Column(
                            children: [
                              Image.network(
                                snapshot.data[index]['images'][0],
                                width: 300,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text('${snapshot.data[index]['title']}'),
                              Text('${snapshot.data[index]['price']}'),
                            ],
                          )),
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
