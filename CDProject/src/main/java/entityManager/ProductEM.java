package entityManager;

import entity.Product;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class ProductEM {

    private EntityManager entityManager;

    public ProductEM(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Product> getAllProducts() {
        // Tạo một truy vấn TypedQuery để lấy danh sách tất cả các sản phẩm
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p", Product.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
    // Hàm để lấy một sản phẩm dựa trên ID
    public Product getProductById(int productId) {
        // Sử dụng find để lấy sản phẩm theo ID
        return entityManager.find(Product.class, productId);
    }
    
    // hàm sắp xếp sản phẩm theo tên
    public List<Product> getProductsSortedByName() {
        // Tạo một truy vấn TypedQuery để lấy danh sách sản phẩm và sắp xếp theo tên
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p ORDER BY p.name ASC", Product.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
 // hàm sắp xếp sản phẩm theo giá từ thấp đến cao
    public List<Product> getProductsSortedByPriceAsc() {
        // Tạo một truy vấn TypedQuery để lấy danh sách sản phẩm và sắp xếp theo giá từ thấp đến cao
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p ORDER BY p.price ASC", Product.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
 // hàm lấy danh sách sản phẩm theo category_id
    public List<Product> getProductsByCategoryId(int categoryId) {
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p WHERE p.category.categoryId = :categoryId", Product.class);
        query.setParameter("categoryId", categoryId);

        return query.getResultList();
    }

    // hàm lấy danh sách sản phẩm theo artist_id
    public List<Product> getProductsByArtistId(int artistId) {
        TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p WHERE p.artist.artistId = :artistId", Product.class);
        query.setParameter("artistId", artistId);

        return query.getResultList();
    }
    
    // hàm tìm kiếm sản phẩm theo tên
    public List<Product> searchProductsByName(String productName) {
        TypedQuery<Product> query = entityManager.createQuery(
                "SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(:productName)",
                Product.class
        );
        query.setParameter("productName", "%" + productName + "%");

        return query.getResultList();
    }
    
 // Phương thức lấy danh sách sản phẩm với phân trang
    public List<Product> getProductsPaged(int pageNumber, int pageSize) {
        TypedQuery<Product> query = entityManager.createQuery(
                "SELECT p FROM Product p", Product.class)
                .setFirstResult((pageNumber - 1) * pageSize)
                .setMaxResults(pageSize);

        return query.getResultList();
    }

    // Phương thức lấy tổng số lượng sản phẩm
    public Long getProductsCount() {
        TypedQuery<Long> query = entityManager.createQuery(
                "SELECT COUNT(p) FROM Product p", Long.class);

        return query.getSingleResult();
    }
    
    // cập nhật sản phẩm
    public void updateProduct(Product product) {
        entityManager.getTransaction().begin();
        entityManager.merge(product);
        entityManager.getTransaction().commit();
    }
    
    public void deleteProduct(Product product) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.remove(product);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            System.out.println(e);
        }
        finally {
        	entityManager.close();
        }
    }

}
