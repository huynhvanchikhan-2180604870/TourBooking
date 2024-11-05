package com.hock.tour_booking.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tours")
public class Tour {
    @Id
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "host_id")
    private User host;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @ElementCollection
    @CollectionTable(name = "tour_itinerary", joinColumns = @JoinColumn(name = "tour_id"))
    @OrderColumn(name = "day_order")
    @Column(name = "itinerary_step", columnDefinition = "TEXT")
    private List<String> itinerary = new ArrayList<>();


    @Column(nullable = false)
    private BigDecimal price;

    @Column(name = "duration_days")
    private int durationDays;

    @Column(name = "departure_date")
    private LocalDate departureDate;

    private String destination;

    @ElementCollection
    @CollectionTable(name = "tour_images", joinColumns = @JoinColumn(name = "tour_id"))
    @Column(name = "image_url")
    private Set<String> images = new HashSet<>();

    private String status;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(name = "featured")
    private boolean featured;

    @OneToMany(mappedBy = "tour", fetch = FetchType.LAZY)
    private Set<Review> reviews = new HashSet<>();

    @Column(name = "max_peole")
    private int maxPeople;

    @Column(name = "starting_location")
    private String startingLocation;

    @Column(name = "transportation")
    private String transportation;

    @Column(name = "tickets_remaining")
    private int ticketsRemaining;

}
