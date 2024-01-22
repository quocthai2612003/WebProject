    package Service;

    import model.CartItems;
    import model.Order;
    import model.Order_detail;
    import DAO.OrderDao;

    import java.util.Date;
    import java.util.List;

    public class OrderService {
        private static OrderService instance;
        private OrderDao orderDao = new OrderDao();
        public static OrderService getInstance() {
            if (instance == null)
                instance = new OrderService();
            return instance;
        }
        public List<Order> showOrder(int id) {
            return orderDao.showOrder(id);
        }
        public List<Order_detail> getProductsForUserAndOrder(int userId, String orderId) {
            return orderDao.getProductsForUserAndOrder(userId,orderId);
        }
        public static boolean addOrder(String address, int status, int id_account, Date datebuy, Date datearrival,String numberPhone){

            return OrderDao.addOrder(address,status,id_account,datebuy,datearrival,numberPhone);
        }
        public List<CartItems> addProductToOrder(String idprodcut, int quanlity, int price){
            return orderDao.addProductToOrder(idprodcut,quanlity,price);
        }
        public static void main(String[] args) {
            OrderService od = new OrderService();

        }
        }

