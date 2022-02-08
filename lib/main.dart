import 'package:addtocart_bloc/bloc/cart_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/product_screen.dart';

void main() {
  runApp( MaterialApp(
    home: BlocProvider<CartProductBloc>(
      create: (context) => CartProductBloc()..add(InitialCartProductEvent()),
      child: const ProductScreen(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
