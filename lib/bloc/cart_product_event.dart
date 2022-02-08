import 'package:addtocart_bloc/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartProductEvent extends Equatable {
  const CartProductEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartProductEvent extends CartProductEvent {
  final Product product;
  const AddToCartProductEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class RemoveCartProductEvent extends CartProductEvent {
  final Product product;
  const RemoveCartProductEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class DeleteCartProductEvent extends CartProductEvent {}
