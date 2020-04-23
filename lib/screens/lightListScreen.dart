import 'package:flutter/material.dart';
import 'package:huepersonal/DUMMY.dart';
import 'package:huepersonal/models/light.dart';
import 'package:huepersonal/models/lightList.dart';
import 'package:huepersonal/widgets/lightListItem.dart';
import 'package:provider/provider.dart';

class LightListScreen extends StatefulWidget {
  @override
  _LightListScreenState createState() => _LightListScreenState();
}

class _LightListScreenState extends State<LightListScreen> {
  @override
  Widget build(BuildContext context) {
    //List<Light> lights = Provider.of<LightList>(context).lights;
    List<Light> lights = Dummy.LIGHTS;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lights"),
      ),
      body: ListView.builder(
        itemCount: lights.length,
        itemBuilder: (ctx, i) => LightListItem(lights[i]),
      ),
    );
  }
}