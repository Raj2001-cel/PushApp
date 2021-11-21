import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';
import 'itemwidget.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Details Page')),
      backgroundColor: Colors.black12,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [

            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.deepPurpleAccent,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       //all excercises of the select theme will be shown
       child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
           ? ListView.builder(
         itemCount: CatalogModel.items.length,
         itemBuilder: (context, index) => ItemWidget(
           item: CatalogModel.items[index],
         ),
       )
           : Center(
         child: CircularProgressIndicator(),
       ),
     ),

    );
  }
}