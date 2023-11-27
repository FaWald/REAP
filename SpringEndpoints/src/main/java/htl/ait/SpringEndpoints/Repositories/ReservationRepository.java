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
@RepositoryRestResource(collectionResourceRel = "reservations", path = "reservations")
public interface ReservationRepository extends PagingAndSortingRepository<Reservation, Long>, CrudRepository<Reservation, Long> {

    @Query("select r from Reservation r where r.id = :id")
    List<Reservation> findById(@Param("id") Integer id);
    @Query("select r from Reservation r where r.name like :name")
    List<Reservation> findByName(@Param("name") String name);
    @Query("select r from Reservation r where r.phoneNumber like :phone")
    List<Reservation> findByPhone(@Param("phone") String phone);
    @Query("select r from Reservation r where r.emailAddress like :email")
    List<Reservation> findByEmail(@Param("email") String email);
    @Query("select r from Reservation r where r.restaurant = :restaurant")
    List<Reservation> findByRestaurant(@Param("restaurant") Restaurant restaurant);

}
