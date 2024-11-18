package com.hock.tour_booking.services;

import com.hock.tour_booking.dtos.request.UserRequets;
import com.hock.tour_booking.entities.Role;
import com.hock.tour_booking.entities.User;

import java.util.UUID;

public interface UserService {
    public User findUserById(UUID id)throws Exception;
    public User findUserProfileByJwt(String jwt)throws Exception;
    public User updateUser(User user)throws Exception;
    public User addUser(User user)throws Exception;
    public void addRoleForUser(UUID id, String roleName)throws Exception;
    public void updateHostRole(UUID userId, UUID roleId) throws Exception;
}
