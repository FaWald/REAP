import 'dart:convert';

class Meal {
  late int id;
  late String menuHref; // Assuming menu is represented by an href
  late String name;
  late String description;
  late double price;
  late String selfHref;
  late Set<String> ingredientHrefs; // Assuming ingredients are represented by hrefs

  Meal({
    required this.id,
    required this.menuHref,
    required this.name,
    required this.description,
    required this.price,
    required this.selfHref,
    required this.ingredientHrefs,
  });

  // Named constructor for creating an instance from JSON
  Meal.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  // Factory method to create a list of Meal objects from the JSON response body
  static List<Meal> fromJsonList(String responseBody) {
    final List<dynamic> mealData = json.decode(responseBody);

    return mealData.map((json) {
      var meal = Meal.fromJson(json);
      return meal;
    }).toList().cast<Meal>();
  }

  // Helper method to set fields from JSON
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menuHref = json['_links']['menu']['href']; // Assuming menu is represented by an href
    name = json['name'];
    description = json['description'];
    price = json['price'];
    selfHref = json['_links']['self']['href'];
    ingredientHrefs = Set<String>.from(json['_links']['ingredients'].map((ingredient) => ingredient['href']));
  }

  @override
  String toString() {
    return 'Meal{id: $id, menuHref: $menuHref, name: $name, description: $description, price: $price, selfHref: $selfHref, ingredientHrefs: $ingredientHrefs}';
  }
}
