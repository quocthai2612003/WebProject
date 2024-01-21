package dao;

import model.Product;
import org.jdbi.v3.core.Jdbi;

import java.io.File;
import java.io.FileInputStream;
import java.util.Arrays;
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
                        handle.createUpdate("INSERT INTO images(ID, ID_product, source, is_thumbnail_image) " +
                                "Values(?, ?, ?, ?)")
                                .bind(0, ID_image)
                                .bind(1, idProduct)
                                .bind(2, url)
                                .bind(3, check).execute());
            }

        return execute;
    }

    public static void main(String[] args) {
        System.out.println(addImages());
    }
}
