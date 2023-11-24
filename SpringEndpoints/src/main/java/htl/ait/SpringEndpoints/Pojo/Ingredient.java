package htl.ait.SpringEndpoints.Pojo;

import jakarta.persistence.*;

import java.util.Set;

@Entity
public class Ingredient {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String name;
    private String description;
    private String allergenics;

    @ManyToMany(mappedBy = "ingredients")
    private Set<Meal> meals;

    public Ingredient() {}

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAllergenics() {
        return allergenics;
    }

    public void setAllergenics(String allergenics) {
        this.allergenics = allergenics;
    }

    public Set<Meal> getMeals() {
        return meals;
    }

    public void setMeals(Set<Meal> meals) {
        this.meals = meals;
    }
}