package DAO;

import Model.Product;
import Model.Slider;
import org.jdbi.v3.core.Jdbi;

import java.io.File;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductDAO {
    private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName());
    private static Jdbi JDBI;
    public static Map<String, String> selectCategory() {
        JDBI = ConnectJDBI.connector();
        List<Map<String, Object>> maps = JDBI.withHandle(handle ->
                handle.createQuery("SELECT id, name FROM categorys").mapToMap().collectIntoList()
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
                handle.createQuery("SELECT idProduct, source FROM images " +
                        "Where is_thumbnail_image=1").mapToMap().collectIntoList()
        );
        Map<String, String> listImages = new HashMap<>();
        for(int i = 0; i <maps.size(); i++ ) {
            String id = maps.get(i).get("idproduct").toString();
            String name = maps.get(i).get("source").toString();
            listImages.put(id, name);
        }
        return listImages;
    }


    public static int addImages() {
        JDBI = ConnectJDBI.connector();
        int index = 280;
        File file = new File("C:\\Users\\Hieu\\Desktop\\New folder (2)");
        int execute=0;
        int i = 49;
            String idw = "%"+i;
            Product p = JDBI.withHandle(handle ->
                    handle.createQuery("SELECT * FROM products Where ID like ?")
                            .bind(0, idw).mapToBean(Product.class).first());
            String idProduct = p.getId();
            File[] files = file.listFiles((dir, name) -> name.startsWith(idProduct));
            for (File f : files) {
                int ID_image = index++;
                String url = "./assets/images/product_img/" + f.getName();
                int check;
                if (f.getName().indexOf("(1)") != -1) check = 1;
                else {
                    check = 0;
                }
                execute+= JDBI.withHandle(handle ->
                        handle.createUpdate("INSERT INTO images(ID, idProduct, source, is_thumbnail_image) " +
                                "Values(?, ?, ?, ?)")
                                .bind(0, ID_image)
                                .bind(1, idProduct)
                                .bind(2, url)
                                .bind(3, check).execute());
            }

        return execute;
    }

    public static int totalQuantityProduct() {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT SUM(quantity) " +
                        "FROM products Where status = 1").mapTo(Integer.class).findOnly()
        );

        return total;
    }

    public static int totalQuantityProductByCategory(String id_category) {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT SUM(quantity) " +
                        "FROM products Where idCategory = ? And status = 1").bind(0, id_category).mapTo(Integer.class).findOnly()
        );

        return total;
    }

    public static List<Product> productList() {
        JDBI = ConnectJDBI.connector();
         List<Product> productList= JDBI.withHandle(handle ->
                handle.createQuery("SELECT id, name, price, quantity, status " +
                        "FROM products Where status = 1").mapToBean(Product.class).stream().toList()
        );

        return productList;
    }
    public static int totalProduct() {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT Count(id) " +
                        "FROM products Where status = 1").mapTo(Integer.class).findOnly()
        );
        return total;
    }


    public static int totalProductBySearch(String search) {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT Count(id) " +
                        "FROM products Where id like ? or name like ? and status = 1")
                        .bind(0, "%" + search + "%")
                        .bind(1, "%" + search + "%").mapTo(Integer.class).findOnly()
        );
        return total;
    }

    public static int insertImages(String idProduct, String source, boolean isThumbnail) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO images(idProduct, source, is_thumbnail_image) " +
                        "Values(?, ?, ?)")
                        .bind(0, idProduct)
                        .bind(1, source)
                        .bind(2, isThumbnail).execute());
        return execute;
    }

    public static int insertProduct(String id, String name, String price, String quantity, String material,
                                    String size, String color, String gender, String idCategory) {
        JDBI = ConnectJDBI.connector();
        try {
            int execute = JDBI.withHandle(handle ->
                    handle.createUpdate("INSERT INTO products(id, name, price, quantity, material, size,color, gender, status, idCategory) " +
                                    "Values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                            .bind(0, id)
                            .bind(1, name)
                            .bind(2, price)
                            .bind(3, quantity)
                            .bind(4, material)
                            .bind(5, size)
                            .bind(6, color)
                            .bind(7, gender)
                            .bind(8, 1)
                            .bind(9, idCategory).execute());
            return execute;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    private static int deleteImages(String idProduct) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("DELETE FROM images Where idProduct = ?")
                        .bind(0, idProduct).execute());
        return execute;
    }
    public static int deleteProduct(String id) {
        if (deleteImages(id) > 0) {
            int execute = JDBI.withHandle(handle ->
                    handle.createUpdate("DELETE FROM products Where id = ?")
                            .bind(0, id).execute());
            return execute;
        } else {
            return 0;
        }
    }

    public static int updateProduct(String id, int status) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("Update products Set status = ? Where id = ?")
                        .bind(0, status).bind(1, id).execute());
        return execute;
    }

    public static List<Product> findByCategory(int categoryId) {
        Jdbi jdbi = ConnectJDBI.connector();
        List<Product> products;
        try {
            products = jdbi.withHandle(handle -> {
                String sql = "SELECT p.id, p.name, p.price, p.quantity, p.material, p.gender, p.idCategory,p.size,p.color FROM products p where p.idCategory = :categoryId" +
                        " LIMIT 15";
                return handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .mapToBean(Product.class).stream().toList();
            });
        } catch (Exception e) {
            throw e;
        }
        return products;
    }
    public static double getRating(String id_product){
        Jdbi jdbi = ConnectJDBI.connector();
        try {
            Double averageRating = jdbi.withHandle(handle -> {
                String sql = "SELECT AVG(rating) FROM product_ratings WHERE idProduct = :id_product";
                return handle.createQuery(sql)
                        .bind("id_product", id_product)
                        .mapTo(Double.class)
                        .one();
            });

            // Handle the case where there are no ratings for the given product
            return averageRating != null ? averageRating : 0.0;

        } catch (Exception e) {
            throw e;
        }
    }

    public static List<Product> findByGender(String gender) {
        JDBI = ConnectJDBI.connector();
        List<Product> products;
        try {
            products = JDBI.withHandle(handle -> {
                String sql = "SELECT p.id, p.name, p.price, p.quantity, p.material, p.gender, p.idCategory,p.size,p.color FROM products p where p.gender = :gender " +
                        "LIMIT 15";
                return handle.createQuery(sql)
                        .bind("gender", gender)
                        .mapToBean(Product.class).stream().toList();
            });
        } catch (Exception e) {
            throw e;
        }
        return products;
    }

    public static Product getProductById(String productId) {
        JDBI = ConnectJDBI.connector();
        try {
            return JDBI.withHandle(handle -> {
                String sql = "SELECT p.id, p.name, p.price, p.quantity, p.material, p.gender, p.idCategory " +
                        "FROM products p " +
                        "WHERE p.id = :id";
                return handle.createQuery(sql)
                        .bind("id", productId)
                        .mapToBean(Product.class)
                        .findFirst()
                        .orElse(null);
            });
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product by ID: " + productId, e);
            throw new RuntimeException("Error retrieving product by ID", e);
        }

    }
    public static List<Slider> findAll() {
        JDBI = ConnectJDBI.connector();
        List<Slider> sliders = JDBI.withHandle(handle -> {
            String sql = "SELECT id,source FROM slider_imgs";
            return handle.createQuery(sql).mapToBean(Slider.class).stream().collect(Collectors.toList());
        });
        return sliders;
    }
}
