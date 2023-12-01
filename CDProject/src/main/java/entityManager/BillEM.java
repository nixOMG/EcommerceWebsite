package entityManager;

import entity.Bill;
import entity.BillDetail;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

public class BillEM {

    private EntityManager entityManager;

    public BillEM(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void saveBillAndDetails(Bill bill, Iterable<BillDetail> billDetails) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            // Lưu Bill
            entityManager.persist(bill);

            // Lưu BillDetails
            for (BillDetail billDetail : billDetails) {
                entityManager.persist(billDetail);
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace(); // Xử lý lỗi hoặc log lỗi tùy theo nhu cầu của bạn
        }
    }
    
 // Phương thức để lấy toàn bộ danh sách hóa đơn từ cơ sở dữ liệu
    public List<Bill> getAllBills() {
        // Tạo một truy vấn TypedQuery để lấy danh sách tất cả các hóa đơn
        TypedQuery<Bill> query = entityManager.createQuery("SELECT b FROM Bill b", Bill.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
 // Phương thức để lấy danh sách hóa đơn theo userId
    public List<Bill> getBillsByUserId(int userId) {
        TypedQuery<Bill> query = entityManager.createQuery("SELECT b FROM Bill b WHERE b.user.userId = :userId", Bill.class);
        query.setParameter("userId", userId);

        return query.getResultList();
    }
}
