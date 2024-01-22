package model;

import java.util.Date;

public class Order {
    private String id; // Assuming int as the ID type
    private String address;
    private int status;
    private Date dateBuy;
    private Date dateArrival;
    private int idAccount;
    private String numberPhone;
    // Constructors, getters, and setters

    public Order() {
        // Default constructor
    }

    public Order(String id, String address, int status, Date dateBuy, Date dateArrival, int idAccount, String numberPhone) {
        this.id = id;
        this.address = address;
        this.status = status;
        this.dateBuy = dateBuy;
        this.dateArrival = dateArrival;
        this.idAccount = idAccount;
        this.numberPhone = numberPhone;
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

    public Date getDateBuy() {
        return dateBuy;
    }

    public void setDateBuy(Date dateBuy) {
        this.dateBuy = dateBuy;
    }

    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public Date getDateArrival() {
        return dateArrival;
    }

    public void setDateArrival(Date dateArrival) {
        this.dateArrival = dateArrival;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", dateBuy=" + dateBuy +
                ", dateArrival=" + dateArrival +
                ", idAccount=" + idAccount +
                ", numberPhone='" + numberPhone + '\'' +
                '}';
    }
}

