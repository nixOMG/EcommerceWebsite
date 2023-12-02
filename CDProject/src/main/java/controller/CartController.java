package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Cart;
import entity.Bill;
import entity.BillDetail;
import entity.Category;
import entity.Product;
import entity.User;
import entityManager.BillEM;
import entityManager.CategoryEM;
import entityManager.DBUtil;
import entityManager.ProductEM;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("delete-cart")) {
			handleDeleteCart(request, response);
		}
		else if (action != null && action.equals("add-cart")) {
			handleAddCart(request, response);
		}
		else if (action != null && action.equals("order")) {
			handleOrder(request, response);
		}
		else {
			String url = "/cart.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}

	private void handleOrder(HttpServletRequest request, HttpServletResponse response) {
	    EntityManager entityManager = null;
	    try {
	        entityManager = DBUtil.getEntityManager();
	        BillEM billEM = new BillEM(entityManager);

	        HttpSession session = request.getSession();
	        HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
	        User user = (User) session.getAttribute("loggedInUser");

	        String thongBao = "";

	        if (user != null && cart != null && !cart.isEmpty()) {
	            try {
	                Bill bill = new Bill();
	                bill.setUser(user);
	                bill.setTotalPrice(totalPrice(cart));
	                bill.setStatus(1);
	                
	                if(bill.getTotalPrice() >= 500000) {
	                	bill.setShipFee(0);
	                }
	                else {
	                	bill.setShipFee(30000);
	                }

	                // Get the current date and time
	                LocalDateTime currentDateTime = LocalDateTime.now();

	                // Convert to java.sql.Date
	                Instant instant = currentDateTime.atZone(ZoneId.systemDefault()).toInstant();
	                bill.setBillDate(new java.sql.Date(instant.toEpochMilli()));

	                ArrayList<BillDetail> listBillDetails = new ArrayList<>();

	                for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
	                    int quantity = entry.getValue().getQuantity();
	                    int totalPrice = entry.getValue().getTotalPrice();
	                    Product product = entry.getValue().getProduct();

	                    BillDetail billDetail = new BillDetail();
	                    billDetail.setPrice(product.getPrice());
	                    billDetail.setQuantity(quantity);
	                    billDetail.setProduct(product);
	                    billDetail.setBill(bill);

	                    listBillDetails.add(billDetail);
	                }

	                billEM.saveBillAndDetails(bill, listBillDetails);

	                // Clear the cart information from the session
	                session.removeAttribute("cart");
	                session.removeAttribute("totalQuantity");
	                session.removeAttribute("totalPrice");

	                thongBao = "Đặt hàng thành công!";
	            } catch (Exception e) {
	                thongBao = "Đã gặp lỗi khi đặt hàng. Vui lòng thử lại hoặc liên hệ với bộ phận hỗ trợ!";
	                e.printStackTrace();
	            }
	        } else {
	            thongBao = "Không có người dùng đăng nhập hoặc giỏ hàng trống!";
	        }

	        request.setAttribute("thongBao", thongBao);
	        String url = "/cart.jsp";
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
	        rd.forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (entityManager != null && entityManager.isOpen()) {
	            entityManager.close();
	        }
	    }
	}


	private void handleDeleteCart(HttpServletRequest request, HttpServletResponse response) {
		try {
			String productIdStr = request.getParameter("productId");
			int productId = Integer.parseInt(productIdStr);
			HttpSession	session = request.getSession();
			HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
			if(cart == null) {
				cart = new HashMap();
			}
			cart = deleteCart(productId, cart);
			session.setAttribute("cart", cart);
			session.setAttribute("totalQuantity", totalQuantity(cart));
			session.setAttribute("totalPrice", totalPrice(cart));
			String url = "/cart.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void handleAddCart(HttpServletRequest request, HttpServletResponse response) {
		try {
			String productIdStr = request.getParameter("productId");
			int productId = Integer.parseInt(productIdStr);
			HttpSession	session = request.getSession();
			HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
			if(cart == null) {
				cart = new HashMap();
			}
			cart = addCart(productId, cart);
			session.setAttribute("cart", cart);
			session.setAttribute("totalQuantity", totalQuantity(cart));
			session.setAttribute("totalPrice", totalPrice(cart));
			
			EntityManager entityManager = DBUtil.getEntityManager();
			// Lấy danh sách sản phẩm theo category_id
			List<Product> products = new ProductEM(entityManager).getAllProducts();
			
			// Đặt danh sách vào thuộc tính của request
			request.setAttribute("products", products);
             
         	CategoryEM categoryEM = new CategoryEM(entityManager);
			List<Category> categories = categoryEM.getAllCategories();
			request.setAttribute("categories", categories);
 	        
			response.sendRedirect(request.getHeader("referer"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public HashMap<Integer, Cart> deleteCart(int productId, HashMap<Integer, Cart> cart) {
		if(cart == null) {
			return cart;
		}
		if(cart.containsKey(productId)) {
			cart.remove(productId);
		}
		return cart;
	}
	
	public HashMap<Integer, Cart> addCart(int productId, HashMap<Integer, Cart> cart) {
		Cart itemCart = new Cart();
		
		EntityManager entityManager = DBUtil.getEntityManager();
		// Tạo ProductEM và lấy sản phẩm theo ID
        ProductEM productEM = new ProductEM(entityManager);
        Product product = productEM.getProductById(productId);
        
		if(product != null && cart.containsKey(productId)) {
			itemCart = cart.get(productId);
			itemCart.setQuantity(itemCart.getQuantity() + 1);
			itemCart.setTotalPrice(itemCart.getQuantity() * itemCart.getProduct().getPrice());
		}
		else {
			itemCart.setProduct(product);
			itemCart.setQuantity(1);
			itemCart.setTotalPrice(product.getPrice());
		}
		cart.put(productId, itemCart);
		return cart;
	}
	
	public int totalQuantity(HashMap<Integer, Cart> cart) {
		int totalQuantity = 0;
		for(Map.Entry<Integer, Cart> itemCart : cart.entrySet()) {
			totalQuantity += itemCart.getValue().getQuantity();	
		}
		return totalQuantity;
	}
	
	public int totalPrice(HashMap<Integer, Cart> cart) {
		int totalPrice = 0;
		for(Map.Entry<Integer, Cart> itemCart : cart.entrySet()) {
			totalPrice += itemCart.getValue().getTotalPrice();	
		}
		return totalPrice;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("edit-cart")) {
			handleEditCart(request, response);
		}
	}

	private void handleEditCart(HttpServletRequest request, HttpServletResponse response) {
		try {
			String productIdStr = request.getParameter("productId");
			int productId = Integer.parseInt(productIdStr);
			String quantityStr = request.getParameter("quantity");
			int quantity = Integer.parseInt(quantityStr);
			HttpSession	session = request.getSession();
			HashMap<Integer, Cart> cart = (HashMap<Integer, Cart>) session.getAttribute("cart");
			if(cart == null) {
				cart = new HashMap();
			}
			cart = editCart(productId, quantity, cart);
			session.setAttribute("cart", cart);
			session.setAttribute("totalQuantity", totalQuantity(cart));
			session.setAttribute("totalPrice", totalPrice(cart));
			String url = "/cart.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public HashMap<Integer, Cart> editCart(int productId, int quantity, HashMap<Integer, Cart> cart) {
		if(cart == null) {
			return cart;
		}
		Cart itemCart = new Cart();
		if(cart.containsKey(productId)) {
			itemCart = cart.get(productId);
			itemCart.setQuantity(quantity);
			int totalPrice = quantity * itemCart.getProduct().getPrice();
			itemCart.setTotalPrice(totalPrice);
		}
		cart.put(productId, itemCart);
		return cart;
	}

}
