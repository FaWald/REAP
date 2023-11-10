package reap.backend.Entities;

import jakarta.persistence.*;

import java.util.Set;

@Entity
public class Ingredient {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    private String description;
    private String allergenics;

    @ManyToMany(mappedBy = "ingredients")
    private Set<Meal> meals;

    public Ingredient() {}

    public Ingredient(String name, String description, String allergenics) {
        this.name = name;
        this.description = description;
        this.allergenics = allergenics;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getAllergenics() {
        return allergenics;
    }

    public Set<Meal> getMeals() {
        return meals;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setAllergenics(String allergenics) {
        this.allergenics = allergenics;
    }
}