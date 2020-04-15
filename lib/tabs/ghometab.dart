import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sz_grocery/bloc/post_bloc.dart';
import 'package:sz_grocery/model/category.dart';
import 'package:sz_grocery/model/post.dart';
import '../gdetails.dart';
import '../gwidgets/gcategory.dart';
import '../gwidgets/glistitem2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GroceryHomeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
              PostBloc(httpClient: http.Client())..add(FetchPostsEvent(1)),
              child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostError) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }
            if (state is PostLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostsLoaded) {
              
              return Scaffold(
          //drawerEdgeDragWidth: 0, // THIS WAY IT WILL NOT OPEN

          
          body: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildListHeader("CATEGORIES", "SEE ALL"),
                    _buildCategories(state.items.categories),
                  ],
                )),
                SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildListHeader("NEW ARRIVALS", "SEE ALL"),
                    _buildNewArrivalsRow(context, state.items.new_arrivals),
                  ],
                )),
                SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildListHeader("DAILY NEEDS", "SEE ALL"),
                  ],
                )),
                SliverList(
                  delegate: SliverChildListDelegate(_buildDailyNeedWidget(context, state.items.daily_needs)),
                ),
              ],
            ),
          ),
        );




              /*
              return Scaffold(
                body: ListView(
                  children: <Widget>[
                    _buildCategories(state.items.categories),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildListHeader("NEW ARRIVALS", "SEE ALL"),
                    _buildNewArrivalsRow(context, state.items.new_arrivals),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildListHeader("DAILY NEEDS", "SEE ALL"),
                    SizedBox(
                      height: 10.0,
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        _buildDailyNeedWidget(context, state.items.daily_needs),
                      ),
                    ),

                    
                    /*
                    InkWell(
                        onTap: () => _openDetailPage(context),
                        child: GroceryListItemTwo(
                            title: "Red/yellow Capsicum",
                            image: capsicum,
                            subtitle: "1 kg")),
                    InkWell(
                        onTap: () => _openDetailPage(context),
                        child: GroceryListItemTwo(
                            title: "Pineapple",
                            image: pineapple,
                            subtitle: "4 in a pack")),
                    */
                  ],
                )
              );
              */
            }

             
          },
        ), 
      );
  }


  Widget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(90.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            child: Card(
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      hintText: "Search products",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search))),
                ),
              ),
            ),
          ),
          //leading: PNetworkImage(deliveryIcon),
          leading:  Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Image.asset(
                            "assets/app-icon.jpg",
                            fit: BoxFit.cover,
                            width: 120.0,
                            height: 120.0,
                          ),
                        ),
        ),
      ),
    );
  }


  _buildDailyNeedWidget(BuildContext context, List<Post> dailyNeeds){
    List<Widget> widgets = List<Widget>();
    if (dailyNeeds.length > 0) {
      for (var i = 0; i < dailyNeeds.length; i++) {
        widgets.add(
          InkWell(
          onTap: () => _openDetailPage(context),
          child: GroceryListItemTwo(
              title: dailyNeeds[i].name, image: dailyNeeds[i].image, subtitle: "1 kg"))
        );
      }
    }
    return widgets;
  }

  Widget _buildNewArrivalsRow(BuildContext context, List<Post> newArrivals) {
    
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemExtent: (MediaQuery.of(context).size.width / 2) - 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 0, right: 0, bottom: 5, left: 0),
                    child: GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0, right: 0, bottom: 0, left: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: const Radius.circular(5.0),
                                  topRight: const Radius.circular(5.0),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${newArrivals[index].image}",
                                  placeholder: (context, url) => Container(
                                    height: 120,
                                    width: double.infinity,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    "assets/app-icon.png",
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: double.infinity,
                                  ),
                                  fit: BoxFit.fitWidth,
                                  height: 120,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0, left: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        newArrivals[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          itemCount: newArrivals.length),
    );

    
  }

  void _openDetailPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GroceryDetailsPage()));
  }

  Widget _buildListHeader(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical : 15.0),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            color: Colors.green,
            child: Text(
              left,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                right,
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildCategories(List<Category> categories) {
    List<Widget> widgets = List<Widget>();
 
    for (var i = 0; i < categories.length; i++) {
      
      widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right:0.0),
            child: GroceryCategory(
              backgroundColor: Color.fromRGBO(11, 200, 0, 0.15),
              image: categories[i].image,
              title: "${categories[i].name}",
            ),
          )
      );
    }

    return Container(
      height: 150,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: widgets
      ),
    );
  }
}
