package controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Cart;

import java.util.HashMap;
import java.util.List;

import entityManager.BillEM;
import entityManager.DBUtil;

import entity.Bill;
import entity.User;

/**
 * Servlet implementation class BillController
 */
@WebServlet("/manage-bill")
public class BillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		EntityManager entityManager = null;

		if(action != null && action.equals("my-bill")) {
			getBillsByUserId(request, response);
		}
		else {
			// lấy danh sách hóa đơn
			
			
			try {
	            entityManager = DBUtil.getEntityManager();
	            BillEM billEM = new BillEM(entityManager);

	            // Lấy danh sách hóa đơn từ cơ sở dữ liệu
	            List<Bill> billList = billEM.getAllBills();

	            // Đặt danh sách hóa đơn vào thuộc tính của request để hiển thị trên trang jsp
	            request.setAttribute("billList", billList);

	            // Chuyển hướng đến trang quản lý hóa đơn
	            String url = "/manage-bill.jsp";
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
	}

	private void getBillsByUserId(HttpServletRequest request, HttpServletResponse response) {
		try {
			EntityManager entityManager = null;
			entityManager = DBUtil.getEntityManager();
	        BillEM billEM = new BillEM(entityManager);
			
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("loggedInUser");
	        
	     // Lấy danh sách hóa đơn từ cơ sở dữ liệu
            List<Bill> billList = billEM.getBillsByUserId(user.getUserId());
            System.out.println("check bill list: " + billList.size());
            
            request.setAttribute("billList", billList);
            
         // Chuyển hướng đến trang quản lý hóa đơn
            String url = "/my-bill.jsp";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
            
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
