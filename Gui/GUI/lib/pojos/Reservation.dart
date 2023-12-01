import 'dart:convert';

class Reservation {
  late String name;
  late String phoneNumber;
  late String emailAddress;
  late String selfHref;
  late String restaurantHref;

  Reservation({
    required this.name,
    required this.phoneNumber,
    required this.emailAddress,
    required this.selfHref,
    required this.restaurantHref,
  });

  // Named constructor for creating an instance from JSON
  Reservation.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  // Factory method to create a list of Reservation objects from the JSON response body
  static List<Reservation> fromJsonList(String responseBody) {
    final Map<String, dynamic> jsonResponse = json.decode(responseBody);
    final List<dynamic> reservationData = jsonResponse['_embedded']['reservations'];

    return reservationData.map((json) {
      var reservation = Reservation.fromJson(json);
      return reservation;
    }).toList().cast<Reservation>();
  }

  // Helper method to set fields from JSON
  void fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    selfHref = json['_links']['self']['href'];
    restaurantHref = json['_links']['restaurant']['href'];
  }

  @override
  String toString() {
    return 'Reservation{name: $name, phoneNumber: $phoneNumber, emailAddress: $emailAddress, selfHref: $selfHref, restaurantHref: $restaurantHref}';
  }
}
