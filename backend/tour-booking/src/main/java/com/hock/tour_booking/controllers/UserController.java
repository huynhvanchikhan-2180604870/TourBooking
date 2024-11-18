package com.hock.tour_booking.controllers;

import com.hock.tour_booking.dtos.UserDTO;
import com.hock.tour_booking.dtos.mapper.UserDtoMapper;
import com.hock.tour_booking.entities.User;
import com.hock.tour_booking.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/update")
    public ResponseEntity<UserDTO> updateUser(@RequestHeader("Authorization") String jwt, @RequestBody UserDTO userDto) throws Exception {
        User user = userService.findUserProfileByJwt(jwt);
        user.setUsername(userDto.getUsername());
        user.setAddress(userDto.getAddress());
        user.setCin(userDto.getCin());
        user.setPhone_number(userDto.getPhone());
        User saveUser = userService.updateUser(user);
        UserDTO userResponseDto = UserDtoMapper.toUserDto(saveUser);
        return new ResponseEntity<>(userResponseDto, HttpStatus.ACCEPTED);
    }
}
