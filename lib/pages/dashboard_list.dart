import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State {
  List getJSON;

  Future getData() async {
    http.Response hasil = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/todos"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      getJSON = json.decode(hasil.body);
    });
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GET JSON TODOS"),
        backgroundColor: Color(0XFF096D65),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: getJSON == null ? 0 : getJSON.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: const Icon(Icons.check_circle),
                subtitle: Text('Your Activity'),
                title: Text(getJSON[i]['title']),
              );
            }),
      ),
    );
  }
}
