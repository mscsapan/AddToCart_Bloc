import 'package:addtocart_bloc/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartProductState extends Equatable {
  const CartProductState();

  @override
  List<Object?> get props => [];
}

class LoadingCartProductState extends CartProductState {}

class LoadedCartProductState extends CartProductState {
  final List<Product> product;
  const LoadedCartProductState({required this.product});
  @override
  List<Object?> get props => [product];
}

class ErrorCartProductState extends CartProductState {
  final String message;

  const ErrorCartProductState({required this.message});
  @override
  List<Object?> get props => [message];
}
