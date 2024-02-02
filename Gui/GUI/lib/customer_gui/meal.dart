// Definition of the Meal class, representing a meal.
class Meal {
  // The 'name' property stores the name of the meal.
  final String name;

  // The 'price' property stores the price of the meal.
  final double price;

  // Constructor of the Meal class, initializing the name and price of the meal.
  Meal(this.name, this.price);
}

// Definition of the Order class, representing an order.
class Order {
  // The 'meals' property is a list of Meal objects representing the meals included in the order.
  final List<Meal> meals;

  // The 'status' property stores the current status of the order (e.g., 'processing', 'complete', etc.).
  String status;

  // Constructor of the Order class, initializing the list of meals and the status.
  Order(this.meals, this.status);
}

// A 'menu' list containing various meals.
// This list represents a sample menu with different dishes and their prices.
List<Meal> menu = [
  Meal("Spaghetti Carbonara", 8.50),
  Meal("Margherita Pizza", 7.00),
  Meal("Caesar Salad", 5.50),
];
