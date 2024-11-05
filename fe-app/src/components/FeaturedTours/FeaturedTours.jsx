import React, { useEffect } from "react";
import { TourCard } from "../../shared/TourCard";
import '../../shared/tour-card.css'
import { Col } from "reactstrap";
import tourData from "../../assets/data/tours.js";
import { useDispatch, useSelector } from "react-redux";
import { getAllTours } from "../../store/Tour/Action.js";
export const FeaturedTours = () => {
  const { tour } = useSelector((state) => state);
  const dispatch = useDispatch();

  const handlePageChange = (pageNumber) => {
    dispatch(getAllTours({ page: pageNumber, size: 12 }));
  };
  return (
    <>
      {tour?.tours?.map((item) =>
        item.featured ? (
          <Col lg="3" className="mb-4" key={item.id}>
            <TourCard tour={item} />
          </Col>
        ) : null // Sử dụng null để không render gì khi không featured
      )}
    </>
  );
};
