package model;

import java.util.Date;
import java.util.List;

public class Order {
    private String id; // Assuming int as the ID type
    private String fullname;
    private String address;
    private int status;
    private Date dateBuy;
    private Date dateArrival;
    String numberPhone;
    private int ID_account;

    public Order() {
        // Default constructor
    }

    public Order(String id, String fullname, String address, int status, Date dateBuy, Date dateArrival, String numberPhone, int ID_account) {
        this.id = id;
        this.fullname = fullname;
        this.address = address;
        this.status = status;
        this.dateBuy = dateBuy;
        this.dateArrival = dateArrival;
        this.numberPhone = numberPhone;
        this.ID_account = ID_account;
    }

    public Order(String id, String fullname, Date dateBuy, Date dateArrival, String address, String numberPhone, int status) {
        this.id = id;
        this.fullname = fullname;
        this.dateBuy = dateBuy;
        this.dateArrival = dateArrival;
        this.address = address;
        this.numberPhone = numberPhone;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getID_account() {
        return ID_account;
    }

    public void setID_account(int ID_account) {
        this.ID_account = ID_account;
    }

    public Date getDateArrival() {
        return dateArrival;
    }

    public void setDateArrival(Date dateArrival) {
        this.dateArrival = dateArrival;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getDateBuy() {
        return dateBuy;
    }

    public void setDateBuy(Date dateBuy) {
        this.dateBuy = dateBuy;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }
}
