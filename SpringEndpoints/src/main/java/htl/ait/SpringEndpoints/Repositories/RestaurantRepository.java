package htl.ait.SpringEndpoints.Repositories;

import java.util.List;

import htl.ait.SpringEndpoints.Pojo.Menu;
import htl.ait.SpringEndpoints.Pojo.Reservation;
import htl.ait.SpringEndpoints.Pojo.Restaurant;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@CrossOrigin(origins = "*")
@RepositoryRestResource(collectionResourceRel = "restaurants", path = "restaurants")
public interface RestaurantRepository extends PagingAndSortingRepository<Restaurant, Long>, CrudRepository<Restaurant, Long> {

    @Query("select r from Restaurant r where r.id = :id")
    List<Restaurant> findById(@Param("id") Integer id);
    @Query("Select r from Restaurant r where r.name like :name")
    List<Restaurant> findByName(@Param("name") String name);
    @Query("Select r from Restaurant r where r.phoneNumber like :phone")
    List<Restaurant> findByPhone(@Param("phone") String phone);
    @Query("Select r from Restaurant r where r.emailAddress like :email")
    List<Restaurant> findByEmail(@Param("email") String email);
    @Query("Select r from Restaurant r where r.address like :address")
    List<Restaurant> findByAddress(@Param("address") String address);
    @Query("Select r from Restaurant r where r.restaurantType like :type")
    List<Restaurant> findByType(@Param("type") String type);
    @Query("Select r from Restaurant r where r.website like :website")
    List<Restaurant> findByWebsite(@Param("website") String website);
    @Query("Select r from Restaurant r where r.delivery = :delivery")
    List<Restaurant> findByDelivery(@Param("delivery") String delivery);
    @Query("Select r from Restaurant r where r.reservations = :reservation")
    List<Restaurant> findByReservation(@Param("reservation") Reservation reservation);
}
