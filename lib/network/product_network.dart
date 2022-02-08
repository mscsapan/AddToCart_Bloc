import 'package:addtocart_bloc/model/product_model.dart';

class ProductNetwork {
  Future<List<Product>> getProductNetwork() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return productList;
    });
  }
}
