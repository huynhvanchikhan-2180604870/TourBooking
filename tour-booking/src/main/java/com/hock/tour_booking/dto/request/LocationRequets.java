package com.hock.tour_booking.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LocationRequets {
    private UUID id;
    private String name;
    private String description;
    private String latitude;
    private String longitude;
}