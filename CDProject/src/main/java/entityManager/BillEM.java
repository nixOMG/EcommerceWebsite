package entityManager;

import entity.Bill;
import entity.BillDetail;
import entity.Product;
import entity.User;

import java.sql.Date;
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
            e.printStackTrace();
        }
        finally {
        	entityManager.close();
        }
    }
    
    public void updateBill(Bill billToUpdate, User user, Date billDate, int totalPrice, int shipFee, int status) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            
            // Update Bill
            billToUpdate.setUser(user);
            billToUpdate.setBillDate(billDate);
            billToUpdate.setTotalPrice(totalPrice);
            billToUpdate.setShipFee(shipFee);
            billToUpdate.setStatus(status);
            entityManager.refresh(billToUpdate);
            // Persist changes
            entityManager.persist(billToUpdate);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
        	entityManager.close();
        }
    }


    public void deleteBillAndDetails(int billId) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();

            // Find the Bill
            Bill bill = entityManager.find(Bill.class, billId);
            entityManager.refresh(bill);
            if (bill == null) {
                throw new IllegalArgumentException("No Bill with id " + billId);
            }

            // Delete BillDetails
            for (BillDetail billDetail : bill.getBillDetails()) {
                entityManager.remove(billDetail);
            }

            // Delete Bill
            entityManager.remove(bill);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        finally {
        	entityManager.close();
        }
    }

    public Bill getBillById(int billId) {
        // Sử dụng find để lấy sản phẩm theo ID
        return entityManager.find(Bill.class, billId);
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
    
    public List<Bill> getBillsPaged(int pageNumber, int pageSize) {
        TypedQuery<Bill> query = entityManager.createQuery(
                "SELECT b FROM Bill b", Bill.class)
                .setFirstResult((pageNumber - 1) * pageSize)
                .setMaxResults(pageSize);

        return query.getResultList();
    }
    public Long getBillsCount() {
        TypedQuery<Long> query = entityManager.createQuery(
                "SELECT COUNT(b) FROM Bill b", Long.class);

        return query.getSingleResult();
    }
}
