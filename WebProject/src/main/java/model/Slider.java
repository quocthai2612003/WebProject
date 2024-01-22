package model;

public class Slider {
private int id;
private String source;


    public Slider(int id, String source) {
        this.id = id;
        this.source = source;
    }

    public Slider() {

    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Override
    public String toString() {
        return "Slider{" +
                "id=" + id +
                ", source='" + source + '\'' +
                '}';
    }
}
