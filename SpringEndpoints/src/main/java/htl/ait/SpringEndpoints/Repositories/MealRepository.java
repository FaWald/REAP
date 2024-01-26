package htl.ait.SpringEndpoints.Repositories;

import java.util.List;

import htl.ait.SpringEndpoints.Pojo.Meal;
import htl.ait.SpringEndpoints.Pojo.Menu;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "*")
@RepositoryRestResource(collectionResourceRel = "meals", path = "meals")
public interface MealRepository extends PagingAndSortingRepository<Meal, Long>, CrudRepository<Meal, Long> {

    @Query("select m from Meal m where m.id = :id")
    List<Meal> findById(@Param("id") Integer id);
    @Query("Select m from Meal m where m.name like :name")
    List<Meal> findByName(@Param("name") String name);
    @Query("Select m from Meal m where m.menu = :menu")
    List<Meal> findByMenu(@Param("menu") Menu menu);
    @Query("Select m from Meal m where m.price = :price")
    List<Meal> findByPrice(@Param("price") Integer price);

}
