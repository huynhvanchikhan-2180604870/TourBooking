package com.hock.tour_booking.controllers;

import com.hock.tour_booking.dtos.CategoryDTO;
import com.hock.tour_booking.dtos.DestinationDTO;
import com.hock.tour_booking.dtos.TourDTO;
import com.hock.tour_booking.dtos.mapper.DestinationDtoMapper;
import com.hock.tour_booking.dtos.mapper.TourDtoMapper;
import com.hock.tour_booking.entities.Category;
import com.hock.tour_booking.entities.Destination;
import com.hock.tour_booking.entities.Tour;
import com.hock.tour_booking.services.CategoryService;
import com.hock.tour_booking.services.DestinationService;
import com.hock.tour_booking.services.TourService;
import com.hock.tour_booking.utils.FilterOption;
import com.hock.tour_booking.utils.GetFilterOption;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;

@RestController
@RequestMapping("/api/v1/tours")
public class TourController {
    @Autowired
    private TourService tourService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private DestinationService destinationService;
//    @GetMapping
//    public ResponseEntity<List<TourDTO>> getTour() {
//        List<Tour> tours = tourService.findAllTours();
//        List<TourDTO> tourDTOs = TourDtoMapper.tourDTOs(tours);
//        return new ResponseEntity<>(tourDTOs, HttpStatus.ACCEPTED);
//    }

    @GetMapping("/categories")
    public ResponseEntity<List<CategoryDTO>> getCategories(){
        List<CategoryDTO> categories = categoryService.findAllCategories();
        return new ResponseEntity<>(categories, HttpStatus.ACCEPTED);
    }

    @GetMapping()
    public ResponseEntity<Page<TourDTO>> getTours(
            @RequestParam(required = false) String destination,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate departureDate,
            @RequestParam(required = false) UUID category,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(defaultValue = "departureDate") String sortName,
            @RequestParam(defaultValue = "asc") String sortDirect) {

        Page<Tour> tours = tourService.findAllTours(destination, departureDate, category, page, size, sortName, sortDirect);
        Page<TourDTO> tourDTOs = TourDtoMapper.tourDTOs(tours);
        return ResponseEntity.ok(tourDTOs);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TourDTO> findById(@PathVariable UUID id) throws Exception{
        Tour tour  = tourService.findTourById(id);

        if(tour == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        TourDTO tourDTO = TourDtoMapper.toTourDTO(tour);
        System.out.println("Find tour by id: " + tourDTO);
        return new ResponseEntity<>(tourDTO, HttpStatus.OK);
    }

    @GetMapping("/destinations")
    public ResponseEntity<List<Destination>> getDestinations(){
        List<Destination> destinations = destinationService.findAll();
        List<DestinationDTO> destinationDTOS = DestinationDtoMapper.toDestinationDtos(destinations);
        return new ResponseEntity<>(destinations, HttpStatus.ACCEPTED);
    }
}
