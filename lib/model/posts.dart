import 'package:equatable/equatable.dart';
import './post.dart';

import 'category.dart';

class Posts extends Equatable {
  final List<Category> categories;
  final List<Post> posts;
  final List<Post> new_arrivals;
  final List<Post> daily_needs;

  Posts({this.categories, this.posts, this.new_arrivals, this.daily_needs});

  @override
  List<Object> get props => [categories, posts, new_arrivals, daily_needs];

  Posts copyWith({List<Category> categories, List<Post> posts, List<Post> new_arrivals, List<Post> daily_needs}) {
    return Posts(
        categories: categories ?? this.categories, posts: posts ?? this.posts, new_arrivals: categories ?? this.new_arrivals, daily_needs: categories ?? this.daily_needs);
  }
  /*
  static Posts fromJson(dynamic json) {
    final data = json['consolidated_weather'][0];
    return Posts(name: data['name'], description: data['name']);
  }
  */
}
