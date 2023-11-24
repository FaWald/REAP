class Meal {
  final String name;
  final double price;

  Meal(this.name, this.price);
}

class Order {
  final List<Meal> meals;
  String status;

  Order(this.meals, this.status);
}

List<Meal> menu = [
  Meal("Spaghetti Carbonara", 8.50),
  Meal("Margherita Pizza", 7.00),
  Meal("Caesar Salad", 5.50),
];
