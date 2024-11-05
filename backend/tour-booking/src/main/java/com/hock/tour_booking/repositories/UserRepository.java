package com.hock.tour_booking.repositories;

import com.hock.tour_booking.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {
    public User findByEmail(String email);
    @Query("SELECT u FROM User u JOIN FETCH u.roles WHERE u.email = :email")
    User  findByEmailWithRoles(@Param("email") String email);
}