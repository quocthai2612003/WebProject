//package controller;
//
//import dao.ProductDAO;
//import model.Product;
//
//import java.io.*;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.*;
//import javax.servlet.annotation.*;
//
//@WebServlet(name = "SearchController", value = "/search")
//public class SearchController extends HttpServlet {
//
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        String txtSearch = request.getParameter("txt");
//        ProductDAO dao = new ProductDAO();
//        List<Product> list = dao.searchByName(txtSearch);
//
//
//        request.setAttribute("list", list);
//        request.getRequestDispatcher("home.jsp").forward(request, response);
//    }
//}