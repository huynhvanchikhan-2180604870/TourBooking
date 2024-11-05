package com.hock.tour_booking.controllers;

import com.hock.tour_booking.dtos.CategoryDTO;
import com.hock.tour_booking.dtos.TourDTO;
import com.hock.tour_booking.dtos.mapper.TourDtoMapper;
import com.hock.tour_booking.entities.Category;
import com.hock.tour_booking.entities.Role;
import com.hock.tour_booking.entities.Tour;
import com.hock.tour_booking.entities.User;
import com.hock.tour_booking.repositories.RoleCustomRepo;
import com.hock.tour_booking.repositories.RoleRepository;
import com.hock.tour_booking.services.CategoryService;
import com.hock.tour_booking.services.RoleService;
import com.hock.tour_booking.services.TourService;
import com.hock.tour_booking.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/v2/tours")
public class TourHostController {
    @Autowired
    private TourService tourService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleCustomRepo roleCustomRepo;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private CategoryService categoryService;

    @PostMapping("/create")
    public ResponseEntity<TourDTO>createTour(@RequestBody TourDTO tourDTO, @RequestHeader("Authorization") String jwt) throws Exception {
        User user = userService.findUserProfileByJwt(jwt);
        Category category = categoryService.findById(tourDTO.getCategory());
        List<String> roleNames = null;
        HashSet<Role> roles = new HashSet<>();
        roleNames = roleCustomRepo.getAllRoles(user);
        roleNames.forEach(roleName -> {
            Role role = roleRepository.findByName(roleName);
            roles.add(role);
        });
        if (user == null || !roles.stream().anyMatch(role -> "ROLE_HOST".equals(role.getName()))) {
            throw new Exception("Forbidden");
        }

        Tour tour = new Tour();
        tour.setId(UUID.randomUUID());
        tour.setTitle(tourDTO.getTitle());
        tour.setDescription(tourDTO.getDescription());
        tour.setPrice(tourDTO.getPrice());
        tour.setDestination(tourDTO.getDestination());
        tour.setDepartureDate(tourDTO.getDepartureDate());
        tour.setDurationDays(tourDTO.getDurationDays());
        tour.setItinerary(tourDTO.getItinerary());
        tour.setCategory(category);
        tour.setHost(user);
        tour.setStatus(tourDTO.getStatus());
        tour.setFeatured(tourDTO.isFeatured());
        tour.setImages(tourDTO.getImages());
        tour.setMaxPeople(tourDTO.getMaxPeople());
        tour.setStartingLocation(tourDTO.getStartingLocation());
        tour.setTransportation(tourDTO.getTransportation());
        Tour saveTour = tourService.createTour(tour);

        TourDTO savedTourDTO = TourDtoMapper.toTourDTO(saveTour);
        System.out.println("Create tour of host: " + user.getUsername() + "\n" +
                savedTourDTO.toString());
        return new ResponseEntity<>(savedTourDTO, HttpStatus.CREATED);
    }


