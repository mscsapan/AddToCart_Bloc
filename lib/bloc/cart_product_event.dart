part of 'cart_product_bloc.dart';

abstract class CartProductEvent extends Equatable {
  const CartProductEvent();

  @override
  List<Object> get props => [];
}

class InitialCartProductEvent extends CartProductEvent{
}

class AddToCartProductEvent extends CartProductEvent{
  final Product product;
  const AddToCartProductEvent({required this.product});
  @override
  List<Object> get props => [product];
}


class DeleteCartProductEvent extends CartProductEvent{
     final Product product;
  const DeleteCartProductEvent({required this.product});
  @override
  List<Object> get props => [product];
}
class RemoveCartProductEvent extends CartProductEvent{
     final Product product;
  const RemoveCartProductEvent({required this.product});
  @override
  List<Object> get props => [product];
}