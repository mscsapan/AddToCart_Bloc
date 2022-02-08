import 'package:addtocart_bloc/bloc/cart_product_event.dart';
import 'package:addtocart_bloc/bloc/cart_product_state.dart';
import 'package:addtocart_bloc/network/product_network.dart';
import 'package:addtocart_bloc/screens/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_product_bloc.dart';
import '../model/product_model.dart';

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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart,
                  color: Colors.black, size: 30.0),
            ),
            Positioned(
              right: 12.0,
              top: 6.0,
              child: Container(
                height: 20.0,
                width: 20.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: BlocBuilder<CartProductBloc, CartProductState>(
                    builder: (context, state) {
                  if (state is LoadedCartProductState) {
                    return Text(
                      state.product.length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  }
                  return const Text('0');
                }),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      /*body: BlocBuilder<CartProductBloc, CartProductState>(
        builder: (context, CartProductState state) {
          if (state is LoadingCartProductState) {
            return loadingIndicator();
          } else if (state is LoadedCartProductState) {
            return getProduct(state.product);
          } else if (state is ErrorCartProductState) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Nothing...'));
        },
      ),*/
      body: getProduct(),
    );
  }

  Widget getProduct() {
    return FutureBuilder<List<Product>>(
        future: ProductNetwork().getProductNetwork(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          return snapshot.hasData
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product pro = snapshot.data![index];
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
                                      Text(pro.name),
                                      Text(pro.price.toString() +
                                          '/' +
                                          pro.unit),
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
                                                product: pro));
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
                    },
                  ),
                )
              : loadingIndicator();
        });
  }

  Widget loadingIndicator() {
    return const Center(child: CircularProgressIndicator(color: Colors.green));
  }
}
