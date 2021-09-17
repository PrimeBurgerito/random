import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random/domain/smite_session.dart';

import 'domain/smite_god.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<SmiteSession> _smiteSession;
  late Future<List<SmiteGod>> _gods;

  void _fetchSession() {
    setState(() {
      _smiteSession = fetchSession();
    });
  }

  void _fetchGods() {
    _smiteSession.then((value) => {
          setState(() {
            _gods = fetchGods(value.sessionId);
          })
        });
  }

  @override
  void initState() {
    super.initState();
    _smiteSession = fetchSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<SmiteSession>(
          future: _smiteSession,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.toJson().toString());
            } else if (snapshot.hasError) {
              return Text(jsonEncode(snapshot.stackTrace));
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchGods,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
