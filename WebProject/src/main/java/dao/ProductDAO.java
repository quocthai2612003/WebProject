package dao;

import model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO {
    private static Jdbi JDBI;
    public static Map<String, String> selectCategory() {
        JDBI = ConnectJDBI.connector();
        List<Map<String, Object>> maps = JDBI.withHandle(handle ->
                handle.createQuery("SELECT ID, name FROM categorys").mapToMap().collectIntoList()
        );
        Map<String, String> listCategorys = new HashMap<>();
        for(int i = 0; i <maps.size(); i++ ) {
            String id = maps.get(i).get("id").toString();
            String name = maps.get(i).get("name").toString();
            listCategorys.put(id, name);
        }
        return listCategorys;
    }

    public static Map<String, String> selectImageThumbnail() {
        JDBI = ConnectJDBI.connector();
        List<Map<String, Object>> maps = JDBI.withHandle(handle ->
                handle.createQuery("SELECT ID_product, source FROM images " +
                        "Where is_thumbnail_image=1").mapToMap().collectIntoList()
        );
        Map<String, String> listImages = new HashMap<>();
        for(int i = 0; i <maps.size(); i++ ) {
            String id = maps.get(i).get("id_product").toString();
            String name = maps.get(i).get("source").toString();
            listImages.put(id, name);
        }
        return listImages;
    }

    public static List<Product> paginationProduct(int limit, int page, String id_category) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select ID, name, price, ID_category From products " +
                                "Where ID_category = ? Limit ? Offset ?")
                        .bind(0, id_category)
                        .bind(1, limit)
                        .bind(2, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }

    public static int countProduct() {
        JDBI = ConnectJDBI.connector();
        Integer count = JDBI.withHandle(handle ->
                handle.createQuery("Select COUNT(ID) From products").mapTo(Integer.class).findOnly());

        return count;
    }

    public static void main(String[] args) {
        System.out.println((int)Math.ceil(24/12));
    }
}
