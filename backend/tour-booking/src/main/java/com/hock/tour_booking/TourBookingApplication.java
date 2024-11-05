package com.hock.tour_booking;


import com.hock.tour_booking.dtos.request.UserRequets;
import com.hock.tour_booking.entities.Role;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.HashSet;
import java.util.UUID;

@SpringBootApplication
@EnableScheduling
@EnableJpaRepositories
public class TourBookingApplication {

	public static void main(String[] args) {
		SpringApplication.run(TourBookingApplication.class, args);
	}
//	@Bean
//	CommandLineRunner runner(UserService userSerivce, RoleService roleService) {
//		return args -> {
//			roleService.saveRole(new Role(UUID.randomUUID(), "ROLE_USER"));
//			roleService.saveRole(new Role(UUID.randomUUID(), "ROLE_MANAGER"));
//			roleService.saveRole(new Role(UUID.randomUUID(), "ROLE_ADMIN"));
//			roleService.saveRole(new Role(UUID.randomUUID(), "ROLE_SUPER_ADMIN"));
//
//
//
////			userSerivce.saveUser(
////					new UserRequets(
////							"HOCK",
////							"admin@gmail.com",
////							"admin",
////							"09718000341",
////							"HCM",
////							new HashSet<>()
////					)
////			);
//
////			userSerivce.saveUser(
////					new UserRequets(
////							"HOCK",
////							"admin@gmail.com",
////							"admin",
////							"09718000341",
////							"HCM",
////							new HashSet<>()
////					)
////			);
//
////			userSerivce.addRoleToUserDefault("admin@gmail.com");
//
//		};
//	}
}
