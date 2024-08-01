import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/product_detail/data/rating.dart';

abstract class RatingLocalStorage {
  Future<void> addItem({required Rating rating});
  Future<Rating> getItem({required Rating rating});
  Future<List<Rating>> getAllItems();
  Future<bool> deleteItem({required Rating rating});
  Future<Rating> updateItem({required Rating rating});
}

class RatingHiveLocalStorage extends RatingLocalStorage{
  late Box<Rating> _ratingBox;

  RatingHiveLocalStorage() {
    _ratingBox = Hive.box<Rating>('ratingBox');
  }

  @override
  Future<void> addItem({required Rating rating}) async{
    await _ratingBox.put(rating.mealId, rating);
  }

  @override
  Future<bool> deleteItem({required Rating rating}) async{
    await rating.delete();
    return true;
  }

  @override
  Future<List<Rating>> getAllItems() async{
    List<Rating> _allRating = <Rating>[];
    _allRating = _ratingBox.values.toList();
    return _allRating;
  }

  @override
  Future<Rating> getItem({required Rating rating}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<Rating> updateItem({required Rating rating}) async{
    await rating.save();
    return rating;

  }
}