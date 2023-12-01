package entity;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyServletContextListener implements ServletContextListener {

    private static EntityManagerFactory emf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Khởi tạo EntityManagerFactory khi ứng dụng được triển khai
        emf = Persistence.createEntityManagerFactory("CDProjectPU");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Đóng EntityManagerFactory khi ứng dụng bị hủy
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    public static EntityManagerFactory getEmFactory() {
        return emf;
    }
}

