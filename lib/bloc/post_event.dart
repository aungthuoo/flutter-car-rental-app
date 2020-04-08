part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  //const OrderEvent();
  PostEvent([List props = const <dynamic>[]]) : super(props);
}

class FetchPostEvent extends PostEvent {
  final int id;
  FetchPostEvent(this.id) : super([id]);
}
