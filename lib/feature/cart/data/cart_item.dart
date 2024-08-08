import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String weight;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final int amount;

  CartItem({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.weight,
    required this.price,
    required this.amount,
  });

  factory CartItem.create({
    required String id,
    required String imageUrl,
    required String name,
    required String weight,
    required double price,
    required int amount,
  }) {
    return CartItem(
      id: id,
      imageUrl: imageUrl,
      name: name,
      weight: weight,
      price: price,
      amount: amount,
    );
  }

  CartItem copyWith({String? id, String? imageUrl, String? name, String? weight, double? price, int? amount}) {
    return CartItem(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      amount: amount ?? this.amount,
    );
  }
}
