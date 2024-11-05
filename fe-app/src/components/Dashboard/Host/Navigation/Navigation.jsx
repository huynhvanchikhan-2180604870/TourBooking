import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useLocation, useNavigate } from "react-router-dom";
import { getUserProfile, logout } from "../../../../store/Auth/Action";
import { navigationMenu } from "./NavigationMenu";

const Navigation = () => {
  const jwt = localStorage.getItem("jwt");
  const { auth } = useSelector((store) => store);
  const [anchorEl, setAnchorEl] = useState(null);
  const dispatch = useDispatch();
  const location = useLocation();

  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleLogout = () => {
    console.log("logout");
    handleClose();
    dispatch(logout(jwt));
  };
  const navigate = useNavigate();

  useEffect(() =>{
    if(jwt !== null){
      dispatch(getUserProfile(jwt));
    }
  },[])
  return (
    <div className="md:flex-row container sticky top-0 h-screen">
      <div className="">
        <div className="space-y-6 h-[100%]">
          {navigationMenu.map((item, index) => (
            <div
              key={index}
              className="cursor-pointer flex space-x-3 align-items-center text-center justify-content-center mb-2"
              style={{
                border: "1px solid #FFCFB3",
                borderRadius: "20px",
                outline: "none",
              }}
              onClick={() => navigate(`${item.path}`)}
            >
              <p className="text-xl">{item.title}</p>
            </div>
          ))}
        </div>
        <div className="space-y-6">
          Hello, {auth?.user?.username}
        </div>
      </div>
    </div>
  );
};

export default Navigation;
