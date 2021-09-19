import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp firebase = await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'Random',
    home: App(firebase: firebase),
  ));
}

class App extends StatefulWidget {
  const App({Key? key, required this.firebase}) : super(key: key);

  final FirebaseApp firebase;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(widget.firebase),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.stackTrace.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const HomePage(title: 'Random');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
