import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProductDetail extends StatelessWidget {
  final productdata;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  ProductDetail(this.productdata);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: new Text(
          'Product Info',
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: new Stack(children: [
        new Container(
          color: Colors.black.withOpacity(0.5),
        ),
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                  ),
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    image: new DecorationImage(
                        image: new NetworkImage(productdata['link_gambar']),
                        fit: BoxFit.scaleDown),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                        productdata['nama_produk'],
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      )),
                    ],
                  ),
                ),
                new Text(productdata['deskripsi'],
                    style: new TextStyle(
                      color: Colors.white,
                    )),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Container(
                      width: 150.0,
                      height: 60.0,
                      alignment: Alignment.center,
                      child: new Text(
                        productdata['harga'],
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: const Color(0xaa3C3261)),
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
