package entityManager;

import entity.Genre;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class GenreEM {

    private EntityManager entityManager;

    public GenreEM(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Genre> getAllGenres() {
        // Tạo một truy vấn TypedQuery để lấy danh sách tất cả các thể loại
        TypedQuery<Genre> query = entityManager.createQuery("SELECT g FROM Genre g", Genre.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
    public Genre getGenreById(int genreId) {
        // Sử dụng find để lấy thể loại theo ID
        return entityManager.find(Genre.class, genreId);
    }
}
