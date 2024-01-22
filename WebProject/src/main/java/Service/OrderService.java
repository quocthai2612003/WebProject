package Service;

import DAO.OrderDAO;
import Model.CartItems;
import Model.Order;
import Model.Order_detail;

import java.util.Date;
import java.util.List;

public class OrderService {
    static OrderService orderService = getInstance();

    public static OrderService getInstance() {
        if (orderService == null) orderService = new OrderService();
        return orderService;
    }

    public  int totalOrder() {
        return OrderDAO.totalOrder();
    }
    public int totalProductSoldByCategory(String id_category, String date) {
        return OrderDAO.totalProductSoldByCategory(id_category, date);
    }

    public int revenueOfCategory(String id_category, String date) {
        return OrderDAO.revenueOfCategory(id_category, date);
    }

    public int totalOrderBySearch(String search) {
        return OrderDAO.totalOrderBySearch(search);
    }
    public List<Order> showOrder(int id) {
        return OrderDAO.showOrder(id);
    }
    public List<Order_detail> getProductsForUserAndOrder(int userId, String orderId) {
        return OrderDAO.getProductsForUserAndOrder(userId,orderId);
    }
    public static boolean addOrder(String address, int status, int id_account, Date datebuy, Date datearrival, String numberPhone){

        return OrderDAO.addOrder(address,status,id_account,datebuy,datearrival,numberPhone);
    }
    public List<CartItems> addProductToOrder(String idprodcut, int quanlity, int price){
        return OrderDAO.addProductToOrder(idprodcut,quanlity,price);
    }
}

