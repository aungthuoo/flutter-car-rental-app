/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import './gtypography.dart';
import '../network_image.dart';

class GroceryListItemTwo extends StatelessWidget {
  const GroceryListItemTwo({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.image,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    double imageWidth = (MediaQuery.of(context).size.width / 3) - 20;
    double imageHeight = (MediaQuery.of(context).size.width / 3) - 20;

    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 8.0,
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10.0),
          Container(
              height: imageHeight,
              child: PNetworkImage(
                image,
                height: imageWidth,
                width: imageHeight,
              )),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new GroceryTitle(text: title),
                new GrocerySubtitle(text: subtitle)
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                ),
                color: Colors.green,
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
