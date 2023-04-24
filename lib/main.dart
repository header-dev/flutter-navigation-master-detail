import 'dart:math';

import 'package:app1205/ProductDetail.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(App1205());
}

class App1205 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/product_detail': (context) => ProductDetail()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  var rnd = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator Full Concept'),
      ),
      body: GridView.builder(
        itemCount: 6,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: buildGridTile(context, (index + 1), (50 + rnd.nextInt(200))),
        ),
      ),
    );
  }

  Widget buildGridTile(BuildContext context, int index, int price) => GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            'Item $index',
            textScaleFactor: 1.3,
          ),
          subtitle: Text('\$$price'),
          trailing: InkWell(
            child: Icon(
              Icons.zoom_in,
              size: 32,
              color: Colors.white,
            ),
            onTap: () => {
              Navigator.pushNamed(context, '/product_detail', arguments: {
                'id': index,
                'price': price,
              }),
            },
          ),
        ),
        child: Image.network(
          'https://picsum.photos/id/${index * 100}/250',
          fit: BoxFit.cover,
        ),
      );
}
