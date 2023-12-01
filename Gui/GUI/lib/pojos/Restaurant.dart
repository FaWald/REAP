class Restaurant {
  late String name;
  late String phoneNumber;
  late String emailAddress;
  late String address;
  late String restaurantType;
  late String website;
  late bool delivery;
  late String selfHref;

  Restaurant({
    required this.name,
    required this.phoneNumber,
    required this.emailAddress,
    required this.address,
    required this.restaurantType,
    required this.website,
    required this.delivery,
    required this.selfHref
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
    address = json['address'];
    restaurantType = json['restaurantType'];
    website = json['website'];
    delivery = json['delivery'];
    selfHref = json['_links']['self']['href'];
  }
}