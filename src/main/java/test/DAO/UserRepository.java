package test.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import test.Entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}