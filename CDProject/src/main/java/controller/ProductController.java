package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entity.Artist;
import entity.Category;
import entity.Genre;
import entity.Product;
import entityManager.ArtistEM;
import entityManager.CategoryEM;
import entityManager.DBUtil;
import entityManager.GenreEM;
import entityManager.ProductEM;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/manage-product")
@MultipartConfig
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if(action != null && action.equals("get-page-add-product")) {
			handleGetPageAddProduct(request, response);
		}
		else if(action != null && action.equals("get-page-edit-product")) {
			handleGetPageEditProduct(request, response);
		}
		else if (action != null && action.equals("get-page-delete-product")) {
			handleGetPageDeleteProduct(request, response);
		}
		else {
			handleGetProductsByPage(request, response);
		}
	}
	
	private void handleGetPageDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			 int productId = Integer.parseInt(request.getParameter("productId"));
			 
			 EntityManager entityManager = DBUtil.getEntityManager();
			 
			 ProductEM productEM = new ProductEM(entityManager);
			 Product product = productEM.getProductById(productId);
			 
			// Đặt thông tin sản phẩm vào request để chuyển đến trang delete-product.jsp
             request.setAttribute("product", product);

            // Lấy toàn bộ dữ liệu về Category, Genre và Artist
            CategoryEM categoryEM = new CategoryEM(entityManager);
            List<Category> categories = categoryEM.getAllCategories();

            GenreEM genreEM = new GenreEM(entityManager);
            List<Genre> genres = genreEM.getAllGenres();

            ArtistEM artistEM = new ArtistEM(entityManager);
            List<Artist> artists = artistEM.getAllArtists();
            
         // Đặt danh sách category, genre, artist vào request
            request.setAttribute("categories", categories);
            request.setAttribute("genres", genres);
            request.setAttribute("artists", artists);

            // Đóng EntityManager
            entityManager.close();
            
         // Chuyển hướng đến trang edit-product.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/delete-product.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void handleGetPageEditProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			 int productId = Integer.parseInt(request.getParameter("productId"));
			 
			 EntityManager entityManager = DBUtil.getEntityManager();
			 
			 ProductEM productEM = new ProductEM(entityManager);
			 Product product = productEM.getProductById(productId);
			 
			// Đặt thông tin sản phẩm vào request để chuyển đến trang edit-product.jsp
             request.setAttribute("product", product);

            // Lấy toàn bộ dữ liệu về Category, Genre và Artist
            CategoryEM categoryEM = new CategoryEM(entityManager);
            List<Category> categories = categoryEM.getAllCategories();

            GenreEM genreEM = new GenreEM(entityManager);
            List<Genre> genres = genreEM.getAllGenres();

            ArtistEM artistEM = new ArtistEM(entityManager);
            List<Artist> artists = artistEM.getAllArtists();
            
         // Đặt danh sách category, genre, artist vào request
            request.setAttribute("categories", categories);
            request.setAttribute("genres", genres);
            request.setAttribute("artists", artists);

            // Đóng EntityManager
            entityManager.close();
            
         // Chuyển hướng đến trang edit-product.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/edit-product.jsp");
            dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private void handleGetProductsByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
	            ProductEM productEM = new ProductEM(entityManager);

	            List<Product> products = productEM.getProductsPaged(pageNumber, pageSize);
	            Long totalProducts = productEM.getProductsCount();
	            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

	            request.setAttribute("products", products);
	            request.setAttribute("pageNumber", pageNumber);
	            request.setAttribute("totalPages", totalPages);

	            RequestDispatcher dispatcher = request.getRequestDispatcher("/manage-product.jsp");
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

	private void handleGetPageAddProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			EntityManager entityManager = DBUtil.getEntityManager();

            // Lấy toàn bộ dữ liệu về Category, Genre và Artist
            CategoryEM categoryEM = new CategoryEM(entityManager);
            List<Category> categories = categoryEM.getAllCategories();

            GenreEM genreEM = new GenreEM(entityManager);
            List<Genre> genres = genreEM.getAllGenres();

            ArtistEM artistEM = new ArtistEM(entityManager);
            List<Artist> artists = artistEM.getAllArtists();

            // Đóng EntityManager
            entityManager.close();
            
            // Đẩy dữ liệu xuống trang JSP
            request.setAttribute("categories", categories);
            request.setAttribute("genres", genres);
            request.setAttribute("artists", artists);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/add-product.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý exception nếu cần thiết
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if(action != null && action.equals("add-product")) {
			handleAddProduct(request, response);
		}
		else if(action != null && action.equals("edit-product")) {
			handleEditProduct(request, response);
		}
		else if (action != null && action.equals("delete-product")){
			handleDeleteProduct(request, response);
		}
		else {
			handleGetProductsByPage(request, response);
		}
	}
	
	private void handleDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    try {
	        int productId = Integer.parseInt(request.getParameter("productId"));
	        
	        // Gọi hàm để lấy sản phẩm từ CSDL dựa trên productId
	        EntityManager entityManager = DBUtil.getEntityManager();
	        
	        ProductEM productEM = new ProductEM(entityManager);
	        Product productToDelete = productEM.getProductById(productId);
	        
	        // Gọi hàm xóa sản phẩm trong ProductEM
	        productEM.deleteProduct(productToDelete);
	        
	        // Chuyển hướng về trang danh sách sản phẩm sau khi xóa
	        handleGetProductsByPage(request, response);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	private void handleEditProduct(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int productId = Integer.parseInt(request.getParameter("productId"));
			// Xử lý các trường thông tin sản phẩm
	        String name = request.getParameter("name");
	        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	        int genreId = Integer.parseInt(request.getParameter("genreId"));
	        int artistId = Integer.parseInt(request.getParameter("artistId"));
	        Date releaseDate = Date.valueOf(request.getParameter("releaseDate"));
	        String describe = request.getParameter("describe");
	        int weight = Integer.parseInt(request.getParameter("weight"));
	        int price = Integer.parseInt(request.getParameter("price"));
	        int star = Integer.parseInt(request.getParameter("star"));
	        int comment  = Integer.parseInt(request.getParameter("comment"));

	        // Lấy ảnh mới từ request
            Part newImagePart = request.getPart("newImage");
            InputStream newImageInputStream = newImagePart.getInputStream();
            
            // Gọi hàm để lấy sản phẩm từ CSDL dựa trên productId
	        EntityManager entityManager = DBUtil.getEntityManager();
	        
            ProductEM productEM = new ProductEM(entityManager);
            Product productToUpdate = productEM.getProductById(productId);
            
            CategoryEM categoryEM = new CategoryEM(entityManager);
            Category category = categoryEM.getCategoryById(categoryId);
            
            GenreEM genreEM = new GenreEM(entityManager);
            Genre genre = genreEM.getGenreById(genreId);
            
            ArtistEM artistEM = new ArtistEM(entityManager);
            Artist artist = artistEM.getArtistById(artistId);
            
            // Cập nhật thông tin sản phẩm
            
            productToUpdate.setName(name);
            productToUpdate.setWeight(weight);
            productToUpdate.setDescribe(describe);
            productToUpdate.setCategory(category);
            productToUpdate.setArtist(artist);
            productToUpdate.setGenre(genre);
            productToUpdate.setPrice(price);
            productToUpdate.setReleaseDate(releaseDate);
            productToUpdate.setStar(star);
            productToUpdate.setComment(comment);
            
            // Kiểm tra nếu có ảnh mới được chọn
            if (newImageInputStream.available() > 0) {
                // Xóa ảnh cũ trước khi cập nhật ảnh mới
                deleteOldImage(productToUpdate.getImage());

                // Lưu ảnh mới vào thư mục và lấy tên file
                String newImageFileName = saveImageToDirectory(newImageInputStream);

                // Cập nhật tên ảnh trong sản phẩm
                productToUpdate.setImage(newImageFileName);
            }
            
            // Gọi hàm cập nhật sản phẩm trong ProductEM
            productEM.updateProduct(productToUpdate);
            
            // Chuyển hướng về trang danh sách sản phẩm sau khi cập nhật
            handleGetProductsByPage(request, response);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	// Hàm xóa ảnh cũ
    private void deleteOldImage(String oldImageFileName) {
        // Thư mục lưu trữ ảnh
        String uploadDirectoryPath = getServletContext().getRealPath("/assets/img");

        // Đường dẫn đầy đủ của ảnh cũ
        String oldImagePath = Paths.get(uploadDirectoryPath, oldImageFileName).toString();

        // Xóa ảnh cũ
        File oldImageFile = new File(oldImagePath);
        if (oldImageFile.exists()) {
            oldImageFile.delete();
        }
    }
	
	// Hàm lưu ảnh vào thư mục và trả về tên file
    private String saveImageToDirectory(InputStream imageInputStream) throws IOException {
    	
        // Thư mục lưu trữ ảnh
        String uploadDirectoryPath = getServletContext().getRealPath("/assets/img");

        // Tạo tên file ngẫu nhiên để tránh trùng lặp
        String fileName = UUID.randomUUID().toString() + ".jpg";

        // Đường dẫn đầy đủ của file mới
        String filePath = Paths.get(uploadDirectoryPath, fileName).toString();

        // Ghi dữ liệu từ InputStream vào file
        Files.copy(imageInputStream, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

        // Trả về tên file
        return fileName;
    }

	private void handleAddProduct(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			// Xử lý các trường thông tin sản phẩm
	        String name = request.getParameter("name");
	        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	        int genreId = Integer.parseInt(request.getParameter("genreId"));
	        int artistId = Integer.parseInt(request.getParameter("artistId"));
	        Date releaseDate = Date.valueOf(request.getParameter("releaseDate"));
	        String describe = request.getParameter("describe");
	        int weight = Integer.parseInt(request.getParameter("weight"));
	        int price = Integer.parseInt(request.getParameter("price"));
	        int star = Integer.parseInt(request.getParameter("star"));
	        int comment  = Integer.parseInt(request.getParameter("comment"));
	        
	        // Tạo đối tượng Product và set các trường thông tin
	        Product product = new Product();
	        product.setName(name);

	        // Lấy EntityManager từ context
	        EntityManager entityManager = DBUtil.getEntityManager();

	        try {
	            // Lấy các đối tượng Category, Genre, Artist từ cơ sở dữ liệu
	            Category category = entityManager.find(Category.class, categoryId);
	            Genre genre = entityManager.find(Genre.class, genreId);
	            Artist artist = entityManager.find(Artist.class, artistId);

	            // Set các trường liên quan đến Category, Genre, Artist
	            product.setCategory(category);
	            product.setGenre(genre);
	            product.setArtist(artist);
	            
	            // Set các trường thông tin khác
	            product.setReleaseDate(releaseDate);
	            product.setDescribe(describe);
	            product.setWeight(weight);
	            product.setPrice(price);
	            product.setStar(star);
	            product.setComment(comment);

	            // Xử lý tải ảnh lên
	            Part imagePart = request.getPart("image");
	            String imageName = getSubmittedFileName(imagePart);

	            // Lưu ảnh vào thư mục
	            String uploadPath = getServletContext().getRealPath("/assets/img/");
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdir();
	            }
	            String filePath = uploadPath + File.separator + imageName;
	            imagePart.write(filePath);

	            // Lưu tên ảnh vào trường image của sản phẩm
	            product.setImage(imageName);

	            // Lưu sản phẩm vào cơ sở dữ liệu
	            entityManager.getTransaction().begin();
	            entityManager.persist(product);
	            entityManager.getTransaction().commit();

	            // Chuyển hướng hoặc hiển thị thông báo thành công
	            handleGetProductsByPage(request, response);
	        } catch (Exception e) {
	            if (entityManager.getTransaction().isActive()) {
	                entityManager.getTransaction().rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            entityManager.close();
	        }
	    
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1)
	                    .substring(fileName.lastIndexOf('\\') + 1);
	        }
	    }
	    return null;
	}

}
