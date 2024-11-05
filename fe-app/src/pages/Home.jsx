import React from "react";
import { useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { Col, Container, Row } from "reactstrap";
import experienceImg from "../assets/images/experience.png";
import heroImg from "../assets/images/hero-img01.jpg";
import heroImg02 from "../assets/images/hero-img02.jpg";
import heroVideo from "../assets/images/hero-video.mp4";
import worldImg from "../assets/images/world.png";
import { FeaturedTours } from "../components/FeaturedTours/FeaturedTours";
import { MasonryImagesGallery } from "../components/ImageGallery/MasonryImagesGallery";
import { Testimonial } from "../components/Testimonial/Testimonial";
import { Services } from "../services/Services";
import { Newsletter } from "../shared/Newsletter";
import { SearchBar } from "../shared/SearchBar";
import Subtitle from "../shared/Subtitle";
import "../styles/home.css";
import tours from "../assets/data/tours";
import { getAllTours } from "../store/Tour/Action";
const Home = () => {
  let navigate = useNavigate();
  const dispatch = useDispatch();
  const handleSearch = (searchParams) => {
    dispatch(
      getAllTours({
        page: 0,
        size: 10,
        destination: searchParams.destination,
        departureDate: searchParams.departureDate,
        category: searchParams.category,
      })
    );
    navigate()
  };
  return (
    <>
      {/* ========hero section start======= */}
      <section>
        <Container>
          <Row>
            <Col lg="6">
              <div className="hero__content">
                <div className="hero__subtitle d-flex align-items-center">
                  <Subtitle subtitle={"Know Before You Go"} />
                  <img src={worldImg} alt="" />
                </div>
                <h1>
                  Traveling opens the door to creating{" "}
                  <span className="highlight">memories</span>
                </h1>
                <p>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Dolor, velit voluptatum aliquam suscipit ipsam magni vero non
                  voluptates, commodi tempore ad cupiditate voluptatibus,
                  adipisci cum? Deserunt minima veniam libero mollitia.
                </p>
              </div>
            </Col>

            <Col lg="2">
              <div className="hero__img-box">
                <img src={heroImg} alt="" />
              </div>
            </Col>

            <Col lg="2">
              <div className="hero__img-box mt-4">
                <video src={heroVideo} alt="" muted autoPlay loop />
              </div>
            </Col>

            <Col lg="2">
              <div className="hero__img-box mt-5">
                <img src={heroImg02} alt="" />
              </div>
            </Col>

            <SearchBar onSearch={handleSearch} />
          </Row>
        </Container>
      </section>
      {/* ========hero section end======= */}

      <section>
        <Container>
          <Row>
            <Col lg="3">
              <h5 className="service__subtitle">What we serve</h5>
              <h2 className="service__title">We offer our best services</h2>
            </Col>
            <Services />
          </Row>
        </Container>
      </section>

      {/* =============feature tour section start=============== */}
      <section>
        <Container>
          <Row>
            <Col lg="12" className="mb-5">
              <Subtitle subtitle={"Explore"} />
              <h2 className="feature__tour-title">Our featured tours</h2>
            </Col>
            <FeaturedTours />
          </Row>
        </Container>
      </section>
      {/* =============feature tour section end=============== */}

      {/* ===============experience section start=============== */}
      <section>
        <Container>
          <Row>
            <Col lg="6">
              <div className="experience__content">
                <Subtitle subtitle={"Experience"} />
                <h2>
                  With our all experience <br /> we will serve you
                </h2>
                <p>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  <br /> Laboriosam temporibus vitae ullam dignissimos voluptate
                  error voluptatem incidunt, necessitatibus fugiat, excepturi
                  repudiandae deserunt maxime enim perspiciatis unde labore
                  nesciunt facilis consequuntur.
                </p>
              </div>
              <div className="counter__wrapper d-flex align-items-center gap-5">
                <div className="counter__box">
                  <span>12k+</span>
                  <h6>Successfull Trip</h6>
                </div>

                <div className="counter__box">
                  <span>2k+</span>
                  <h6>Successfull Trip</h6>
                </div>
                <div className="counter__box">
                  <span>15</span>
                  <h6>Years experience</h6>
                </div>
              </div>
            </Col>
            <Col lg="6">
              <div className="experience__img">
                <img src={experienceImg} alt="" />
              </div>
            </Col>
          </Row>
        </Container>
      </section>
      {/* ===============experience section end=============== */}

      {/* ================gallery section start================ */}
      <section>
        <Container>
          <Row>
            <Col lg="12">
              <Subtitle subtitle={"Gallery"} />
              <h2 className="gallery__title">
                Visit our customers tour gallery
              </h2>
            </Col>

            <Col lg="12">
              <MasonryImagesGallery />
            </Col>
          </Row>
        </Container>
      </section>
      {/* ================gallery section end================ */}
      {/* ================testimonial section start================ */}
      <section>
        <Container>
          <Row>
            <Col lg="12">
              <Subtitle subtitle={"Fans Love"} />
              <h2 className="testimonial__title">What our fans say about us</h2>
            </Col>

            <Col lg="12">
              <Testimonial />
            </Col>
          </Row>
        </Container>
      </section>
      {/* ================testimonial section end================ */}
      <Newsletter />
    </>
  );
};

export default Home;
