package reap.backend.Entities;


import jakarta.persistence.*;

import java.util.List;

@Entity
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    private String phoneNumber;
    private String emailAddress;
    private String address;
    private String restaurantType;
    private String website;
    private boolean delivery;


    @OneToMany(mappedBy = "restaurant")
    private List<Reservation> reservations;

    public Restaurant() {}

    public Restaurant(String name, String phoneNumber, String emailAddress, String address, String restaurantType, String website, boolean delivery) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.address = address;
        this.restaurantType = restaurantType;
        this.website = website;
        this.delivery = delivery;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getAddress() {
        return address;
    }

    public String getRestaurantType() {
        return restaurantType;
    }

    public String getWebsite() {
        return website;
    }

    public boolean isDelivery() {
        return delivery;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setRestaurantType(String restaurantType) {
        this.restaurantType = restaurantType;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public void setDelivery(boolean delivery) {
        this.delivery = delivery;
    }
}