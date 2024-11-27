import { GoogleLogin } from "@react-oauth/google";
import { useFormik } from "formik";
import React from "react";
import { useDispatch } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import { Button, Col, Container, Form, FormGroup, Row } from "reactstrap";
import * as Yup from "yup";
import loginImg from "../assets/images/login.png";
import userImg from "../assets/images/user.png";
import { loginGoole, loginUser } from "../store/Auth/Action";
import "../styles/login.css";

const validationSchema = Yup.object().shape({
  email: Yup.string().email("Invalid email").required("Email is Required"),
  password: Yup.string().required("Password is required"),
});
const Login = () => {
  const formik = useFormik({
    initialValues: {
      email: "",
      password: "",
    },
    validationSchema,
    onSubmit: (values) => {
      dispatch(loginUser(values));
      navigate("/home");
    },
  });
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const clientId =
    "161623696141-hqqj106vng0rai1f8vs03m9rgcoum2t8.apps.googleusercontent.com";
  const appId = "1034224698444668";

  // const handleChange = (e) => {
  //   setCredentials((prev) => ({ ...prev, [e.target.id]: e.target.value }));
  // };

  const handleClick = (e) => {
    // e.preventDefault();
  };

  const handleGoogleLoginSuccess = async (credentialResponse) => {
    try {
      // Lấy credential từ Google
      const token = credentialResponse.credential;
      console.log("Backend response:", token);
      dispatch(loginGoole(token));
      navigate("/home");
    } catch (error) {
      console.error("Error during Google login:", error);
    }
  };

  const errorMessage = (error) => {
    console.log(error);
  };

  const responseFacebook = (response) => {
    try {
      if (response.status === "unknown") {
        console.error("Failed to login with Facebook");
        // Xử lý lỗi đăng nhập
      } else {
        console.log("Facebook login success: ", response);
        // Xử lý token và thông tin người dùng nhận được từ Facebook
        const { name, email, picture, accessToken } = response;
        console.log("Name: ", name);
        console.log("Email: ", email);
        console.log("Picture: ", picture.data.url);
        console.log("Access Token: ", accessToken);
        // Bạn có thể gửi thông tin này lên server hoặc lưu trữ cục bộ
      }
    } catch (error) {}
  };

  const handleFacebookCallback = (response) => {
    if (response?.status === "unknown") {
      console.error("Sorry!", "Something went wrong with facebook Login.");
      return;
    }
    console.log(response);
    // console will print following object for you.
  };

  const handleLogin = () => {};

  return (
    <section>
      <Container>
        <Row>
          <Col lg="8" className="m-auto">
            <div className="login__container d-flex justify-content-between">
              <div className="login__img">
                <img src={loginImg} alt="" />
              </div>

              <div className="login__form">
                <div className="user">
                  <img src={userImg} alt="" />
                </div>
                <h2>Login</h2>

                <Form onSubmit={formik.handleSubmit}>
                  <FormGroup>
                    <input
                      type="email"
                      placeholder="Email"
                      required
                      id="email"
                      value={formik.values.email}
                      onChange={formik.handleChange}
                      onBlur={formik.handleBlur}
                      error={
                        formik.touched.email && Boolean(formik.errors.email)
                      }
                      helperText={formik.touched.email && formik.errors.email}
                    />
                  </FormGroup>

                  <FormGroup>
                    <input
                      type="password"
                      placeholder="Password"
                      required
                      id="password"
                      value={formik.values.password}
                      onChange={formik.handleChange}
                      onBlur={formik.handleBlur}
                      error={
                        formik.touched.password &&
                        Boolean(formik.errors.password)
                      }
                      helperText={
                        formik.touched.password && formik.errors.password
                      }
                    />
                  </FormGroup>
                  <Button
                    className="btn secondary__btn auth__btn"
                    type="submit"
                  >
                    Login
                  </Button>
                  <div className="social__login d-flex align-items-center justify-content-between mt-3">
                    <GoogleLogin
                      width={330}
                      onSuccess={handleGoogleLoginSuccess}
                      onError={errorMessage}
                    />
                  </div>
                  {/* <div className="social__login d-flex align-items-center justify-content-between mt-3"></div> */}
                </Form>
                <p>
                  Don't have an account? <Link to="/register">Create</Link>
                </p>
              </div>
            </div>
          </Col>
        </Row>
      </Container>
    </section>
  );
};

export default Login;
