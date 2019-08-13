import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

void  main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String barcode ="";
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //  User interface ===============================
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("barcode scan"),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new MaterialButton(
                      onPressed: scan,
                      child: new Text("scan"),
                  ),
                  padding: const EdgeInsets.all(0.8),
                ),
                new Text(barcode),
              ],
            ),
          ),
        ),
    );
  }
  // this is for main barcode scan ===============================
  Future scan() async{
    try{
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    }on PlatformException catch(e){

    }
  }
}

