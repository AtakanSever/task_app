import 'package:hive/hive.dart';

part 'rating.g.dart';

@HiveType(typeId: 3)
class Rating extends HiveObject {
  @HiveField(0)
  final String mealId;

  @HiveField(1)
  final int stars;

  Rating({required this.mealId, required this.stars});
}