    @PostMapping("/categories/create")
    public ResponseEntity<CategoryDTO>createTour(@RequestBody CategoryDTO categoryDTO, @RequestHeader("Authorization") String jwt) throws Exception {
        CategoryDTO saveCate = categoryService.createCategory(categoryDTO);
        return new ResponseEntity<>(saveCate, HttpStatus.CREATED);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<TourDTO> updateTour(@RequestHeader("Authorization") String jwt,@RequestBody TourDTO tourDTO, @PathVariable UUID id) throws Exception {
        User user = userService.findUserProfileByJwt(jwt);
        Category category = categoryService.findById(tourDTO.getCategory());
        List<String> roleNames = null;
        HashSet<Role> roles = new HashSet<>();
        roleNames = roleCustomRepo.getAllRoles(user);
        roleNames.forEach(roleName -> {
            Role role = roleRepository.findByName(roleName);
            roles.add(role);
        });
        if (user == null || !roles.stream().anyMatch(role -> "ROLE_HOST".equals(role.getName()))) {
            throw new Exception("Forbidden");
        }
        Tour tour = new Tour();
        tour.setTitle(tourDTO.getTitle());
        tour.setDescription(tourDTO.getDescription());
        tour.setPrice(tourDTO.getPrice());
        tour.setDestination(tourDTO.getDestination());
        tour.setDepartureDate(tourDTO.getDepartureDate());
        tour.setDurationDays(tourDTO.getDurationDays());
        tour.setItinerary(tourDTO.getItinerary());
        tour.setCategory(category);
        tour.setHost(user);
        tour.setStatus(tourDTO.getStatus());
        tour.setFeatured(tourDTO.isFeatured());
        tour.setMaxPeople(tourDTO.getMaxPeople());
        tour.setStartingLocation(tourDTO.getStartingLocation());
        tour.setTransportation(tourDTO.getTransportation());
        Tour saveTour = tourService.updateTour(id,tour);

        TourDTO savedTourDTO = TourDtoMapper.toTourDTO(saveTour);
        System.out.println("Update tour of host: " + user.getUsername() + "\n" +
                savedTourDTO.toString());
        return new ResponseEntity<>(savedTourDTO, HttpStatus.ACCEPTED);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deletedTour(@RequestHeader("Authorization") String jwt, @PathVariable UUID id) throws Exception{
        User user = userService.findUserProfileByJwt(jwt);

        List<String> roleNames = null;
        HashSet<Role> roles = new HashSet<>();
        roleNames = roleCustomRepo.getAllRoles(user);
        roleNames.forEach(roleName -> {
            Role role = roleRepository.findByName(roleName);
            roles.add(role);
        });
        if (user == null || !roles.stream().anyMatch(role -> "ROLE_HOST".equals(role.getName()))) {
            throw new Exception("Forbidden");
        }

        tourService.deleteTour(id);
        System.out.println("Deleted success");
        return new ResponseEntity<>("Deleted Successfuly", HttpStatus.ACCEPTED);
    }


    @GetMapping
    public ResponseEntity<Map<String, Object>> getTours(
            @RequestHeader("Authorization") String jwt,
            @RequestParam int draw,
            @RequestParam int start,
            @RequestParam int length,
            @RequestParam(required = false) String searchValue,
            @RequestParam int orderColumn,
            @RequestParam String orderDir,
            @RequestParam String sortName
    ) throws Exception {
        User user = userService.findUserProfileByJwt(jwt);

        List<String> roleNames = null;
        HashSet<Role> roles = new HashSet<>();
        roleNames = roleCustomRepo.getAllRoles(user);
        roleNames.forEach(roleName -> {
            Role role = roleRepository.findByName(roleName);
            roles.add(role);
        });
        if (user == null || !roles.stream().anyMatch(role -> "ROLE_HOST".equals(role.getName()))) {
            throw new Exception("Forbidden");
        }

        try {

            int page = start / length;

            // Validate sortName and sortDir
            List<String> allowedSortNames = Arrays.asList("title", "price", "departureDate");
            if (!allowedSortNames.contains(sortName)) {
                sortName = "title"; // Default sort field
            }

            if (!orderDir.equalsIgnoreCase("asc") && !orderDir.equalsIgnoreCase("desc")) {
                orderDir = "asc"; // Default sort direction
            }

            Page<Tour> tourPage = tourService.findAllToursByHost(
                    user.getId(), searchValue, page, length, sortName, orderDir);

            List<Tour> tours = tourPage.getContent();
            List<TourDTO> tourDTOs = TourDtoMapper.tourDTOs(tours);

            Map<String, Object> response = new HashMap<>();
            response.put("draw", draw);
            response.put("recordsTotal", tourPage.getTotalElements());
            response.put("recordsFiltered", tourPage.getTotalElements());
            response.put("data", tourDTOs);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception
            return ResponseEntity.badRequest().build();
        }
    }


}
