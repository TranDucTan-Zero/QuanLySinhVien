package test.DAO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import test.Entity.Students;

public interface StudentsDAO extends JpaRepository<Students, Integer>{
	@Query("SELECT o FROM Students o WHERE o.name LIKE ?1")
	Page<Students> findByKeywords(String keywords, Pageable pageable);
}
