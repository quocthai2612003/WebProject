package dao;

import model.Order;
import model.Order_detail;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class OrderDAO {
    private static Jdbi JDBI;
    public static int totalOrder() {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("Select COUNT(id) From orders").mapTo(Integer.class).findOnly());
        return total;
    }
    public static int totalProductSoldByCategory(String id_category, String date) {
        JDBI = ConnectJDBI.connector();
        try {
            int total = JDBI.withHandle(handle ->
                    handle.createQuery("SELECT SUM(o.quantity) FROM categorys c INNER JOIN " +
                                    "products p ON c.id = p.idCategory INNER JOIN order_details o ON p.id = o.idProduct " +
                                    "INNER JOIN orders od ON o.idOrder = od.id " +
                                    "Where c.id = ? And o.dateBuy >= ? And od.status = 1")
                            .bind(0, id_category)
                            .bind(1, date).mapTo(Integer.class).findOnly());
            return total;
        } catch (Exception e) {
            return 0;
        }
    }

    public static int revenueOfCategory(String id_category, String date) {
        JDBI = ConnectJDBI.connector();
        try {
            int total = JDBI.withHandle(handle ->
                    handle.createQuery("SELECT SUM(o.price) FROM categorys c INNER JOIN " +
                                    "products p ON c.id = p.idCategory INNER JOIN order_details o ON p.id = o.idProduct " +
                                    "INNER JOIN orders od ON o.idOrder = od.id " +
                                    "Where c.id = ? And o.dateBuy >= ? And od.status = 1")
                            .bind(0, id_category)
                            .bind(1, date).mapTo(Integer.class).findOnly());
            return total;
        } catch (Exception e) {
            return 0;
        }
    }

    public static int totalOrderBySearch(String search) {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT COUNT(o.id) " +
                                "From accounts a INNER JOIN orders o ON a.id = o.idAccount Where a.fullname like ? ")
                        .bind(0, "%" + search + "%").mapTo(Integer.class).findOnly()
        );

        return total;
    }

    public static Order orderById(String idOrder) {
        JDBI = ConnectJDBI.connector();
        Order order = JDBI.withHandle(handle ->
                handle.createQuery("SELECT o.id, a.fullname, o.dateBuy, o.dateArrival, o.address, o.numberPhone, o.status" +
                        " From accounts a INNER JOIN orders o ON a.id = o.idAccount Where o.id = ?")
                        .bind(0, idOrder).mapToBean(Order.class).first());
        return order;
    }

    public static List<Order_detail> orderDetailList(String idOrder) {
        JDBI = ConnectJDBI.connector();
        List<Order_detail> orderDetailList = JDBI.withHandle(handle ->
                handle.createQuery("Select idOrder, idProduct, quantity, price From order_details " +
                        "Where idOrder = ?")
                        .bind(0, idOrder).mapToBean(Order_detail.class).stream().toList());
        return orderDetailList;
    }

    public static int totalPriceOrderDetail(String idOrder) {
        JDBI = ConnectJDBI.connector();
        try {
            int total = JDBI.withHandle(handle ->
                    handle.createQuery("Select SUM(price) from order_details Where idOrder = ?")
                            .bind(0, idOrder).mapTo(Integer.class).findOnly());
            return total;
        } catch (Exception e) {
            return 0;
        }
    }
}
