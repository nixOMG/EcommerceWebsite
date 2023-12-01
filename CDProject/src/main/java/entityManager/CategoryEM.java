package entityManager;

import entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryEM {

    private EntityManager entityManager;

    public CategoryEM(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Category> getAllCategories() {
        // Tạo một truy vấn TypedQuery để lấy danh sách tất cả các danh mục
        TypedQuery<Category> query = entityManager.createQuery("SELECT c FROM Category c", Category.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
    public Category getCategoryById(int categoryId) {
        // Sử dụng find để lấy danh mục theo ID
        return entityManager.find(Category.class, categoryId);
    }
}

