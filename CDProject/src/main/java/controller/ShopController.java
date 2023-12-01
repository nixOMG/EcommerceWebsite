package controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Category;
import entity.Product;
import entityManager.CategoryEM;
import entityManager.DBUtil;
import entityManager.ProductEM;

/**
 * Servlet implementation class ShopController
 */
@WebServlet("/shop")
public class ShopController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println("check action: " + action);
		if(action != null && action.equals("detail")) {
			getDetailProduct(request, response);
		}
		else if (action != null && action.equals("sort")) {
			sortProduct(request, response);
		}
		else if (action != null && action.equals("product-by-category")) {
			getProductByCategory(request, response);
		}
		else if (action != null && action.equals("search-product")) {
			getProductBySearchName(request, response);
		}
		else {
			// Lấy danh sách danh mục
	        EntityManager entityManager = DBUtil.getEntityManager();
	        CategoryEM categoryEM = new CategoryEM(entityManager);
	        List<Category> categories = categoryEM.getAllCategories();
	        System.out.println(categories.size());

	        // Đặt danh sách danh mục vào thuộc tính của request
	        request.setAttribute("categories", categories);

	        // Lấy danh sách sản phẩm
	        ProductEM productEM = new ProductEM(entityManager);
	        List<Product> products = productEM.getAllProducts();
	        System.out.println(products.size());

	        // Đặt danh sách sản phẩm vào thuộc tính của request
	        request.setAttribute("products", products);

	        String url = "/shop.jsp";
	        // Chuyển hướng đến JSP để hiển thị danh sách danh mục và sản phẩm
	        RequestDispatcher rd = request.getRequestDispatcher(url);
	        rd.forward(request, response);

	        // Đóng EntityManager
	        if (entityManager.getEntityManagerFactory().isOpen()) {
	            entityManager.close();
	        }
		}
	}

	private void getProductBySearchName(HttpServletRequest request, HttpServletResponse response) {
		try {
			String productName = request.getParameter("productName");
			if(productName != null) {
				EntityManager entityManager = DBUtil.getEntityManager();
                // Lấy danh sách sản phẩm theo category_id
                List<Product> products = new ProductEM(entityManager).searchProductsByName(productName);
                
                // Đặt danh sách vào thuộc tính của request
                request.setAttribute("products", products);
                
                System.out.println("check result search: " + products.size());
                
                CategoryEM categoryEM = new CategoryEM(entityManager);
    	        List<Category> categories = categoryEM.getAllCategories();
    	        request.setAttribute("categories", categories);

                // Forward request đến JSP
                RequestDispatcher rd = request.getRequestDispatcher("/shop.jsp");
                rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void getProductByCategory(HttpServletRequest request, HttpServletResponse response) {
		try {
			String categoryIdStr = request.getParameter("categoryId");
			// Kiểm tra xem categoryId có tồn tại và có giá trị hợp lệ không
	        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
	            try {
	                int categoryId = Integer.parseInt(categoryIdStr);

	                EntityManager entityManager = DBUtil.getEntityManager();
	                // Lấy danh sách sản phẩm theo category_id
	                List<Product> products = new ProductEM(entityManager).getProductsByCategoryId(categoryId);

	                // Đặt danh sách vào thuộc tính của request
	                request.setAttribute("products", products);
	                
	                CategoryEM categoryEM = new CategoryEM(entityManager);
	    	        List<Category> categories = categoryEM.getAllCategories();
	    	        request.setAttribute("categories", categories);
	    	        
	    	        Category selectedCategory = categoryEM.getCategoryById(categoryId);
	    	        request.setAttribute("selectedCategory", selectedCategory);

	                // Forward request đến JSP
	                RequestDispatcher rd = request.getRequestDispatcher("/shop.jsp");
	                rd.forward(request, response);
	            } catch (NumberFormatException e) {
	                // Xử lý lỗi nếu categoryId không phải là một số nguyên hợp lệ
	                e.printStackTrace();
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	            }
	        } else {
	            // Xử lý lỗi nếu categoryId không được cung cấp
	            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getDetailProduct(HttpServletRequest request, HttpServletResponse response) {
		try {
			String productId = request.getParameter("productId");
		 	if (productId != null && !productId.isEmpty()) {
		        // Lấy EntityManager từ DBUtil (đã được xác định trong dự án của bạn)
		        EntityManager entityManager = DBUtil.getEntityManager();
		
		        // Tạo ProductEM và lấy sản phẩm theo ID
		        ProductEM productEM = new ProductEM(entityManager);
		        int productIdInt = Integer.parseInt(productId);
		        Product product = productEM.getProductById(productIdInt);
		
		        // Đặt sản phẩm vào thuộc tính của request để truyền qua JSP
		        request.setAttribute("product", product);
		
		        // Đóng EntityManager
		        if (entityManager.getEntityManagerFactory().isOpen()) {
		            entityManager.close();
		        }
		
		        // Chuyển hướng đến trang JSP để hiển thị chi tiết sản phẩm
		        RequestDispatcher rd = request.getRequestDispatcher("/product-detail.jsp");
		        rd.forward(request, response);
		 	}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void sortProduct(HttpServletRequest request, HttpServletResponse response) {
		String sortType = request.getParameter("sort");
		try {
			EntityManager entityManager = DBUtil.getEntityManager();
			List<Product> products;
			if ("priceasc".equals(sortType)) {
	            // Sắp xếp theo giá
				products = new ProductEM(entityManager).getProductsSortedByPriceAsc();
	        } 
			else if ("atoz".equals(sortType)) {
	            // Sắp xếp theo tên từ A-Z
	            products = new ProductEM(entityManager).getProductsSortedByName();
			}  
			else {
	            // Nếu không có hoặc giá trị không hợp lệ, lấy danh sách sản phẩm mặc định (có thể là danh sách không sắp xếp)
	    	   products = new ProductEM(entityManager).getAllProducts();
	        }
			 
		 	// Đặt danh sách sản phẩm vào thuộc tính của request
	        request.setAttribute("products", products);
	        
	        CategoryEM categoryEM = new CategoryEM(entityManager);
	        List<Category> categories = categoryEM.getAllCategories();
	        request.setAttribute("categories", categories);
	        
	        String url = "/shop.jsp";
	        // Chuyển hướng đến JSP để hiển thị danh sách danh mục và sản phẩm
	        RequestDispatcher rd = request.getRequestDispatcher(url);
	        rd.forward(request, response);
	        
	        // Đóng EntityManager
	        if (entityManager.getEntityManagerFactory().isOpen()) {
	            entityManager.close();
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
