package entityManager;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import entity.User;

public class UserEM {

    private final EntityManager entityManager;

    public UserEM(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public boolean addUser(User user) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(user);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(User user) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(user);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int userId) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            User user = entityManager.find(User.class, userId);
            if (user != null) {
                entityManager.remove(user);
                transaction.commit();
                return true;
            } else {
                transaction.rollback();
                return false;
            }
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public User getUserById(int userId) {
        return entityManager.find(User.class, userId);
    }

    // Thêm các phương thức khác tùy theo nhu cầu của bạn
    public User login(String email, String password) {
        try {
            Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.pass = :password");
            query.setParameter("email", email);
            query.setParameter("password", password);

            List<User> resultList = query.getResultList();

            if (resultList != null && !resultList.isEmpty()) {
                // Trả về người dùng nếu có kết quả
                return resultList.get(0);
            } else {
                // Không tìm thấy kết quả, đăng nhập không thành công
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Đăng nhập không thành công, trả về null
        }
    }
    
    public User getUserByEmail(String email) {
        try {
            Query query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email");
            query.setParameter("email", email);

            return (User) query.getSingleResult();
        } catch (NoResultException e) {
            // Không tìm thấy người dùng với email cung cấp
            return null;
        }
    }
    
    public List<User> getUsersByRoleId(int roleId) {
        try {
            TypedQuery<User> query = entityManager.createQuery(
                "SELECT u FROM User u WHERE u.role.roleId = :roleId",
                User.class
            );
            query.setParameter("roleId", roleId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi hoặc thông báo lỗi nếu cần
            return Collections.emptyList(); // hoặc trả về danh sách rỗng, hoặc null tùy vào yêu cầu của bạn
        }
    }
}
