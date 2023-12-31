package reap.backend.Entities;

import jakarta.persistence.*;

@Entity
public class ServiceUser {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String username;
    private String password;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    // Constructors, getters, and setters

    // Default constructor
    public ServiceUser() {}

    // Parameterized constructor
    public ServiceUser(String username, String password) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    // Getters and setters

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }
}
