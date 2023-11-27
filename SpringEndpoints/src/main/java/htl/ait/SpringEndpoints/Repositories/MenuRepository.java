package htl.ait.SpringEndpoints.Repositories;

import java.util.List;

import htl.ait.SpringEndpoints.Pojo.Meal;
import htl.ait.SpringEndpoints.Pojo.Menu;
import htl.ait.SpringEndpoints.Pojo.Restaurant;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@CrossOrigin(origins = "*")
@RepositoryRestResource(collectionResourceRel = "menus", path = "menus")
public interface MenuRepository extends PagingAndSortingRepository<Menu, Long>, CrudRepository<Menu, Long> {

    @Query("select m from Menu m where m.id = :id")
    List<Menu> findById(@Param("id") Integer id);
    @Query("select m from Menu m where m.description like :description")
    List<Menu> findByDescription(@Param("description") String description);
    @Query("select m from Menu m where m.restaurant = :restaurant")
    List<Menu> findByRestaurant(@Param("restaurant") Restaurant restaurant);
    @Query("select m from Menu m where m.meals = :meals")
    List<Menu> findByMeal(@Param("meal") List<Meal> meals);

}
