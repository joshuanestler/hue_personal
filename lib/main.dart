import 'package:flutter/material.dart';
import 'package:huepersonal/models/lightList.dart';
import 'package:huepersonal/screens/BridgeDiscoveryScreen.dart';
import 'package:huepersonal/screens/lightListScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: LightList())
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromRGBO(40, 40, 40, 1),
        ),
        home: BridgeDiscoveryScreen(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Text("Hi"),
      )
    );
  }
  static const String username = "2Tzl7Yck4YksknR9OSBFHoCE3a1t3wTXS2sQRAGS";
}
