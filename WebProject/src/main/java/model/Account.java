package model;

public class Account {
    private int ID;
    private String username;
    private String password;
    private String email;
    private String fullname;
    private String numberPhone;
    private int status;

    public Account(int ID, String username, String password, String email, String fullname, String numberPhone, int status) {
        this.ID = ID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.numberPhone = numberPhone;
        this.status = status;
    }

    public Account() {
    }

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
