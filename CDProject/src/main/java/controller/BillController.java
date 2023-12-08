package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
import entityManager.UserEM;
import entity.Bill;
import entity.User;

/**
 * Servlet implementation class BillController
 */
@WebServlet("/manage-bill")
@MultipartConfig
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

		if(action != null && action.equals("my-bill")) {
			getBillsByUserId(request, response);
		}
		else {
			if(action != null && action.equals("get-page-edit-bill")) {
				handleGetPageEditBill(request, response);
			}
			else if(action != null && action.equals("get-page-delete-bill")) {
				handleGetPageDeleteBill(request, response);
			}
			else {
				handleGetBillsByPage(request, response);
			}			
		}
	}
	
	private void handleGetPageDeleteBill(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			 int billId = Integer.parseInt(request.getParameter("billId"));
			 
			 EntityManager entityManager = DBUtil.getEntityManager();
			 
			 BillEM billEM = new BillEM(entityManager);
			 Bill bill = billEM.getBillById(billId);			 
             request.setAttribute("bill", bill);
            entityManager.close();
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/delete-bill.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void handleGetPageEditBill(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			 int billId = Integer.parseInt(request.getParameter("billId"));
			 
			 EntityManager entityManager = DBUtil.getEntityManager();
			 
			 BillEM billEM = new BillEM(entityManager);
			 Bill bill = billEM.getBillById(billId);
			 
			 /*UserEM userEM=new UserEM(entityManager);
			 List<User> users=userEM.getAllUsers();
			 request.setAttribute("user", users);*/
             request.setAttribute("bill", bill);             
             entityManager.close();
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/edit-bill.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		System.out.println("check action: " + action);
		if(action != null && action.equals("edit-bill")) {
			handleEditBill(request, response);
		}
		else if (action != null && action.equals("delete-bill")){
			handleDeleteBill(request, response);
		}
		else {
			handleGetBillsByPage(request, response);
		}
	}
	
	private void handleDeleteBill(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    try {
	    	
	        int billId = Integer.parseInt(request.getParameter("billId"));
	        System.out.println("check billId: " + billId);
	        // Gọi hàm để lấy sản phẩm từ CSDL dựa trên userId
	        EntityManager entityManager = DBUtil.getEntityManager();
	        
	        BillEM billEM = new BillEM(entityManager);
	        
	        // Gọi hàm xóa sản phẩm trong usertEM
	        billEM.deleteBillAndDetails(billId);
	        
	        // Chuyển hướng về trang danh sách sản phẩm sau khi xóa
	        handleGetBillsByPage(request, response);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	private void handleEditBill(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int billId = Integer.parseInt(request.getParameter("billId"));			
			System.out.println("check billId: " + billId);
			Date billDate = Date.valueOf(request.getParameter("billDate"));		
			int userId = Integer.parseInt(request.getParameter("userId"));
			System.out.println("check userId: " + userId);
			int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
			int shipFee= Integer.parseInt(request.getParameter("shipFee"));
			int status= Integer.parseInt(request.getParameter("status"));
            
            // Gọi hàm để lấy sản phẩm từ CSDL dựa trên userId
	        EntityManager entityManager = DBUtil.getEntityManager();
	        
	        BillEM billEM= new BillEM(entityManager);
	        Bill billToUpdate=billEM.getBillById(billId);
	        
            UserEM userEM = new UserEM(entityManager);
            User user = userEM.getUserById(userId);

            billToUpdate.setUser(user);
            billToUpdate.setBillDate(billDate);
            billToUpdate.setTotalPrice(totalPrice);
            billToUpdate.setShipFee(shipFee);
            billToUpdate.setStatus(status);
            // Gọi hàm cập nhật sản phẩm trong UserEM
            billEM.updateBill(billToUpdate);
            
            // Chuyển hướng về trang danh sách sản phẩm sau khi cập nhật
            handleGetBillsByPage(request, response);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void handleGetBillsByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
	            BillEM billEM = new BillEM(entityManager);

	            List<Bill> bills = billEM.getBillsPaged(pageNumber, pageSize);
	            Long totalBills = billEM.getBillsCount();
	            int totalPages = (int) Math.ceil((double) totalBills / pageSize);

	            request.setAttribute("bills", bills);
	            request.setAttribute("pageNumber", pageNumber);
	            request.setAttribute("totalPages", totalPages);

	            RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-bill.jsp");
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
