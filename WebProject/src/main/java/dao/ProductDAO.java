//package dao;
//
//import model.Product;
//
//import java.util.ArrayList;
//import java.util.List;
//
//public class ProductDAO {
//
//
//    public List<Product> searchByName(String txtSearch) {
//        List<Product> list = new ArrayList<>();
//        String query = "select * from product\n" + "where [name] like ?";
//        try {
//            Jdbi JDBI = ConnectJDBI.connector();
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, "%" + txtSearch + "%");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Product(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(5),
//                        rs.getDouble(4),
//                        rs.getString(6)));
//            }
//            }catch(Exception e){
//        }
//            return list;
//    }
//}