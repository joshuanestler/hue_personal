import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BridgeDiscoveryScreen extends StatefulWidget {
  @override
  _BridgeDiscoveryScreenState createState() => _BridgeDiscoveryScreenState();
}

class _BridgeDiscoveryScreenState extends State<BridgeDiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bridge Discovery"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(60)
                    ),
                    child: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 5),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text("Philips", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.1), fontSize: 30, fontWeight: FontWeight.w900),),
                        ),
                      ),
                    ),
                  ),
                ),
            ),
            RaisedButton(onPressed: () {}, child: Text("Automatic Discovery"),)
          ],
        ));
  }
}
