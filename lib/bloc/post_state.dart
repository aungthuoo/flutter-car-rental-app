part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  //const OrderState();
  PostState([List props = const <dynamic>[]]) : super(props);
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final int index;
  final int id;
  PostLoaded({this.index, this.id}) : super([index, id]);
}

class FetchError extends PostState {
  final String text;
  FetchError({this.text}) : super([]);
}
