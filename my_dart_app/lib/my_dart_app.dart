import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



void main() {
  fetchData().then((data) {
    print('Received data: $data');
  }).catchError((error) {
    print('Error: $error');
  });
}

Future<Map<String, dynamic>> fetchData() async {
  final apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts/1'); // Example API endpoint

  try {
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      // If the HTTP request is successful, parse the JSON response
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to fetch data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
