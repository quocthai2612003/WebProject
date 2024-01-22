package Beans;

public class Slider {
private int id;
private String img_link;



    public Slider(int id, String img_link) {
        this.id = id;
        this.img_link = img_link;
    }
    public Slider() {

    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg_link() {
        return img_link;
    }

    public void setImg_link(String img_link) {
        this.img_link = img_link;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", img_link='" + img_link + '\'' +
                '}';
    }
}
