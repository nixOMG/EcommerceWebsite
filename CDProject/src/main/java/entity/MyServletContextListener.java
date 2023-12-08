package entity;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.postgresql.Driver;

@WebListener
public class MyServletContextListener implements ServletContextListener {

    private static EntityManagerFactory emf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            // Khởi tạo EntityManagerFactory khi ứng dụng được triển khai
            emf = Persistence.createEntityManagerFactory("CDProjectPU");
        } catch (Exception e) {
            // Log the exception to a reliable output
            System.err.println("Exception during context initialization:");
            e.printStackTrace();
            // You can also use a logger here to log the exception
        }
    }


    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        Enumeration<java.sql.Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            java.sql.Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
                System.out.println(String.format("Deregistering jdbc driver: %s", driver));
            } catch (SQLException e) {
                System.out.println(String.format("Error deregistering driver %s", driver));
            }
        }
    }

    public static EntityManagerFactory getEmFactory() {
        return emf;
    }
}

