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

  Reservation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    selfHref = json['_links']['self']['href'];
    restaurantHref = json['_links']['restaurant']['href'];
  }
}