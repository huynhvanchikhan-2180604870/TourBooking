import { Grid } from "@mui/material";
import React from "react";
import { Route, Routes } from "react-router-dom";
import "./DashboardHost.css";
import Navigation from "./Navigation/Navigation";
import Dashboard from "./Pages/Dashboard";
import TourHost from "./Pages/TourHost";

const styleNav = {
  borderRadius: "20px",
  outline: "none",
  fontSize: "20px",

  padding: "15px 20px",
  height: "100%",
};

const DashboardHost = () => {
  return (
    <Grid container className="px-5 lg:px-36 justify-between md:block mt-5 ">
      <Grid
        item
        xs={12}
        lg={2}
        className=" lg:block relative md:block navbars"
        style={styleNav}
      >
        <Navigation />
        {/* <p className="text-center">left part</p> */}
      </Grid>

      <Grid
        item
        xs={12}
        lg={9.5}
        className="px-5 lg:px-9 lg:block relative md:hidden ms-auto"
        style={styleNav}
      >
        <Routes>
          <Route path="/" element={<Dashboard />}></Route>
          <Route path="/tours" element={<TourHost />}></Route>
          {/* <Route path="/tours/:id" element={<TwitDetails />}></Route> */}
        </Routes>
        {/* <p className="text-center">left part</p> */}
      </Grid>
    </Grid>
  );
};

export default DashboardHost;
