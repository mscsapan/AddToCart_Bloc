import '../bloc/cart_product_event.dart';
import '../bloc/cart_product_state.dart';
import '../model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductBloc extends Bloc<CartProductEvent, CartProductState> {
  CartProductBloc() : super(const LoadedCartProductState(product: [])) {
    List<Product> addToCart = [];
    on<CartProductEvent>((event, emit) {
      emit(LoadingCartProductState());
      try {
        if (event is AddToCartProductEvent) {
          addToCart.add(event.product);
        }
        if (event is RemoveCartProductEvent) {
          addToCart.remove(event.product);
        }
        if (event is DeleteCartProductEvent) {
          addToCart = [];
        }
        emit(LoadedCartProductState(product: addToCart));
      } catch (e) {
        emit(ErrorCartProductState(message: e.toString()));
      }
    });
  }
}
