import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { Col, Container, Row } from "reactstrap";
import Booking from "../components/Booking/Booking";
import Carousel from "../shared/Carousel";
import { Newsletter } from "../shared/Newsletter";
import { findTourById, getAllTours } from "../store/Tour/Action";
import "../styles/tour-details.css";
import calculateAvgRating from "../utils/avgRating";

const TourDetails = () => {
  const { id } = useParams();
  const { tour } = useSelector((state) => state);
  const dispatch = useDispatch();

  const handlePageChange = (pageNumber) => {
    dispatch(getAllTours({ page: pageNumber, size: 10 }));
  };

  // const reviewMsgRef = useParams();
  const [tourRating, setTourRating] = useState(null);

  useEffect(() => {
    dispatch(findTourById(id));
  }, [id]);

  const { totalRating, avgRating } = calculateAvgRating(
    tour?.tourDetails?.reviews
  );

  // const options = {day: 'numeric', month: 'long', year: 'numeric'}

  // const submitHandler = e => {
  //   e.preventDefault()
  //   const reviewText = reviewMsgRef.current?.value

  // }

  return (
    <>
      <section>
        <Container>
          <Row>
            <Col lg="8">
              <div className="tour__content">
                <div className="tour__image">
                  <Carousel data={tour?.tourDetails} />
                </div>
                <div className="tour__info">
                  <span className="info__host">
                    {tour?.tourDetails?.host?.username}
                  </span>
                  {tour?.tourDetails?.featured && (
                    <span className="isFeature">Featured</span>
                  )}
                  <h2 className="ms-1">{tour?.tourDetails?.title}</h2>
                  <div className="d-flex align-items-center gap-5">
                    <span className="tour__rating d-flex align-items-center gap-1">
                      <i
                        className="ri-star-fill"
                        style={{ color: "var(--secondary-color)" }}
                      ></i>
                      {avgRating === 0 ? null : avgRating}{" "}
                      {totalRating === 0 ? (
                        "Not rated"
                      ) : (
                        <span>({tour?.tourDetails?.reviews?.length})</span>
                      )}
                    </span>
                  </div>

                  <div className="tour__extra-details">
                    <span>
                      <i className="ri-map-pin-2-line"></i>{" "}
                      {tour?.tourDetails?.destination}
                    </span>

                    <span>
                      <i className="ri-money-dollar-circle-line"></i> $
                      {tour?.tourDetails?.price}
                      /per person
                    </span>

                    <span>
                      <i className="ri-map-pin-time-line"></i> $
                      {tour?.tourDetails?.durationDays} days
                    </span>

                    <span>
                      <i className="ri-group-line"></i>{" "}
                      {tour?.tourDetails?.maxPeople} people
                    </span>

                    <span>
                      <i className="ri-group-line"></i>{" "}
                      {tour?.tourDetails?.ticketsRemaining} slot
                    </span>
                  </div>

                  <h5>
                    <strong>Description</strong>{" "}
                  </h5>
                  <div>
                    {tour?.tourDetails?.description?.split("\n").map((line, index) => (
                        <p key={index}>
                          {line}
                          <br />
                        </p>
                      ))}
                  </div>

                  <h5 className="mt-5 text-decoration">
                    <strong>Itinerary</strong> (
                    {tour?.tourDetails?.itinerary?.length})
                  </h5>
                  {tour?.tourDetails?.itinerary?.map((text, index) => (
                    <p key={index}>{text}</p>
                  ))}
                </div>
                {/* ==========tour reviews section============ */}
                <div className="tour__reviews mt-2">
                  <h4>Reviews({tour?.tourDetails?.reviews?.length} reviews)</h4>
                  {/* <Form onSubmit={submitHandler}>
                    <div className="d-flex align-items-center gap-3 mb-4 rating__group">
                      <span onClick={() => setTourRating(1)}>
                        1 <i className="ri-star-s-fill"></i>
                      </span>

                      <span onClick={() => setTourRating(2)}>
                        2 <i className="ri-star-s-fill"></i>
                      </span>

                      <span onClick={() => setTourRating(3)}>
                        3 <i className="ri-star-s-fill"></i>
                      </span>

                      <span onClick={() => setTourRating(4)}>
                        4 <i className="ri-star-s-fill"></i>
                      </span>

                      <span onClick={() => setTourRating(5)}>
                        5 <i className="ri-star-s-fill"></i>
                      </span>
                    </div>

                    <div className="review__input">
                      <input
                        type="text"
                        ref={reviewMsgRef}
                        required
                        placeholder="Share your thoughts"
                      />
                      <button
                        className="btn primary__btn text-while"
                        type="submit"
                      >
                        Submit
                      </button>
                    </div>
                  </Form> */}

                  {/* <ListGroup className="user__reviews">
                    {tour?.tourDetails?.reviews?.map((review) => (
                      <div className="review__item">
                        <img src={avatar} alt="" />
                        <div className="w-100">
                          <div className="d-flex align-items-center justify-content-between">
                            <div>
                              <h5>muhib</h5>
                              <p>
                                {new Date("01-18-2023").toLocaleDateString(
                                  "en-US",
                                  options
                                )}
                              </p>
                            </div>
                            <span className="d-flex align-items-center">
                              5<i className="ri-star-s-fill"></i>
                            </span>
                          </div>
                          <h6>Amazing tour</h6>
                        </div>
                      </div>
                    ))}
                  </ListGroup> */}
                </div>
                {/* ==========tour reviews section end============ */}
              </div>
            </Col>

            <Col lg="4">
              <Booking tour={tour?.tourDetails} avgRating={avgRating} />
            </Col>
          </Row>
        </Container>
      </section>
      <Newsletter />
    </>
  );
};

export default TourDetails;
