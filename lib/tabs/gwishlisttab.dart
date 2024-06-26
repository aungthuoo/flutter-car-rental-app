/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import '../assets.dart';
import '../gwidgets/glistitem3.dart';

class GroceryWishlistTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              GroceryListItemThree(
                image: 'https://softwarezay.com/sample_images/grocery/items/watermelon.jpg',
                subtitle: "4 in a pack",
                title: "ဖရဲသီး",
              ),
              GroceryListItemThree(
                image: 'https://softwarezay.com/sample_images/grocery/items/water-apinatch.jpg',
                subtitle: "1 kg",
                title: "ကန်စွန်းရွက်",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        _buildTotals()
      ],
    );
  }

  Widget _buildTotals() {
    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: RaisedButton(
          color: Colors.green,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Add to Wishlist", style: TextStyle(color: Colors.white)),
            ],
          ),
        ));
  }
}
