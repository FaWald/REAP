package reap.backend.service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import reap.backend.grpc.IGRPC;
import java.util.List;

public class Service implements IGRPC{
    EntityManagerFactory factory = Persistence.createEntityManagerFactory("create-db");
    EntityManager manager = factory.createEntityManager();


    public void setRestaurant(String restaurant) {
        manager.getTransaction().begin();

        try {

        } catch (Exception e) {
            manager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public List<String> getRestaurant() {
        Query query = manager.createQuery("SELECT r.name FROM Restaurant r", String.class);
        return query.getResultList();
    }

    @Override
    public List<String> getMenu(String Restaurant) {
        return null;
    }

    public void setMenu(String restaurantName) {
        manager.getTransaction().begin();

        try {

        } catch (Exception e) {
            manager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public int getPrice(List<String> selection) {
        return 0;
    }

    public void setPrice(List<String> selection) {

    }

    public Object getReservation(Object o) {
        return null;
    }

    public void setReservation(Object o) {

    }
}
