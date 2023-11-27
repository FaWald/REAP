package htl.ait.SpringEndpoints.Repositories;

import java.util.List;

import htl.ait.SpringEndpoints.Pojo.Menu;
import htl.ait.SpringEndpoints.Pojo.ServiceUser;
import htl.ait.SpringEndpoints.Pojo.UserRole;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@CrossOrigin(origins = "*")
@RepositoryRestResource(collectionResourceRel = "users", path = "users")
public interface ServiceUserRepository extends PagingAndSortingRepository<ServiceUser, Long>, CrudRepository<ServiceUser, Long> {

    @Query("select u from ServiceUser u where u.id = :id")
    List<ServiceUser> findById(@Param("id") Integer id);
    @Query("Select u from ServiceUser u where u.username like :name")
    List<ServiceUser> findByName(@Param("name") String name);
    @Query("Select u from ServiceUser u where u.password like :password")
    List<ServiceUser> findByPass(@Param("password") String password);
    @Query("Select u from ServiceUser u where u.role = :role")
    List<ServiceUser> findByRole(@Param("role") UserRole role);

}
