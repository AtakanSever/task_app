import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/product/network/base/base_model.dart';

part 'categories.g.dart';

@JsonSerializable()
class Category extends BaseModel {
  @JsonKey(name: 'idCategory')
  final String idCategory;

  @JsonKey(name: 'strCategory')
  final String strCategory;

  @JsonKey(name: 'strCategoryThumb')
  final String strCategoryThumb;

  @JsonKey(name: 'strCategoryDescription')
  final String strCategoryDescription;

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  // JSON'dan Category nesnesine dönüştürme
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  // Category nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  Category fromJson(Map<String, dynamic> json) {
    return Category.fromJson(json);
  }
}

@JsonSerializable()
class CategoryList extends BaseModel {
  final List<Category> categories;

  CategoryList({required this.categories});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      categories: (json['categories'] as List)
          .map((i) => Category.fromJson(i))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
  
  @override
  CategoryList fromJson(Map<String, dynamic> json) {
    return CategoryList.fromJson(json);
  }
}
