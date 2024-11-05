import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import { Menu, MenuItem } from "@mui/material";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, NavLink, useNavigate } from "react-router-dom";
import { Button, Container, Row } from "reactstrap";
import "../../App.css";
import logo from "../../assets/images/logo.png";
import { logout } from "../../store/Auth/Action";
import "./header.css";
import { South } from "@mui/icons-material";

const Header = () => {
  const nav_links = [
    { path: "/home", display: "Home" },
    { path: "/about", display: "About" },
    { path: "/tours", display: "Tours" },
  ];

  const { auth } = useSelector((store) => store);
  const [anchorEl, setAnchorEl] = useState(null);
  const dispatch = useDispatch();
  const open = Boolean(anchorEl);
  const navigate = useNavigate();

  const [roleName, setRoleName] = useState("");
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };
  const headerRef = useRef(null);
  const handleClose = () => {
    setAnchorEl(null);
  };
  const handleLogout = () => {
    console.log("logout");
    handleClose();
    dispatch(logout());
  };

  const handleDashboard = () => {
    console.log("Has ROLE_HOST: ", roleName);

    if (roleName === "ROLE_HOST") {
      navigate("/dashboard");
    } else {
      navigate("/home");
    }
  };

  useEffect(() => {
    const hasHostRole = auth?.user?.roles?.some(
      (role) => role.name === "ROLE_HOST"
    );

    if (hasHostRole) {
      
      setRoleName("ROLE_HOST");
    } else {
      setRoleName("ROLE_USER");
    }
  }, [roleName]);

  useEffect(() => {
    const handleScroll = () => {
      if (
        document.body.scrollTop > 80 ||
        document.documentElement.scrollTop > 80
      ) {
        headerRef.current?.classList.add("sticky__header");
      } else {
        headerRef.current?.classList.remove("sticky__header");
      }
    };

    // Attach the scroll event listener
    window.addEventListener("scroll", handleScroll);

    // Clean up function
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []); // Empty dependency array to ensure this runs once on mount

  return (
    <React.Fragment>
      <header className="header" ref={headerRef}>
        <Container>
          <Row>
            <div className="nav_wrapper d-flex align-items-center justify-content-between">
              <div className="logo">
                <a href="/home">
                  <img src={logo} alt="logo" />
                </a>
              </div>
              <div className="navigation">
                <ul className="menu d-flex align-items-center gap-5">
                  {nav_links.map((item, index) => (
                    <li className="nav__item" key={index}>
                      <NavLink
                        to={item.path}
                        className={({ isActive }) =>
                          isActive ? "active__link" : ""
                        }
                      >
                        {item.display}
                      </NavLink>
                    </li>
                  ))}
                </ul>
              </div>
              <div className="nav__right d-flex align-items-center gap-4">
                {auth?.user ? (
                  <div className="nav__btns d-flex align-items-center gap-4">
                    <Button
                      className="btn secondary__btn border-1"
                      id="basic-button"
                      aria-controls={open ? "basic-menu" : undefined}
                      aria-haspopup="true"
                      aria-expanded={open ? "true" : undefined}
                      onClick={handleClick}
                    >
                      {auth?.user?.username}
                      <ExpandMoreIcon />
                    </Button>
                    <Menu
                      id="basic-menu"
                      anchorEl={anchorEl}
                      open={open}
                      onClose={handleClose}
                      MenuListProps={{
                        "aria-labelledby": "basic-button",
                      }}
                      sx={{ width: "190px" }}
                    >
                      {roleName === "ROLE_USER"
                        ? [
                            <MenuItem key="profile" onClick={handleLogout}>
                              Profile
                            </MenuItem>,
                            <MenuItem key="history" onClick={handleLogout}>
                              History
                            </MenuItem>,
                            <MenuItem key="favorite" onClick={handleLogout}>
                              Favorite
                            </MenuItem>,
                          ]
                        : [
                            <MenuItem key="profile" onClick={handleLogout}>
                              Profile
                            </MenuItem>,
                            <MenuItem key="history" onClick={handleLogout}>
                              History
                            </MenuItem>,
                            <MenuItem key="favorite" onClick={handleLogout}>
                              Favorite
                            </MenuItem>,
                            <MenuItem key="dashboard" onClick={handleDashboard}>
                              Dashboard
                            </MenuItem>,
                          ]}
                    </Menu>

                    <Button
                      onClick={handleLogout}
                      className="btn primary__btn mb-2"
                      style={{ width: "100px" }}
                    >
                      Logout
                    </Button>
                  </div>
                ) : (
                  <div className="nav__btns d-flex align-items-center gap-4">
                    <Button className="btn secondary__btn">
                      <Link to="/login">Login</Link>
                    </Button>
                    <Button className="btn primary__btn">
                      <Link to="/register">Register</Link>
                    </Button>
                  </div>
                )}
              </div>
              <span className="mobile__menu">
                <i className="ri-menu-line"></i>
              </span>
            </div>
          </Row>
        </Container>
      </header>
    </React.Fragment>
  );
};

export default Header;
