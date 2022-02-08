class Product {
  final int id;
  final String name;
  final String image;
  final int price;
  final int initialPrice;
  final String unit;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.initialPrice,
    required this.price,
    required this.unit,
    required this.quantity,
  });

  Product.fromProduct(Map<String, dynamic> product)
      : id = product['id'],
        name = product['name'],
        image = product['image'],
        initialPrice = product['initialPrice'],
        price = product['price'],
        unit = product['unit'],
        quantity = product['quantity'];

  Map<String, dynamic> toProductMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'initialPrice': initialPrice,
      'price': price,
      'unit': unit,
      'quantity': quantity,
    };
  }
}

List<Product> productList = [
  Product(
      id: 1,
      name: 'Fresh Apple',
      image: 'assets/product/1.png',
      initialPrice: 180,
      price: 180,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 2,
      name: 'Banaras Banana',
      image: 'assets/product/2.png',
      initialPrice: 20,
      price: 20,
      quantity: 1,
      unit: 'Four'),
  Product(
      id: 1,
      name: 'Red Beef',
      image: 'assets/product/3.png',
      initialPrice: 480,
      price: 480,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Cabbage',
      image: 'assets/product/4.png',
      initialPrice: 30,
      price: 30,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Chicken',
      image: 'assets/product/5.png',
      initialPrice: 160,
      price: 160,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Cauliflower',
      image: 'assets/product/6.png',
      initialPrice: 25,
      price: 25,
      quantity: 1,
      unit: 'Bottle'),
  Product(
      id: 1,
      name: 'Soft Drinks',
      image: 'assets/product/7.png',
      initialPrice: 25,
      price: 25,
      quantity: 1,
      unit: 'Bottle'),
  Product(
      id: 1,
      name: 'Fanta Drinks',
      image: 'assets/product/8.png',
      initialPrice: 20,
      price: 20,
      quantity: 1,
      unit: 'Bottle'),
  Product(
      id: 1,
      name: 'Clemon',
      image: 'assets/product/9.png',
      initialPrice: 15,
      price: 15,
      quantity: 1,
      unit: 'Bottle'),
  Product(
      id: 1,
      name: 'Egges',
      image: 'assets/product/10.png',
      initialPrice: 38,
      price: 38,
      quantity: 1,
      unit: 'Four'),
  Product(
      id: 1,
      name: 'Ginger',
      image: 'assets/product/11.png',
      initialPrice: 120,
      price: 120,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Red Grapes',
      image: 'assets/product/12.png',
      initialPrice: 280,
      price: 280,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Pomegranate',
      image: 'assets/product/13.png',
      initialPrice: 320,
      price: 320,
      quantity: 1,
      unit: 'Kg'),

  Product(
      id: 1,
      name: 'Orange',
      image: 'assets/product/15.png',
      initialPrice: 150,
      price: 150,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Malta',
      image: 'assets/product/16.png',
      initialPrice: 70,
      price: 70,
      quantity: 1,
      unit: 'Piece'),
  Product(
      id: 1,
      name: 'Bean',
      image: 'assets/product/17.png',
      initialPrice: 50,
      price: 50,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Pineapple',
      image: 'assets/product/18.png',
      initialPrice: 70,
      price: 70,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Pineapple',
      image: 'assets/product/19.png',
      initialPrice: 70,
      price: 70,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Caret',
      image: 'assets/product/20.png',
      initialPrice: 25,
      price: 25,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Ladies Finger',
      image: 'assets/product/21.png',
      initialPrice: 14,
      price: 14,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Potato',
      image: 'assets/product/22.png',
      initialPrice: 30,
      price: 30,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Cucumber',
      image: 'assets/product/23.png',
      initialPrice: 30,
      price: 30,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Strawberry',
      image: 'assets/product/24.png',
      initialPrice: 160,
      price: 160,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Tomato',
      image: 'assets/product/25.png',
      initialPrice: 34,
      price: 34,
      quantity: 1,
      unit: 'Kg'),
  Product(
      id: 1,
      name: 'Tomato',
      image: 'assets/product/26.png',
      initialPrice: 30,
      price: 30,
      quantity: 1,
      unit: 'Kg'),
];