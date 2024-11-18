package com.hock.tour_booking.services;

import com.hock.tour_booking.dtos.BookingDTO;
import com.hock.tour_booking.entities.Booking;
import com.hock.tour_booking.exception.BookingException;

import java.util.List;
import java.util.UUID;

public interface BookingService {
    public Booking createBooking(Booking booking) throws Exception;
    public Booking findBookingById(UUID id) throws BookingException;
    public void cancelBooking(UUID id)throws BookingException;
    public Booking updateBooking(BookingDTO booking)throws BookingException;
    public List<Booking> findAllBookings();
    public List<Booking> findAllBookingsByUserId(UUID userId);
}
