// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}
 class HomeInitial extends HomeState {}
 class HomeLoadingState extends HomeState{}
class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadingSuccessState({
    required this.products,
  });

}
class HomeErrorState extends HomeState{}

class HomeNavToWishlistPageActionState extends HomeActionState{}
class HomeNavToCartPageActionState extends HomeActionState{}
