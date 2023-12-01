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

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    allergenics = json['allergenics'];
    selfHref = json['_links']['self']['href'];
    mealHrefs = Set<String>.from(json['_links']['meals'].map((meal) => meal['href']));
  }
}
