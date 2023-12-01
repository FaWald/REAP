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

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    restaurantHref = json['_links']['restaurant']['href']; // Assuming restaurant is represented by an href
    mealHrefs = List<String>.from(json['_links']['meal'].map((meal) => meal['href']));
    selfHref = json['_links']['self']['href'];
  }
}
