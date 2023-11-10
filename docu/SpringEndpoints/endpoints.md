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