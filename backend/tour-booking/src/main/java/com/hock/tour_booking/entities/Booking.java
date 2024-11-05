package com.hock.tour_booking.entities;
import lombok.*;
import jakarta.persistence.*;
import java.util.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    @GeneratedValue
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "tour_id")
    private Tour tour;

    @Column(name = "num_people")
    private int numPeople;

    @Column(name = "booking_date")
    private LocalDateTime bookingDate;

    @Column(name = "total_price")
    private BigDecimal totalPrice;

    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private Promotion promotion;

    @Column(name = "discount_amount")
    private BigDecimal discountAmount;

    @Column(name = "final_price")
    private BigDecimal finalPrice;

    @Column(name = "payment_status")
    private String paymentStatus;

    @Column(name = "booking_status")
    private String bookingStatus;

    @Column(name = "payment_method")
    private String paymentMethod;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

}
