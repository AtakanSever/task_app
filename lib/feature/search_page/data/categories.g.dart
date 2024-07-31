// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    idCategory: json['idCategory'] as String,
    strCategory: json['strCategory'] as String,
    strCategoryThumb: json['strCategoryThumb'] as String,
    strCategoryDescription: json['strCategoryDescription'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) {
  return CategoryList(
    categories: (json['categories'] as List<dynamic>)
        .map((e) => _$CategoryFromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };
