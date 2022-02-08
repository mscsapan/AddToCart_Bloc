part of 'cart_product_bloc.dart';

abstract class CartProductState extends Equatable {
  const CartProductState();
  
  @override
  List<Object> get props => [];
}

class CartProductInitial extends CartProductState {}
class LoadingCartProductState extends CartProductState{}
class CountCartProductState extends CartProductState{
  final int count;
  const CountCartProductState({required this.count});
  @override
  List<Object> get props => [count]; 
}
class LoadedCartState extends CartProductState{
  final List<Product> product;
  const LoadedCartState({required this.product});
  @override
  List<Object> get props => [product];
}
class ErrorCartProductState extends CartProductState{
  final String message;
  const ErrorCartProductState({required this.message});
  @override
  List<Object> get props => [message];
}
