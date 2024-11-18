package com.hock.tour_booking.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;
import java.util.UUID;

@Data
@NoArgsConstructor
@Entity
@Table(name = "destinations")
public class Destination {
    @Id
    @GeneratedValue
    private UUID id;

    @Column(nullable = false)
    private String name;

    @OneToMany(mappedBy = "destination")
    private Set<Tour> tours; // Each destination has many tours
    // Constructors, getters, and setters as needed
    @Transient  // Use @Transient if you don't want to store it in the database
    private int tourCount;  // To store the count of tours dynamically
}
