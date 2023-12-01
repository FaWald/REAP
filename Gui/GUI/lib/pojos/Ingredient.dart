import 'dart:convert';

class Ingredient {
  late int id;
  late String name;
  late String description;
  late String allergenics;
  late Set<String> mealHrefs; // Assuming meals are represented by hrefs
  late String selfHref;

  Ingredient({
    required this.id,
    required this.name,
    required this.description,
    required this.allergenics,
    required this.mealHrefs,
    required this.selfHref,
  });

  // Named constructor for creating an instance from JSON
  Ingredient.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  // Factory method to create a list of Ingredient objects from the JSON response body
  static List<Ingredient> fromJsonList(String responseBody) {
    final List<dynamic> ingredientData = json.decode(responseBody);

    return ingredientData.map((json) {
      var ingredient = Ingredient.fromJson(json);
      return ingredient;
    }).toList().cast<Ingredient>();
  }

  // Helper method to set fields from JSON
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    allergenics = json['allergenics'];
    selfHref = json['_links']['self']['href'];
    mealHrefs = Set<String>.from(json['_links']['meals'].map((meal) => meal['href']));
  }

  @override
  String toString() {
    return 'Ingredient{id: $id, name: $name, description: $description, allergenics: $allergenics, mealHrefs: $mealHrefs, selfHref: $selfHref}';
  }
}
