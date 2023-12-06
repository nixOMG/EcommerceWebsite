package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import entityManager.DBUtil;
import entityManager.UserEM;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/manage-customer")
@MultipartConfig
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if(action != null && action.equals("get-page-edit-customer")) {
		}
		else if(action != null && action.equals("get-page-edit-user")) {
			handleGetPageEditCustomer(request, response);
		}
		else if (action != null && action.equals("get-page-delete-user")) {
			handleGetPageDeleteCustomer(request, response);
		}
		else {
			handleGetPageManageCustomer(request, response);
		}
	}
	private void handleGetPageDeleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			 int userId = Integer.parseInt(request.getParameter("userId"));
			 
			 EntityManager entityManager = DBUtil.getEntityManager();
			 
			 UserEM userEM = new UserEM(entityManager);
			 User user = userEM.getUserById(userId);			 
			// Đặt thông tin sản phẩm vào request để chuyển đến trang delete-user.jsp
             request.setAttribute("user", user);
            // Đóng EntityManager
            entityManager.close();
            
         // Chuyển hướng đến trang edit-product.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/delete-user.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void handleGetPageEditCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			 int userId = Integer.parseInt(request.getParameter("userId"));
			 
			 EntityManager entityManager = DBUtil.getEntityManager();
			 
			 UserEM userEM = new UserEM(entityManager);
			 User user = userEM.getUserById(userId);			 
			// Đặt thông tin sản phẩm vào request để chuyển đến trang delete-user.jsp
             request.setAttribute("user", user);
            // Đóng EntityManager
            entityManager.close();
            
         // Chuyển hướng đến trang edit-user.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/edit-user.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void handleGetPageManageCustomer(HttpServletRequest request, HttpServletResponse response) {
		try {
			EntityManager entityManager = DBUtil.getEntityManager();
			// Gọi đến UserEM để lấy danh sách người dùng với roleId=2
	        UserEM userEM = new UserEM(entityManager);
	        List<User> users = userEM.getUsersByRoleId(2);
	        // Đóng EntityManager và EntityManagerFactory sau khi sử dụng xong
	        entityManager.close();
	        
	        // Chuyển danh sách người dùng đến trang manage-customer.jsp
	        request.setAttribute("users", users);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("manage-customer.jsp");
	        dispatcher.forward(request, response);
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println("check action: " + action);
		if(action != null && action.equals("edit-user")) {
			handleEditUser(request, response);
		}
		else if (action != null && action.equals("delete-user")){
			handleDeleteUser(request, response);
		}
		else {
			handleGetUsersByPage(request, response);
		}
	}
	
	private void handleDeleteUser(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    try {
	    	
	        int userId = Integer.parseInt(request.getParameter("userId"));
	        System.out.println("check userId: " + userId);
	        // Gọi hàm để lấy sản phẩm từ CSDL dựa trên userId
	        EntityManager entityManager = DBUtil.getEntityManager();
	        
	        UserEM userEM = new UserEM(entityManager);
	        
	        // Gọi hàm xóa sản phẩm trong usertEM
	        userEM.deleteUser(userId);
	        
	        // Chuyển hướng về trang danh sách sản phẩm sau khi xóa
	        handleGetUsersByPage(request, response);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	private void handleEditUser(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			System.out.println("check userId: " + userId);
	        String email = request.getParameter("email");
	        String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	        String phone = request.getParameter("phone");
	        String address = request.getParameter("address");
            
            // Gọi hàm để lấy sản phẩm từ CSDL dựa trên userId
	        EntityManager entityManager = DBUtil.getEntityManager();
	        
            UserEM userEM = new UserEM(entityManager);
            User userToUpdate = userEM.getUserById(userId);
            
            // Cập nhật thông tin sản phẩm
            
            userToUpdate.setEmail(email);
            userToUpdate.setFirstName(firstName);
            userToUpdate.setLastName(lastName);
            userToUpdate.setPhone(phone);
            userToUpdate.setAddress(address);
            // Gọi hàm cập nhật sản phẩm trong UserEM
            userEM.updateUser(userToUpdate);
            
            // Chuyển hướng về trang danh sách sản phẩm sau khi cập nhật
            handleGetUsersByPage(request, response);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void handleGetUsersByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int pageNumber = 1;
	        int pageSize = 5;
	        if (request.getParameter("page") != null) {
	            pageNumber = Integer.parseInt(request.getParameter("page"));
	        }
	        
	        EntityManager entityManager = null;
	        
	        try {
	            entityManager = DBUtil.getEntityManager();
	            UserEM userEM = new UserEM(entityManager);

	            List<User> users = userEM.getUsersPaged(pageNumber, pageSize, 2);
	            Long totalUsers = userEM.getUsersCount();
	            int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

	            request.setAttribute("users", users);
	            request.setAttribute("pageNumber", pageNumber);
	            request.setAttribute("totalPages", totalPages);

	            RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-customer.jsp");
	            dispatcher.forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace(); // Xử lý hoặc ghi log lỗi tùy theo nhu cầu của bạn
	        } finally {
	            if (entityManager != null && entityManager.isOpen()) {
	                entityManager.close();
	            }
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
