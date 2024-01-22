package DAO;
import Model.Slider;
import org.jdbi.v3.core.Jdbi;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class SliderDAO {
    public List<Slider> findAll() {
        Jdbi jdbi = ConnectJDBI.connector();
        List<Slider> sliders = jdbi.withHandle(handle -> {
            String sql = "SELECT * FROM SLIDER_IMGS";
            return handle.createQuery(sql).mapToBean(Slider.class).stream().collect(Collectors.toList());
        });
        System.out.println(Arrays.toString(sliders.toArray()));
        return sliders;
    }

    public static void main(String[] args) {
        SliderDAO d1 = new SliderDAO();
        d1.findAll();
    }
}
