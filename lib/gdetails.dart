import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sz_grocery/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import './gwidgets/glistitem2.dart';
import './gwidgets/gtypography.dart';
import './network_image.dart';
import 'model/post.dart';

class GroceryDetailsPage extends StatelessWidget {
  static final String path = "lib/src/pages/grocery/gdetails.dart";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
              PostBloc(httpClient: http.Client())..add(FetchPostEvent()),
              child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoaded) {
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.green,
                  title: Text("Details"),
                ),
                body: _buildPageContent(context, state.item),
              );
            }
          }
        )
    );
              
    /*        
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Details"),
      ),
      body: _buildPageContent(context),
    );
    */
  }

  Widget _buildPageContent(context, Post item) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildItemCard(context, item),
              Container(
                  padding: EdgeInsets.all(30.0),
                  child: GrocerySubtitle(
                      text:
                          "${ item.description }")),
              Container(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: GroceryTitle(text: "Related Items")),
              GroceryListItemTwo(
                  title: "ကန်စွန်းရွက်", image: "https://softwarezay.com/sample_images/grocery/items/water-apinatch.jpg", subtitle: "1 kg"),
              GroceryListItemTwo(
                  title: "ကြက်သား", image: "https://softwarezay.com/sample_images/grocery/items/chicken.jpeg", subtitle: "1 kg"),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.green,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text("Add to Cart"),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildItemCard(context, Post post) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: PNetworkImage(
                    post.image,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GroceryTitle(text: "${post.name}"),
                SizedBox(
                  height: 5.0,
                ),
                GrocerySubtitle(text: "1 kg")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
