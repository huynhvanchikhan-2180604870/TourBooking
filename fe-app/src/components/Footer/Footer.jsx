import React from "react";
import './footer.css'
import { Container, Row, Col, ListGroup, ListGroupItem } from "reactstrap";
import { Link } from "react-router-dom";
import logo from '../../assets/images/logo.png'

const quick_links = [
  {
    path: "/home",
    display: "Home",
  },

  {
    path: "/about",
    display: "About",
  },

  {
    path: "/tours",
    display: "Tours",
  },
];


const quick_links2 = [
  {
    path: "/gallery",
    display: "Gallery",
  },

  {
    path: "/login",
    display: "Login",
  },

  {
    path: "/register",
    display: "Register",
  },
];


const Footer = () => {
  const years =new Date().getFullYear()
  return (
    <footer className="footer">
      <Container>
        <Row>
          <Col lg="3">
            <div className="logo">
              <img src={logo} alt="" />
              <p>
                Lorem ipsum dolor sit, amet consectetur adipisicing elit. Culpa
                inventore consequuntur a iure quam debitis temporibus in aliquid
                quo omnis aperiam nobis, fugiat aliquam! Eveniet eos est aperiam
                nam quam.
              </p>
            </div>

            <div className="social__links d-flex align-items-center gap-4">
              <span>
                <Link to="#">
                  <i className="ri-youtube-line"></i>
                </Link>
              </span>

              <span>
                <Link to="#">
                  <i className="ri-github-fill"></i>
                </Link>
              </span>

              <span>
                <Link to="#">
                  <i className="ri-facebook-circle-line"></i>
                </Link>
              </span>

              <span>
                <Link to="#">
                  <i className="ri-instagram-line"></i>
                </Link>
              </span>
            </div>
          </Col>

          <Col lg="3">
            <h5 className="footer__link-title">Discover</h5>
            <ListGroup className="footer__quick-links">
              {quick_links.map((item, index) => (
                <ListGroupItem key={index} className="ps-0 border-0">
                  <Link to={item.path}>{item.display}</Link>
                </ListGroupItem>
              ))}
            </ListGroup>
          </Col>
          <Col lg="3">
            <h5 className="footer__link-title">Quick Links</h5>
            <ListGroup className="footer__quick-links">
              {quick_links2.map((item, index) => (
                <ListGroupItem key={index} className="ps-0 border-0">
                  <Link to={item.path}>{item.display}</Link>
                </ListGroupItem>
              ))}
            </ListGroup>
          </Col>
          <Col lg="3">
            <h5 className="footer__link-title">Contact</h5>
            <ListGroup className="footer__quick-links">
              <ListGroupItem className="ps-0 border-0 d-flex align-items-center gap-3">
                <h6 className="mb-0 d-flex align-items-center gap-2">
                  <span>
                    <i className="ri-map-pin-line"></i>
                  </span>
                  Address:
                </h6>

                <p className="mb-0">HO CHI MINH CITY</p>
              </ListGroupItem>

              <ListGroupItem className="ps-0 border-0 d-flex align-items-center gap-3">
                <h6 className="mb-0 d-flex align-items-center gap-2">
                  <span>
                    <i className="ri-mail-line"></i>
                  </span>
                  Email:
                </h6>

                <p className="mb-0">huynhkhan91@gmail.com</p>
              </ListGroupItem>

              <ListGroupItem className="ps-0 border-0 d-flex align-items-center gap-3">
                <h6 className="mb-0 d-flex align-items-center gap-2">
                  <span>
                    <i className="ri-phone-fill"></i>
                  </span>
                  Phone:
                </h6>

                <p className="mb-0">+84 961800341</p>
              </ListGroupItem>
            </ListGroup>
          </Col>

          <Col lg='12' className="text-center pt-5">
            <div className="copyright">Copyright {years}, design and develop by Huynh Van Chi Khan. All rights reserved.</div>
          </Col>
        </Row>
      </Container>
    </footer>
  );
};

export default Footer;
