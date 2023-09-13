import 'package:basic_bloc/features/cart/ui/cart_page.dart';
import 'package:basic_bloc/features/home/bloc/home_bloc.dart';
import 'package:basic_bloc/features/home/ui/product_tile_widget.dart';
import 'package:basic_bloc/features/wishlist/ui/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
   homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc=HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current)=> current is HomeActionState,
      buildWhen: (previous, current)=> current is !HomeActionState,
      listener: (context, state) {
       if(state is HomeNavToWishlistPageActionState){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WishList()));
       }
          else if(state is HomeNavToCartPageActionState){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
       }
      },
      builder: (context, state) {
       switch (state.runtimeType){
        case HomeLoadingState:
          return Scaffold(body: Center(
            child: CircularProgressIndicator(),
          ),); 
        case HomeLoadingSuccessState:
          final successState= state as HomeLoadingSuccessState;
           return Scaffold(
          appBar: AppBar(
            title: Text('Grocery App'),
            actions: [
              IconButton(onPressed: (){
                homeBloc.add(HomeWishlistButtonNavClickedEvent());
              }, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: (){
                homeBloc.add(HomeCartButtonNavClickedEvent());
              }, icon: Icon(Icons.shopping_bag)),
            ],
          ),
          body: ListView.builder(
            itemCount: successState.products.length,
            itemBuilder: (context, index){
              return ProductTile(productDataModel: successState.products[index]);
            }
            ),
        );
        case HomeErrorState:
        return Scaffold(body: Center(child: Text("Error"),),);
        default:
          return SizedBox();
       }
      },
    );
  }
}


