package com.hock.tour_booking.services;

import com.hock.tour_booking.dtos.BookingDTO;
import com.hock.tour_booking.entities.Booking;
import com.hock.tour_booking.exception.BookingException;
import com.hock.tour_booking.repositories.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.token.TokenService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
public class BookingServiceImplementation implements BookingService {
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private TourService tourService;


    @Override
    public Booking createBooking(Booking booking) throws Exception{
        Booking newBooking = new Booking();
        newBooking.setId(UUID.randomUUID());
        newBooking.setUser(booking.getUser());
        newBooking.setTour(booking.getTour());
        newBooking.setNumPeople(booking.getNumPeople());
        newBooking.setBookingDate(LocalDateTime.now());
        newBooking.setTotalPrice(booking.getTotalPrice());
        newBooking.setPromotion(null);
        newBooking.setDiscountAmount(booking.getDiscountAmount());
        newBooking.setFinalPrice(booking.getFinalPrice());
        newBooking.setPaymentStatus(booking.getPaymentStatus());
        newBooking.setBookingStatus(booking.getBookingStatus());
        newBooking.setPaymentMethod(booking.getPaymentMethod());
        newBooking.setCreatedAt(LocalDateTime.now());
        newBooking.setUpdatedAt(booking.getUpdatedAt());
        newBooking.setQrBase64(null);
        Booking savedBooking = bookingRepository.save(newBooking);
        return savedBooking;
    }

    @Override
    public Booking findBookingById(UUID id) throws BookingException {
        return bookingRepository.findBookingById(id);
    }

    @Override
    public void cancelBooking(UUID id) throws BookingException {
        Booking booking = findBookingById(id);
        if(booking == null) throw new BookingException("Booking not found");
        bookingRepository.delete(booking);

    }

    @Override
    public Booking updateBooking(BookingDTO booking) throws BookingException {
        Booking currentBooking = findBookingById(booking.getId());
        if(currentBooking == null) throw new BookingException("Booking not found");

        if(currentBooking.getNumPeople() != booking.getNumPeople()) {
            currentBooking.setNumPeople(booking.getNumPeople());
        }

        if(currentBooking.getBookingStatus() != booking.getBookingStatus()) {
            currentBooking.setBookingStatus(booking.getBookingStatus());
        }

        if(currentBooking.getFinalPrice() != booking.getFinalPrice()) {
            currentBooking.setFinalPrice(booking.getFinalPrice());
        }

        if(currentBooking.getPaymentStatus() != booking.getPaymentStatus()) {
            currentBooking.setPaymentStatus(booking.getPaymentStatus());
        }

        if(currentBooking.getBookingStatus() != booking.getBookingStatus()) {
            currentBooking.setBookingStatus(booking.getBookingStatus());
        }

        if(currentBooking.getDiscountAmount() != booking.getDiscountAmount()) {
            currentBooking.setDiscountAmount(booking.getDiscountAmount());
        }

        if (currentBooking.getTotalPrice() != booking.getTotalPrice()) {
            currentBooking.setTotalPrice(booking.getTotalPrice());
        }

        if(currentBooking.getQrBase64() != booking.getQrBase64()) {
            currentBooking.setQrBase64(booking.getQrBase64());
        }

        currentBooking.setUpdatedAt(LocalDateTime.now());
        bookingRepository.save(currentBooking);
        return currentBooking;
    }

    @Override
    public List<Booking> findAllBookings() {
        return bookingRepository.findAll();
    }

    @Override
    public List<Booking> findAllBookingsByUserId(UUID userId) {
        return bookingRepository.findAllByUserId(userId);
    }
}
