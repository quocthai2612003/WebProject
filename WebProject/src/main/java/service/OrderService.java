package service;

import dao.OrderDAO;
import model.Order;

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
}
