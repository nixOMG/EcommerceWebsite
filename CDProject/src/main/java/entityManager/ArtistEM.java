package entityManager;

import entity.Artist;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ArtistEM {

    private EntityManager entityManager;

    public ArtistEM(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<Artist> getAllArtists() {
        // Tạo một truy vấn TypedQuery để lấy danh sách tất cả các nghệ sĩ
        TypedQuery<Artist> query = entityManager.createQuery("SELECT a FROM Artist a", Artist.class);

        // Thực hiện truy vấn và trả về danh sách kết quả
        return query.getResultList();
    }
    
    public Artist getArtistById(int artistId) {
        // Sử dụng find để lấy nghệ sĩ theo ID
        return entityManager.find(Artist.class, artistId);
    }
}
