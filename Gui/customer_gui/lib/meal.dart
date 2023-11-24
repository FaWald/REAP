class Meal {
  final String name;
  final double price;
  // Weitere Attribute gemäß Ihrer JSON-Struktur

  Meal({required this.name, required this.price});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'],
      price: json['price'].toDouble(),
      // Weitere Attribute initialisieren
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      // Weitere Attribute zu JSON konvertieren
    };
  }
}
