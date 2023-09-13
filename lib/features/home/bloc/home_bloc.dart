import 'dart:async';

import 'package:basic_bloc/data/grocery_data.dart';
import 'package:basic_bloc/features/home/models/home-products_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavClickedEvent>(HomeNavWishlist);
  on<HomeCartButtonNavClickedEvent>(HomeNavCart);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
      id: e['id'], 
      name: e['name'],
      description: e['description'], 
      price: e['price'], 
      imageUrl: e['imageUrl']
      )).toList()));
  }

  FutureOr<void> HomeNavWishlist(HomeWishlistButtonNavClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist nav");
    emit(HomeNavToWishlistPageActionState());
  }
  

  FutureOr<void> HomeNavCart(HomeCartButtonNavClickedEvent event, Emitter<HomeState> emit) {
    print("Cart nav");
    emit(HomeNavToCartPageActionState());
  }

  
}


