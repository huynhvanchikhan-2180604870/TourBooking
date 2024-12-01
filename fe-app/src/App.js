// import { useEffect } from "react";
// import { useDispatch, useSelector } from "react-redux";
// import { Route, Routes } from "react-router-dom";
// import "./App.css";
// import DashboardHost from "./components/Dashboard/Host/DashboardHost";
// import Layout from "./components/Layout/Layout";
// import { getUserProfile } from "./store/Auth/Action";
// import { getAllTours } from "./store/Tour/Action";

// function App() {
//   const jwt = localStorage.getItem("jwt");
//   const dispatch = useDispatch();
//   const { auth } = useSelector((store) => store);
//   useEffect(() => {
//     if (jwt) {
//       dispatch(getUserProfile(jwt));
//       console.log("Token login: ", jwt);
//     }
//     dispatch(getAllTours())
//   }, [dispatch, jwt]);
//   return (
//     <div className="">
//       <Routes>
//         <Route path="/*" element={<Layout />}></Route>
//         <Route path="/dashboard/*" element={<DashboardHost />} />
//       </Routes>
//     </div>
//   );
// }

// export default App;
import { SnackbarProvider, useSnackbar } from "notistack";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Route, Routes } from "react-router-dom";
import "./App.css";
import AdminDashboard from "./components/Dashboard/Admin/AdminDashboard";
import DashboardHost from "./components/Dashboard/Host/DashboardHost";
import Layout from "./components/Layout/Layout";
import { getUserProfile } from "./store/Auth/Action";
import { getAllTours } from "./store/Tour/Action";

function App() {
  return (
    <SnackbarProvider
      maxSnack={3}
      autoHideDuration={4000}
      anchorOrigin={{ vertical: "top", horizontal: "right" }}
    >
      <MainApp />
    </SnackbarProvider>
  );
}

function MainApp() {
  const jwt = localStorage.getItem("jwt");
  const dispatch = useDispatch();
  const { auth, tour } = useSelector((store) => store);
  const { enqueueSnackbar } = useSnackbar(); // Hook để hiển thị thông báo

  // Lấy thông tin người dùng
  useEffect(() => {
    if (jwt) {
      dispatch(getUserProfile(jwt));
      // .then(() =>
      //   enqueueSnackbar("Đăng nhập thành công!", { variant: "success" })
      // )
      // .catch(() =>
      //   enqueueSnackbar("Lỗi khi lấy thông tin người dùng!", {
      //     variant: "error",
      //   })
      // );
    }
  }, [dispatch, jwt, enqueueSnackbar]);

  // Lấy danh sách tours
  useEffect(() => {
    dispatch(getAllTours());
    // .then(() =>
    //   enqueueSnackbar("Tải danh sách tours thành công!", {
    //     variant: "success",
    //   })
    // )
    // .catch(() =>
    //   enqueueSnackbar("Lỗi khi tải danh sách tours!", { variant: "error" })
    // );
  }, [dispatch, enqueueSnackbar]);

  return (
    <div className="app">
      <Routes>
        <Route path="/*" element={<Layout />} />
        <Route path="/dashboard/*" element={<DashboardHost />} />
        <Route path="/admin/*" element={<AdminDashboard />} />
      </Routes>
    </div>
  );
}

export default App;
