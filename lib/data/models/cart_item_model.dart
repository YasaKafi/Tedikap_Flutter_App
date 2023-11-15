class CartItem {

  final String title;
  final String image;
  final int price;
  final int id;
  int quantity;
  int totalItemPrice;

  CartItem(
     {
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.id,
    required this.totalItemPrice,
  });

  
}
