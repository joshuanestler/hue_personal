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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset(
                    "assets/images/hue-bridge.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                "Automatic Discovery",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1.5)),
              child: Text(
                "Enter IP Address",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
          ],
        ));
  }
}
