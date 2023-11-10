package htl.ait.SpringEndpoints.Repositories;

import java.util.List;
import htl.ait.SpringEndpoints.Pojo.Ingredient;
import htl.ait.SpringEndpoints.Pojo.Meal;
import htl.ait.SpringEndpoints.Pojo.Menu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "ingredients", path = "ingredients")
public interface IngredientRepository extends PagingAndSortingRepository<Ingredient, Long>, CrudRepository<Ingredient, Long> {

    @Query("select i from Ingredient i where i.id = :id")
    List<Menu> findById(@Param("id") Integer id);
    @Query("Select i from Ingredient i where i.name like :name")
    List<Ingredient> findByName(@Param("name") String name);
    @Query("Select i from Ingredient i where i.description like :description")
    List<Ingredient> findByDescription(@Param("description") String description);
    @Query("Select i from Ingredient i where i.allergenics like :allergenics")
    List<Ingredient> findByAllergenics(@Param("allergenic") String allergenic);
    @Query("Select i from Ingredient i where i.meals = :meals")
    List<Ingredient> findByMeal(@Param("meals") List<Meal> meals);


}
