# Endpoint Documentation

## Pojo

The POJO files represent the entities in the database in java form. It also defines the relationships between the entities

## Repositories

These are the interfaces that are used by Springboot to create the endpoints enabling communication with the database. 
ReservationRepository will be used as an example:

> @RepositoryRestResource(collectionResourceRel = "reservations", path = "reservations")

this defines the base endpoint for the reservation entity of the database. A list of all menus can be accessed under 
* localhost:8080/reservations

if you want to use one of the functions defined in the class, you can call them by changing the endpoint to
* localhost:8080/reservations/search/function?parameter=value
* localhost:8080/reservations/search/findByName?name=Mustermann



## Application

The Application file is the start of the program and with WebMvcConfigurer sets the CORS communications for localhost:8080

### Creating a restaurant

Send POST HTTP request to endpoint http://localhost:8080/restaurants

{
	headers: {
        "Content-Type": "application/json"
    }
    method: "GET",
    body: {
      name : "PetarKornDog",
      phoneNumber : "+4369910677504",
      emailAddress : "petarnenkov2@muster.mail",
      address : "Schlachthofgasse",
      restaurantType : "Mexican",
      website : "restau1best.com",
      delivery : true,
    }
}




### Creating a reservation

Send GET HTTP request to endpoint http://localhost:8080/restaurants/search/findByName?name=PetarKornDog

Response
{
  "_embedded" : {
    "restaurants" : [ {
      "name" : "PetarKornDog",
      "phoneNumber" : "+4369910677504",
      "emailAddress" : "petarnenkov2@muster.mail",
      "address" : "Schlachthofgasse",
      "restaurantType" : "Mexican",
      "website" : "restau1best.com",
      "delivery" : true,
      "_links" : {
        "self" : {
          "href" : "http://localhost:8080/restaurants/1"
        },
        "restaurant" : {
          "href" : "http://localhost:8080/restaurants/1"
        },
        "reservations" : {
          "href" : "http://localhost:8080/restaurants/1/reservations"
        }
      }
    } ]
  },
  "_links" : {
    "self" : {
      "href" : "http://localhost:8080/restaurants/search/findByName?name=PetarKornDog"
    }
  }
}

besides the table values for the reservation you will need the self href of the restaurant
you can get that from data._embedded.restaurants[i]._links.self.href

Send POST HTTP request to endpoint http://localhost:8080/reservations

{
	headers: {
        "Content-Type": "application/json"
    }
    method: "POST",
    body: {
      name : "Petar Nenkov",
      phoneNumber : "+4369910677504",
      emailAddress : "customer1@gmail.com",
      restaurant : "http://localhost:8080/restaurants/1"
    }
}

### Creating a menu

besides the table values for the menu you will need the self href of the restaurant

Send GET HTTP request to endpoint http://localhost:8080/restaurants/search/findByName?name=RestaurantName
you can get that from the response of the get call under data._embedded.restaurant[i]._links.self.href

Send POST HTTP request to endpoint http://localhost:8080/menus

{
    headers: {
        "Content-Type": "application/json"
    }
    method: "POST",
    body: {
      name : "Petars Pizza Menu",
      description: "Der Pizza Menu von PetarsKornDogs",
      restaurant: "http://localhost:8080/restaurants/1"
    }
}

### Creating a meal

besides the table values for the meal you will need the self href of the menus

Send GET HTTP request to endpoint http://localhost:8080/menus/search/findByName?name=MenuName
you can get that from the response of the get call under data._embedded.menus[i]._links.self.href

Send POST HTTP request to endpoint http://localhost:8080/meals

{
    headers: {
        "Content-Type": "application/json"
    }
    method: "POST",
    body: {
      name : "Petars Salami auf Pizza",
      description: "Salami Pizza sehr sehr Lecker",
      menus: "http://localhost:8080/menus/1"
    }
}
