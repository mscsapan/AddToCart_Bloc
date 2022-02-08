import 'package:addtocart_bloc/model/product_model.dart';
import 'package:addtocart_bloc/network/product_network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_product_event.dart';
part 'cart_product_state.dart';

class CartProductBloc extends Bloc<CartProductEvent, CartProductState> {
  List<Product> addToCart = [];
  CartProductBloc() : super(const CountCartProductState(count: 0)) {
    on<CartProductEvent>(
      (CartProductEvent event, Emitter emit) async {
          emit(LoadingCartProductState());
        try {
          if (event is InitialCartProductEvent) {
            List<Product> product = await ProductNetwork().getProductNetwork();
            emit(LoadedCartState(product: product));
          }
          else if (event is AddToCartProductEvent) {
            addToCart.add(event.product);
          }
          else if (event is DeleteCartProductEvent) {
            addToCart.remove(event.product);
          }else if(event is RemoveCartProductEvent){
            addToCart = [];
          }
          //emit(CountCartProductState(count: addToCart.length));
        } catch (error) {
          emit(ErrorCartProductState(message: error.toString()));
        }
      },
    );
  }
}
