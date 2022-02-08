import '../bloc/cart_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/product_screen.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => CartProductBloc(),
      child: const ProductScreen(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
