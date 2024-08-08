enum ServicePath {
  baseApi("https://www.themealdb.com/api/json/v1/1"),
  categoryOfArea("/filter.php?a=Canadian"),
  mealsById("/lookup.php?i="),
  getCategories("/categories.php"),
  getCategoryOfMeals("/filter.php?c="),
  searchWithName("/search.php?s=");

  final String value;
  const ServicePath(this.value);

  String withQuery(String value) {
    return '${this.value}/$value';
  }
}