// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:basic_bloc/features/home/models/home-products_model.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTile({
    Key? key,
    required this.productDataModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2) ),
         borderRadius: BorderRadius.circular(10),
        
      
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),),
              image: DecorationImage(
                 fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(productDataModel.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
         
          Padding(
            padding: const EdgeInsets.only(left:8.0, bottom: 8.0),
            child: Text(productDataModel.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("  Rs."+productDataModel.price.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              Row(
                children: [
                   IconButton(onPressed: (){
                //homeBloc.add(HomeWishlistButtonNavClickedEvent());
              }, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: (){
                //homeBloc.add(HomeCartButtonNavClickedEvent());
              }, icon: Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
