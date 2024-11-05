package com.hock.tour_booking.controllers;

import com.hock.tour_booking.dtos.UserDTO;
import com.hock.tour_booking.dtos.mapper.UserDtoMapper;
import com.hock.tour_booking.entities.User;
import com.hock.tour_booking.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v2/users")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public ResponseEntity<UserDTO> getUserProfile(@RequestHeader("Authorization") String jwt) throws Exception {
        User user = userService.findUserProfileByJwt(jwt);
        UserDTO userDto = UserDtoMapper.toUserDto(user);
        return new ResponseEntity<>(userDto, HttpStatus.ACCEPTED);
    }
}
