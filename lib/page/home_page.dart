import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random/domain/smite_god.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<SmiteGod>> _gods;

  @override
  void initState() {
    super.initState();
    _gods = SmiteGod.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Flexible(
            child: FutureBuilder<List<SmiteGod>>(
              future: _gods,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Text(snapshot.data![0].toJson().toString());
                } else if (snapshot.hasError) {
                  return Text(jsonEncode(snapshot.stackTrace));
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
