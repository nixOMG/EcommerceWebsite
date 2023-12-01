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

import entity.Role;
import entity.User;
import entityManager.DBUtil;
import entityManager.UserEM;

/**
 * Servlet implementation class WebController
 */
@WebServlet("/home")
public class WebController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public WebController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        System.out.println("check action: " + action);
		if(action != null && action.equals("dang-nhap")) {
	        response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		else if (action != null && action.equals("dang-ky")) {
			response.sendRedirect(request.getContextPath() + "/register.jsp");
		}
		else if (action != null && action.equals("dang-xuat")) {
			HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate(); // Xóa hết thông tin trong session
	        }
	        response.sendRedirect(request.getContextPath() + "/home.jsp");
		}
		else if (action != null && action.equals("profile")) {
			response.sendRedirect(request.getContextPath() + "/profile.jsp");
		}
		else if (action != null && action.equals("about")) {
			response.sendRedirect(request.getContextPath() + "/about.jsp");
		}
		else if (action != null && action.equals("contact")) {
			response.sendRedirect(request.getContextPath() + "/contact.jsp");
		}
		else {
			String url = "";
			url = "/home.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
        System.out.println("check action: " + action);
		if(action != null && action.equals("handle-login")) {
	        handleLogin(request, response);
		}
		if(action != null && action.equals("handle-register")) {
			handleRegister(request, response);
		}
	}

	private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    try {
	        if (email != null && password != null) {
	            EntityManager entityManager = DBUtil.getEntityManager();
	            UserEM userEM = new UserEM(entityManager);
	            User loggedInUser = userEM.login(email, password);

	            if (loggedInUser != null) {
	                // Đăng nhập thành công, loggedInUser là thông tin của người dùng đã đăng nhập
	                System.out.println("Đăng nhập thành công! User: " + loggedInUser.getFirstName() + " " + loggedInUser.getLastName());

	                // Lưu thông tin người dùng vào request để truy cập trong JSP
	                HttpSession session = request.getSession();
	                session.setAttribute("loggedInUser", loggedInUser);
	                
	                // Kiểm tra roleId và chuyển hướng đến trang tương ứng
	                int roleId = loggedInUser.getRole().getRoleId();

	                if (roleId == 1) {
	                    // Nếu roleId là 1, chuyển hướng đến trang admin.jsp
	                    response.sendRedirect("admin.jsp");
	                } else if (roleId == 2) {
	                    // Nếu roleId là 2, chuyển hướng đến trang home.jsp
	                	RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		                dispatcher.forward(request, response);
	                } else {
	                    // Nếu roleId không phải 1 hoặc 2, xử lý theo logic của bạn
	                    // Ví dụ: chuyển hướng đến một trang lỗi, hoặc thực hiện một xử lý khác
	                    response.sendRedirect("error.jsp");
	                }
	            } else {
	                // Đăng nhập không thành công
	                System.out.println("Đăng nhập không thành công. Kiểm tra lại email và mật khẩu.");

	                // Lưu thông báo lỗi vào request để truy cập trong JSP
	                request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng");

	                // Chuyển hướng đến trang đăng nhập lại hoặc trang lỗi
	                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	                dispatcher.forward(request, response);
	            }

	            // Kiểm tra trạng thái của EntityManagerFactory trước khi đóng EntityManager
	            if (entityManager.getEntityManagerFactory().isOpen()) {
	                entityManager.close();
	            }
	        }
	    } catch (IOException e) {
	        e.printStackTrace(); // Hoặc xử lý theo nhu cầu của bạn
	    }
	}
		
	private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        
        System.out.println("check utf-8 from jsp: " + firstName + " " + lastName);

        // Kiểm tra các trường thông tin đăng ký, bạn có thể thêm kiểm tra khác tùy ý
        if (email != null && firstName != null && lastName != null && phone != null && password != null && address != null) {
            EntityManager entityManager = DBUtil.getEntityManager();
            UserEM userEM = new UserEM(entityManager);

            // Kiểm tra xem email đã tồn tại chưa
            if (userEM.getUserByEmail(email) == null) {
                // Tạo một đối tượng User mới
                User newUser = new User();
                newUser.setEmail(email);
                newUser.setFirstName(firstName);
                newUser.setLastName(lastName);
                newUser.setPhone(phone);
                newUser.setPass(password);
                newUser.setAddress(address);
                
                // Đặt roleId mặc định là 2 (khách hàng)
                Role defaultRole = new Role();
                defaultRole.setRoleId(2);
                newUser.setRole(defaultRole);

                // Gọi phương thức để thêm người dùng mới vào database
                boolean registrationSuccess = userEM.addUser(newUser);

                if (registrationSuccess) {
                    // Đăng ký thành công, có thể chuyển hướng hoặc thực hiện các hành động khác
                    response.sendRedirect("login.jsp");
                } else {
                    // Đăng ký thất bại
                    request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // Email đã tồn tại, hiển thị thông báo lỗi
                request.setAttribute("errorMessage", "Email đã tồn tại. Vui lòng chọn email khác.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            }

            // Kiểm tra trạng thái của EntityManagerFactory trước khi đóng EntityManager
            if (entityManager.getEntityManagerFactory().isOpen()) {
                entityManager.close();
            }
        }
    }

	
	
	
	
	
	
}