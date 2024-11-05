package com.hock.tour_booking.dtos;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
public class ReviewDTO {
    private UUID id;
    private UserDTO user;
    private TourDTO tour;
    private int rating;
    private String comment;
    private LocalDateTime createdAt;
}
