import React from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import DashboardHost from "../components/Dashboard/Host/DashboardHost";
import Profile from "../pages/Profile";
import ThankYou from "../pages/ThankYou";
import Home from "./../pages/Home";
import Login from "./../pages/Login";
import Register from "./../pages/Register";
import SeachResult from "./../pages/SearchResult";
import TourDetails from "./../pages/TourDetails";
import Tours from "./../pages/Tours";
import TourHost from "../components/Dashboard/Host/Pages/TourHost";
import  OrderHistory  from "../pages/OrderHistory";

const Routers = () => {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Navigate to="/home" />} />
        <Route path="/home" element={<Home />} />
        <Route path="/tours" element={<Tours />} />
        <Route path="/tours/:id" element={<TourDetails />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/thank-you" element={<ThankYou />} />
        <Route path="/tours/search" element={<SeachResult />} />
        <Route path="/orders" element={<OrderHistory />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/dashboard" element={<DashboardHost />} />
        <Route path="/dashboard/tours" element={<TourHost />} />
        <Route path="/dashboard/support" element={<DashboardHost />} />
      </Routes>
    </div>
  );
};

export default Routers;
