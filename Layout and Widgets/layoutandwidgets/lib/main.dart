import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Product Listing Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylish phone ever",
            price: 1000,
            image: "iphone.png",
          ),
          ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 800,
            image: "pixel.png",
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is the most productive development tool",
            price: 2000,
            image: "laptop.jpeg", // Updated image extension to jpeg
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meetings",
            price: 1500,
            image: "tablet.png",
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is a useful storage medium",
            price: 100,
            image: "pendrive.png",
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is a useful rescue storage medium",
            price: 20,
            image: "flopydrive.png", // Updated image filename
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String image;

  const ProductBox({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: 120.0,
            height: 120.0,
            child: Image.asset("assets/images/$image"), // Updated asset path
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "Price: \$$price",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
