package com.hock.tour_booking.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hock.tour_booking.dtos.request.UserRequets;
import com.hock.tour_booking.services.UserService;

@RestController
@RequestMapping("/api/v2/admin")
public class AdminActionController {
 
    @Autowired
    private UserService userService;

    
}
