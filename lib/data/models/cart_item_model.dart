class CartItem {
  final String title;
  final String image;
  final int price;
  final int id;
  int quantity;
  int totalItemPrice;

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.id,
    required this.totalItemPrice,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
      totalItemPrice: map['totalItemPrice'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'quantity': quantity,
      'totalItemPrice': totalItemPrice,
    };
  }
}
