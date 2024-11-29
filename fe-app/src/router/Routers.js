import React from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import DashboardHost from "../components/Dashboard/Host/DashboardHost";
import OrderTracking from "../components/Dashboard/Host/Pages/OrderTracking";
import Revenue from "../components/Dashboard/Host/Pages/Revenue";
import TourHost from "../components/Dashboard/Host/Pages/TourHost";
import OrderHistory from "../pages/OrderHistory";
import Profile from "../pages/Profile";
import ThankYou from "../pages/ThankYou";
import Home from "./../pages/Home";
import Login from "./../pages/Login";
import Register from "./../pages/Register";
import SeachResult from "./../pages/SearchResult";
import TourDetails from "./../pages/TourDetails";
import Tours from "./../pages/Tours";
import AdminDashboard from "../components/Dashboard/Admin/AdminDashboard"
import RegisterHost from "../pages/RegisterHost";

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
        <Route path="/register-host" element={<RegisterHost />} />
        <Route path="/thank-you" element={<ThankYou />} />
        <Route path="/tours/search" element={<SeachResult />} />
        <Route path="/orders" element={<OrderHistory />} />
        <Route path="/profile" element={<Profile />} />
        <Route path="/dashboard" element={<DashboardHost />} />
        <Route path="/dashboard/tours" element={<TourHost />} />
        <Route path="/dashboard/support" element={<DashboardHost />} />
        <Route path="/dashboard/revenue" element={<Revenue />} />
        <Route path="/dashboard/orders_tracking" element={<OrderTracking />} />
        <Route path="/admin" element={<AdminDashboard />} />
      </Routes>
    </div>
  );
};

export default Routers;
