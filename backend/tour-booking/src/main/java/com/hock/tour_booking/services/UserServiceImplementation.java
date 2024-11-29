package com.hock.tour_booking.services;

import com.hock.tour_booking.config.JwtProvider;
import com.hock.tour_booking.dtos.request.UserRequets;
import com.hock.tour_booking.entities.Role;
import com.hock.tour_booking.entities.User;
import com.hock.tour_booking.repositories.RoleCustomRepo;
import com.hock.tour_booking.repositories.RoleRepository;
import com.hock.tour_booking.repositories.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImplementation implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private JwtProvider jwtProvider;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private RoleCustomRepo roleCustomRepo;

    @Override
    public User findUserById(UUID id) throws Exception{
        User user = userRepository.findById(id).orElseThrow(() ->  new Exception("user not found with id" + id));
        return user;
    }

    @Override
    public User findUserProfileByJwt(String jwt) throws Exception{
        String email = jwtProvider.getEmailFromToken(jwt);
        User user = userRepository.findByEmailWithRoles(email);
        List<String> roleNames = null;
        HashSet<Role> roles = new HashSet<>();

        if(user == null){
            throw new Exception("user not found with email" + email);
        }

        roleNames = roleCustomRepo.getAllRoles(user);
        roleNames.forEach(roleName -> {
            Role role = roleRepository.findByName(roleName);
            roles.add(role);
        });
        user.setRoles(roles);
        return user;
    }

    @Override
    public User updateUser(User req) throws Exception{
        User user = findUserById(req.getId());
        if(req.getUsername() != null){
            user.setUsername(req.getUsername());
        }

        if(req.getEmail() != null){
            user.setEmail(req.getEmail());
        }

        if (req.getPhone_number() != null){
            user.setPhone_number(req.getPhone_number());
        }
        if (req.getAddress() != null){
            user.setAddress(req.getAddress());
        }

        if(req.getCin() != null){
            user.setCin(req.getCin());
        }
        user.setIs_active(user.getIs_active());

        return userRepository.save(user);
    }

    @Override
    public User addUser(User req) throws Exception{
        Role role = roleRepository.findByName("ROLE_USER");
        if (role == null) {
            throw new Exception("Role not found");
        }

        User user = new User();
        user.setEmail(req.getEmail());
        user.setId(UUID.randomUUID());
        user.setAddress(req.getAddress());
        user.setUsername(req.getUsername());
        user.setPassword_hash(passwordEncoder.encode(req.getPassword_hash()));
        user.setPhone_number(req.getPhone_number());
        user.setIs_active(req.getIs_active());
        user.setLast_login(req.getLast_login());
        user.getRoles().add(role);
        user.setVerify_code(req.getVerify_code());
        user.setCin(req.getCin());
        // Lưu người dùng
        User saveUser  = userRepository.save(user);
        System.out.println("User new: " + saveUser.toString());
        System.out.println("Roles before saving: " + saveUser.getRoles());
        return saveUser ; // Trả về người dùng đã lưu
    }

    @Override
    public void addRoleForUser(UUID id, String roleName) throws Exception{
        User user = findUserById(id);
        Role role = roleRepository.findByName(roleName);
        if(role == null){
            throw new Exception("role not found with name" + roleName);
        }
        user.getRoles().add(role);
    }
    @Transactional
    @Override
    public  void updateHostRole(UUID userId, UUID roleId) throws Exception {
        User user = findUserById(userId);
        if (user == null) {
            throw new Exception("User not found with id " + userId);
        }

        Role role = roleRepository.findById(roleId)
                .orElseThrow(() -> new Exception("Role not found with id " + roleId));

        user.getRoles().add(role);
        role.getUsers().add(user);
        userRepository.save(user);
    }


    public void changeUserPassword(UUID id, String oldPassword, String newPassword) throws Exception {
        User user = userRepository.findById(id).orElseThrow(() -> new Exception("user not found with id " + id));

        // Check if the old password is correct
        if (!passwordEncoder.matches(oldPassword, user.getPassword_hash())) {
            throw new Exception("Invalid old password");
        }

        // Set new password and encode it
        user.setPassword_hash(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    @Override
    public User registerHost(User user) throws Exception{
        User newUser = new User();
        Role role = roleRepository.findByName("ROLE_HOST");
        if (role == null) {
            throw new Exception("Role not found");
        }

        newUser.setEmail(user.getEmail());
        newUser.setId(UUID.randomUUID());
        newUser.setAddress(user.getAddress());
        newUser.setUsername(user.getUsername());
        newUser.setPassword_hash(passwordEncoder.encode(user.getPassword_hash()));
        newUser.setPhone_number(user.getPhone_number());
        newUser.setIs_active(user.getIs_active());
        newUser.setLast_login(user.getLast_login());
        newUser.getRoles().add(role);
        // newUser.setVerify_code(user.getVerify_code());
        newUser.setCin(user.getCin());
        User saveUser = userRepository.save(newUser);
        return saveUser;
    }
}
