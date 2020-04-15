/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import '../network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroceryCategory extends StatelessWidget {
  final String image, title;
  final Color backgroundColor;

  const GroceryCategory(
      {Key key,
      @required String this.image,
      @required String this.title,
      Color this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        margin: EdgeInsets.symmetric(vertical: 0.0),
        padding: EdgeInsets.only( top : 10.0, bottom: 10.0),
        width: 100,
        child: Column(
          children: <Widget>[
            //PNetworkImage(image), 
            CachedNetworkImage(
              imageUrl:
                  "${image}",
              placeholder: (context, url) => Container(
                height: 80,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(
                "assets/app-icon.jpg",
                fit: BoxFit.fitHeight,
                height: 80,
                width: double.infinity,
              ),
              fit: BoxFit.fitHeight,
              height: 80,
              width: double.infinity,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 12,
              )
              ),
            )
          ],
        ),
      ),
    );
    
  }
}
