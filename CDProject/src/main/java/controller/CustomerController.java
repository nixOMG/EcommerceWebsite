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

import entity.User;
import entityManager.DBUtil;
import entityManager.UserEM;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/manage-customer")
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
		else {
			handleGetPageManageCustomer(request, response);
		}
	}

	private void handleGetPageManageCustomer(HttpServletRequest request, HttpServletResponse response) {
		try {
			EntityManager entityManager = DBUtil.getEntityManager();
			// Gọi đến UserEM để lấy danh sách người dùng với roleId=2
	        UserEM userEM = new UserEM(entityManager);
	        List<User> customers = userEM.getUsersByRoleId(2);
	        // Đóng EntityManager và EntityManagerFactory sau khi sử dụng xong
	        entityManager.close();
	        
	        // Chuyển danh sách người dùng đến trang manage-customer.jsp
	        request.setAttribute("customers", customers);
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
		
	}

}
