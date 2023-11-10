package reap.backend.grpc;
import java.util.ArrayList;
import java.util.List;

public interface IGRPC {
    public void setRestaurant(String restaurant);

    public List<String> getRestaurant();

    public List<String> getMenu(String Restaurant);

    public void setMenu(String Restaurant);

    public int getPrice(List<String> selection);

    public void setPrice(List<String> selection);

    public Object getReservation(Object o);

    public void setReservation(Object o);
}
