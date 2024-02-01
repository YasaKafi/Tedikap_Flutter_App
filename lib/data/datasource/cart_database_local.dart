import 'package:sqflite/sqflite.dart';

import '../models/cart_item_model.dart';

class CartRepository {
  static final CartRepository _instance = CartRepository._internal();

  factory CartRepository() => _instance;

  CartRepository._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await openDatabase('cart.db', version: 1, onCreate: (db, version) {
      db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY, title TEXT, image TEXT, price INTEGER, quantity INTEGER, totalItemPrice INTEGER)');
    });
    return _database!;
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query('cart');
    return results.map((result) => CartItem.fromMap(result)).toList();
  }

  Future<void> addCartItem(CartItem cartItem) async {
    final db = await database;
    await db.insert('cart', cartItem.toMap());
  }

  Future<void> deleteCartItem(int id) async {
  final db = await database;
  await db.delete('cart', where: 'id = ?', whereArgs: [id]);
}
}
