package Service;
import Beans.Slider;
import DAO.SliderDAO;

import java.util.List;

public class SliderService {
    private SliderDAO sliderDAO =  new SliderDAO();
    public List<Slider> findAll() {
        return sliderDAO.findAll();
    }

}

