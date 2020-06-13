import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'product_detail.dart';
import 'about.dart';

class ProductList extends StatefulWidget {
  @override
  ProductListState createState() {
    return new ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  var produk;
  Color mainColor = const Color(0xff3C3261);

  void getData() async {
    var data = await getJson();

    setState(() {
      produk = data['produk_list'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          // action button
          IconButton(
            icon: new Icon(
              Icons.help,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
        ],
        title: new Text(
          'Martin Food Shop',
          style: new TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ProductTitle(mainColor),
            new Expanded(
              child: new ListView.builder(
                  itemCount: produk == null ? 0 : produk.length,
                  itemBuilder: (context, i) {
                    return new FlatButton(
                      child: new ProductCard(produk, i),
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                          return new ProductDetail(produk[i]);
                        }));
                      },
                      color: Colors.white,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

Future<Map> getJson() async {
  var url = 'https://uasmobile180031102.000webhostapp.com';
  var response = await http.get(url);
  return json.decode(response.body);
}

class ProductTitle extends StatelessWidget {
  final Color mainColor;

  ProductTitle(this.mainColor);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: new Text(
        'New Product',
        style: new TextStyle(
          fontSize: 30.0,
          color: mainColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final produk;
  final i;
  Color mainColor = const Color(0xff3C3261);
  ProductCard(this.produk, this.i);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Card(
          elevation: 5,
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Container(
                    margin: const EdgeInsets.all(16.0),
                    child: new Container(
                      width: 70.0,
                      height: 70.0,
                    ),
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      color: Colors.grey,
                      image: new DecorationImage(
                          image: new NetworkImage(produk[i]['link_gambar']),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: mainColor,
                            blurRadius: 5.0,
                            offset: new Offset(2.0, 5.0))
                      ],
                    ),
                  ),
                ),
                new Expanded(
                    child: new Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: new Column(
                    children: [
                      new Text(
                        produk[i]['nama_produk'],
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                      new Padding(padding: const EdgeInsets.all(2.0)),
                      new Text(
                        produk[i]['deskripsi_singkat'] + '...',
                        maxLines: 3,
                        style: new TextStyle(
                            color: Colors.white, fontFamily: 'Arvo'),
                      ),
                      new Padding(padding: const EdgeInsets.all(5.0)),
                      new Text(
                        produk[i]['harga'],
                        style: new TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )),
              ],
            ),
          ),
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
