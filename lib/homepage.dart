import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/album.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiUrl = 'https://jsonplaceholder.typicode.com/albums/1';
  Future<Album> fetchDatas() async {
    final response = await http.get(Uri.parse(apiUrl));

    Map<String, dynamic> responseJson = jsonDecode(response.body);
    return Album.fromJson(responseJson);

    // if (response.statusCode == 200) {
    //   return Album.fromJson(jsonDecode(response.body));
    // } else {
    //   print('Error Getting Data');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Place holder'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: fetchDatas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
