package com.hock.tour_booking.repositories;

import com.hock.tour_booking.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface BookingRepository extends JpaRepository<Booking, UUID> {
    @Query("select b from Booking b where b.id =?1")
    public Booking findBookingById(UUID bookingId);

    @Query("select b from Booking b where b.user.id =?1")
    public List<Booking> findAllByUserId(UUID userId);
}
