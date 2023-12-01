import 'dart:convert';

class Menu {
  late int id;
  late String description;
  late String restaurantHref; // Assuming restaurant is represented by an href
  late List<String> mealHrefs; // List of hrefs for meals
  late String selfHref;

  Menu({
    required this.id,
    required this.description,
    required this.restaurantHref,
    required this.mealHrefs,
    required this.selfHref,
  });

  // Named constructor for creating an instance from JSON
  Menu.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  // Factory method to create a list of Menu objects from the JSON response body
  static List<Menu> fromJsonList(String responseBody) {
    final List<dynamic> menuData = json.decode(responseBody);

    return menuData.map((json) {
      var menu = Menu.fromJson(json);
      return menu;
    }).toList().cast<Menu>();
  }

  // Helper method to set fields from JSON
  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    restaurantHref = json['_links']['restaurant']['href']; // Assuming restaurant is represented by an href
    mealHrefs = List<String>.from(json['_links']['meal'].map((meal) => meal['href']));
    selfHref = json['_links']['self']['href'];
  }

  @override
  String toString() {
    return 'Menu{id: $id, description: $description, restaurantHref: $restaurantHref, mealHrefs: $mealHrefs, selfHref: $selfHref}';
  }
}
