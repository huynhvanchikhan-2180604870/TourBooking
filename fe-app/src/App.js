import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Route, Routes } from "react-router-dom";
import "./App.css";
import DashboardHost from "./components/Dashboard/Host/DashboardHost";
import Layout from "./components/Layout/Layout";
import { getUserProfile } from "./store/Auth/Action";
import { getAllTours } from "./store/Tour/Action";

function App() {
  const jwt = localStorage.getItem("jwt");
  const dispatch = useDispatch();
  const { auth } = useSelector((store) => store);
  useEffect(() => {
    if (jwt) {
      dispatch(getUserProfile(jwt));
      console.log("Token login: ", jwt);
    }
    dispatch(getAllTours())
  }, [dispatch, jwt]);
  return (
    <div className="">
      <Routes>
        <Route path="/*" element={<Layout />}></Route>
        <Route path="/dashboard/*" element={<DashboardHost />} />
      </Routes>
    </div>
  );
}

export default App;
