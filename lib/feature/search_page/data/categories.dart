import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class Category {
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
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  // Category nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryList {
  @JsonKey(name: 'categories')
  final List<Category> categories;

  CategoryList({required this.categories});

  // JSON'dan CategoryList nesnesine dönüştürme
  factory CategoryList.fromJson(Map<String, dynamic> json) => _$CategoryListFromJson(json);

  // CategoryList nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
