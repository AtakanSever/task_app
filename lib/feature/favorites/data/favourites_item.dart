import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'favoruites_item.g.dart';

@HiveType(typeId: 1)
class FavoritesItem extends HiveObject {
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

  FavoritesItem({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.weight,
    required this.price,
    required this.amount,
  });

  factory FavoritesItem.create({
    required String imageUrl,
    required String name,
    required String weight,
    required double price,
    required int amount,
  }) {
    return FavoritesItem(
      id: const Uuid().v1(),
      imageUrl: imageUrl,
      name: name,
      weight: weight,
      price: price,
      amount: amount,
    );
  }

  FavoritesItem copyWith({String? id, String? imageUrl, String? name, String? weight, double? price, int? amount}) {
    return FavoritesItem(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      price: price ?? this.price,
      amount: amount ?? this.amount,
    );
  }
}
