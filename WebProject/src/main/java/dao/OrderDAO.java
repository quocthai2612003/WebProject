package dao;

import org.jdbi.v3.core.Jdbi;

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

    public static void main(String[] args) {
        System.out.println(totalProductSoldByCategory("3", "2024/01/12"));
    }
}
