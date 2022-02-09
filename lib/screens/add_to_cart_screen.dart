import 'package:flutter/services.dart';

import '../bloc/cart_product_event.dart';

import '../bloc/cart_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_product_bloc.dart';
import '../model/product_model.dart';
import 'package:flutter/material.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({Key? key}) : super(key: key);

  TextStyle titleStyle() {
    return TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.grey.withOpacity(0.9),
        fontSize: 18.0,
        letterSpacing: 1.2);
  }

  TextStyle subtitleStyle() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.grey.withOpacity(0.9),
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top]);
    final Size _size = MediaQuery.of(context).size;
    final CartProductBloc cartBloc = BlocProvider.of<CartProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddToCart Screen',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          BlocBuilder<CartProductBloc, CartProductState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () => BlocProvider.of<CartProductBloc>(context)
                      .add(DeleteCartProductEvent()),
                  splashRadius: 25.0,
                  icon: const Icon(Icons.delete, color: Colors.red));
            },
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<CartProductBloc, CartProductState>(
          builder: (context, CartProductState state) {
            if (state is LoadingCartProductState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is LoadedCartProductState) {
              return Column(
                children: [
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 5.0),
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    alignment: Alignment.centerLeft,
                    color: Colors.grey.withOpacity(0.6),
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'Your Total Cart: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.4,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '${state.product.length} ',
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.4,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.product.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, int position) {
                        final Product product = state.product[position];
                        return SizedBox(
                          height: _size.height * 0.14,
                          width: _size.width,
                          child: Card(
                            elevation: 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: _size.width * 0.3,
                                  // color: Colors.black,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0)
                                        .copyWith(left: 2.0),
                                    child: Image.asset(product.image!,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  width: _size.width * 0.5,
                                  // color: Colors.black,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name!, style: titleStyle()),
                                      const SizedBox(height: 5.0),
                                      Text(
                                          'BDT: ${product.price} / ${product.unit}',
                                          style: subtitleStyle()),
                                      const SizedBox(height: 3.0),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Discount: ',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                            TextSpan(
                                              text: (product.price! * 0.05)
                                                  .toStringAsFixed(2),
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      BlocProvider.of<CartProductBloc>(context)
                                          .add(RemoveCartProductEvent(
                                              product: product)),
                                  icon: const Icon(Icons.delete,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            if (state is ErrorCartProductState) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Nothing Available'));
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: _size.height * 0.1,
        width: _size.width,
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Price : ',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
                width:
                    10.0), /*Text(
              '${BlocProvider.of<CartProductBloc>(context).state.reduce((value, element) => Product(price: value.price! + element.price!)).price}',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),*/
          ],
        ),
      ),
    );
  }
}
