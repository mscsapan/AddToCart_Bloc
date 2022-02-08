import 'package:addtocart_bloc/bloc/cart_product_bloc.dart';
import 'package:addtocart_bloc/bloc/cart_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductBloc, CartProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
              ),
              itemCount:
                  BlocProvider.of<CartProductBloc>(context).addToCart.length,
              itemBuilder: (BuildContext context, int index) {
                final Product pro =
                    BlocProvider.of<CartProductBloc>(context).addToCart[index];
                return Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 140.0,
                        width: 140.0,
                        child: Image.asset(
                          pro.image,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pro.name),
                                Text(pro.price.toString() + '/' + pro.unit),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
