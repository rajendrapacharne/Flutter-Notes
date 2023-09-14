import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'YOUR_URL_HERE'; // Replace with the URL you want to download content from
  String downloadStatus = '';

  Future<void> downloadContent() async {
    try {
      final dio = Dio();
      final response = await dio.get(url);

      // Process the response as needed here, e.g., save it to a file.
      // final file = File('downloaded_content.txt');
      // await file.writeAsBytes(response.data);

      setState(() {
        downloadStatus = 'Downloaded content';
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        downloadStatus = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content Downloader'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                url = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter URL',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: downloadContent,
            child: Text('Download Content'),
          ),
          SizedBox(height: 20),
          Text(
            downloadStatus,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
