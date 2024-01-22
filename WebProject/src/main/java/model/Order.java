package model;

import java.util.Date;
import java.util.List;

public class Order {
    private int id; // Assuming int as the ID type
    private String address;
    private int status;
    private Date dateBuy;
    private Date dateArrival;
    private int ID_account;

    public Order() {
        // Default constructor
    }

    public Order(int id, String address, int status, Date dateBuy, Date dateArrival, int ID_account) {
        this.id = id;
        this.address = address;
        this.status = status;
        this.dateBuy = dateBuy;
        this.dateArrival = dateArrival;
        this.ID_account = ID_account;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public Date getDatebuy() {
        return dateBuy;
    }

    public void setDatebuy(Date dateBuy) {
        this.dateBuy = dateBuy;
    }

    public Date getDateArrival() {
        return dateArrival;
    }

    public void setDateArrival(Date dateArrival) {
        this.dateArrival = dateArrival;
    }

}
