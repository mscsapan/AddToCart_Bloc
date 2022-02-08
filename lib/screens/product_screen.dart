import 'package:addtocart_bloc/bloc/cart_product_bloc.dart';
import 'package:addtocart_bloc/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Screen',
          style: TextStyle(color: Colors.black),
        ),
        leading: Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black, size: 30.0),
            ),
            Positioned(
              right: 12.0,
              top: 6.0,
              child: BlocBuilder<CartProductBloc, CartProductState>(
                builder: (context, state) {
                  return Container(
                    height: 20.0,
                    width: 20.0,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Text(
                      BlocProvider.of<CartProductBloc>(context)
                          .addToCart
                          .length
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<CartProductBloc, CartProductState>(
        builder: (context, state) {
          if (state is LoadingCartProductState) {
            return loadingIndicator();
          } else if (state is LoadedCartState) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product product = productList[index];
                      return Card(
                        elevation: 5.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 140.0,
                              width: 140.0,
                              child: Image.asset(
                                product.image,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name),
                                      Text(product.price.toString() +
                                          '/' +
                                          product.unit),
                                    ],
                                  ),
                                  Container(
                                    height: 40.0,
                                    width: 40.0,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<CartProductBloc>(
                                                context)
                                            .add(AddToCartProductEvent(
                                                product: productList[index]));
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.shopping_cart,
                                        color: Colors.white,
                                        size: 22.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }));
          } else if (state is ErrorCartProductState) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Nothing Happend'));
        },
      ),
    );
  }

  Widget loadingIndicator() {
    return const Center(child: CircularProgressIndicator(color: Colors.green));
  }
}
