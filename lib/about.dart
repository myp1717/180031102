import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: new Text(
          'About',
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: new Stack(children: [
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Container(
                      width: 150.0,
                      height: 60.0,
                      alignment: Alignment.center,
                      child: new Text(
                        'Nama : Komang Martin Youth Pranatha ',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: Colors.grey),
                    )),
                  ],
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Container(
                      width: 150.0,
                      height: 60.0,
                      alignment: Alignment.center,
                      child: new Text(
                        'Nim : 180031102',
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: Colors.grey),
                    )),
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
