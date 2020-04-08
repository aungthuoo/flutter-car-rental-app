import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostInitial();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostInitial) {
      // Outputting a state from the asynchronous generator
      yield PostLoading();

      //final orders = await restaurantRepository.fetchNewOrders(0, 20);
      //final tempOrders = await restaurantRepository.exchageHeaders(orders);
      //yield OrdersLoaded(id : 0, name: 'အော်ဒါအသစ်များ', orders: tempOrders);

    } else if (event is FetchPostEvent) {
      yield PostLoading();
      yield PostLoaded();
    }
  }
}
