package htl.ait.SpringEndpoints.Pojo;

import jakarta.persistence.*;

import java.util.Set;

@Entity
public class Meal {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @ManyToOne
    @JoinColumn(name = "menu_id")
    private Menu menu;
    private String description;
    private double price;

    @ManyToMany
    @JoinTable(
            name = "meal_ingredient",
            joinColumns = @JoinColumn(name = "meal_id"),
            inverseJoinColumns = @JoinColumn(name = "ingredient_id")
    )
    private Set<Ingredient> ingredients;

    public Meal() {
        // Standardkonstruktor
    }

    public Meal(String description, double price) {
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public Menu getMenu() {
        return menu;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public Set<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
