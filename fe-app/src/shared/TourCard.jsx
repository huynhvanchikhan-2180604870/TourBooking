import React from "react";
import { Link } from "react-router-dom";
import { Card, CardBody } from "reactstrap";
import { truncateString } from "../utils/truncateString";
import "./tour-card.css";
export const TourCard = ({ tour }) => {
  const totalRating = tour?.reviews?.reduce(
    (acc, item) => acc + item.rating,
    0
  );
  const avgRating =
    totalRating === 0
      ? ""
      : totalRating === 1
      ? totalRating
      : totalRating / tour?.reviews?.length;
  // Using the truncateString function to limit title length
  const displayTitle = truncateString(tour?.title || "", 40);
  const displayLocation = truncateString(tour?.destination || "", 26);
  return (
    <div className="tour__card">
      <Card>
        <div className="tour__img">
          <img src={tour?.images[0]} alt="tour-img" />
          {tour?.featured && <span>Featured</span>}
        </div>
        <CardBody>
          <div className="card__top d-flex-align-items-center justify-content-between">
            <span className="tour__location d-flex align-items-center gap-1">
              <i className="ri-map-pin-line"></i>
              {displayLocation}
            </span>

            <span className="tour__rating d-flex align-items-center gap-1">
              <i className="ri-star-fill"></i>
              {avgRating === 0 ? null : avgRating}{" "}
              {totalRating === 0 ? (
                "Not rated"
              ) : (
                <span>({tour?.reviews?.length})</span>
              )}
            </span>
          </div>

          <h5 className="tour__title">
            <Link to={`/tours/${tour?.id}`}>{displayTitle}</Link>
          </h5>

          <div className="card__bottom d-flex align-items-center justify-content-between mt-3">
            <h5>
              ${tour?.price}
              <span> /person</span>
            </h5>
            <button className="btn booking__btn">
              <Link to={`/tours/${tour?.id}`}>Book Now</Link>
            </button>
          </div>
        </CardBody>
      </Card>
    </div>
  );
};
