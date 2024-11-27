import { Checkbox, FormControlLabel } from "@mui/material";
import { useFormik } from "formik";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import { Button, Form, FormGroup, ListGroup, ListGroupItem } from "reactstrap";
import * as Yup from "yup";
import { createBooking, createOrderPayment } from "../../store/Booking/Action";
import { formatCurrency } from "../../utils/formatCurrency";
import "./booking.css";

const validationSchema = Yup.object().shape({
  cin: Yup.string().required("Citizen Identification Number is required"),
  phone: Yup.string().required("Phone is required"),
});
const Booking = ({ tour, avgRating }) => {
  const navigate = useNavigate();
  const tour_id = useParams();
  const dispatch = useDispatch();
  const { booking, auth } = useSelector((store) => store);
  const [useRegisteredInfo, setUseRegisteredInfo] = useState(false);

  // Formik để quản lý form
  const formik = useFormik({
    initialValues: {
      fullname: "",
      cin: "",
      phone: "",
      guestSize: 1,
      amount: 0,
      paymentMethod: "", // Thêm paymentMethod vào form
      tour_id: tour_id.id,
    },
    validationSchema: Yup.object().shape({
      cin: Yup.string().required("Citizen Identification Number is required"),
      phone: Yup.string().required("Phone is required"),
      paymentMethod: Yup.string().required("Please select a payment method"), // Bắt buộc chọn phương thức thanh toán
    }),
    onSubmit: (values) => {
      dispatch(createBooking(values));
    },
  });

  const serviceFee = 10000;
  const totalAmount =
    Number(tour?.price) * Number(formik.values.guestSize) + Number(serviceFee);

  React.useEffect(() => {
    formik.setFieldValue("amount", totalAmount);
  }, [formik.values.guestSize, totalAmount]);

  useEffect(() => {
    if (useRegisteredInfo && auth.user) {
      formik.setFieldValue("fullname", auth.user.username);
      formik.setFieldValue("cin", auth.user.cin);
      formik.setFieldValue("phone", auth.user.phone);
    } else {
      formik.setFieldValue("fullname", "");
      formik.setFieldValue("cin", "");
      formik.setFieldValue("phone", "");
    }
  }, [useRegisteredInfo, auth.user]);

  const handlePaymentRedirect = (orderUrl) => {
    window.location.href = orderUrl;
  };

  useEffect(() => {
    if (booking?.payment?.orderurl) {
      // navigate(booking.payment.orderurl);
      handlePaymentRedirect(booking?.payment?.orderurl);
    }
  }, [booking.payment, navigate]);
  useEffect(() => {
    if (booking?.bookingData) {
      const paymentData = {
        bookingId: booking.bookingData.id,
        appuser: booking.bookingData.user,
        amount: booking.bookingData.totalPrice,
        order_id: booking.bookingData.tour.id,
        paymentMethod: booking.bookingData.paymentMethod,
      };
      dispatch(createOrderPayment(paymentData));
    }
  }, [booking.bookingData, dispatch]);

  return (
    <div className="booking">
      <div className="booking__top d-flex align-items-center justify-content-between">
        <h3>
          {formatCurrency(tour?.price)}
          <span>/người</span>
        </h3>

        <span className="tour__rating d-flex align-items-center">
          <i className="ri-star-fill"></i>
          {avgRating === 0 ? null : avgRating} ({tour?.reviews?.length})
        </span>
      </div>
      {/* Booking Form */}
      <div className="booking__forms">
        <h5
          className="text-center"
          style={{ fontFamily: "var(--font-name)", fontSize: "40px" }}
        >
          Thông tin đặt vé
        </h5>
        <Form className="booking__info-form" onSubmit={formik.handleSubmit}>
          <FormGroup>
            <input
              type="text"
              placeholder="Họ và tên khách hàng"
              id="fullname"
              required
              value={formik.values.fullname}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
            />
          </FormGroup>

          <FormGroup>
            <input
              type="text"
              placeholder="Số điện thoại liên lạc"
              id="phone"
              required
              value={formik.values.phone}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
            />
          </FormGroup>

          <FormGroup>
            <input
              type="text"
              placeholder="Số CMND/CCCD"
              id="cin"
              required
              value={formik.values.cin}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
            />
          </FormGroup>

          <FormGroup className="d-flex align-items-center g-4">
            <div className="number-input m-auto">
              <button
                type="button"
                onClick={() => {
                  const currentValue = Math.max(formik.values.guestSize - 1, 1);
                  formik.setFieldValue("guestSize", currentValue);
                }}
              >
                -
              </button>
              <input
                type="number"
                placeholder="Số lượng vé"
                id="guestSize"
                required
                value={formik.values.guestSize}
                onChange={(e) => {
                  const newValue = Math.min(
                    Math.max(e.target.value, 1),
                    tour?.ticketsRemaining || 1
                  );
                  formik.setFieldValue("guestSize", newValue);
                }}
                onBlur={formik.handleBlur}
                min={1}
                max={tour?.ticketsRemaining || 1}
              />
              <button
                type="button"
                onClick={() => {
                  const currentValue = Math.min(
                    formik.values.guestSize + 1,
                    tour?.ticketsRemaining || 1
                  );
                  formik.setFieldValue("guestSize", currentValue);
                }}
              >
                +
              </button>
            </div>
          </FormGroup>
          <FormControlLabel
            control={
              <Checkbox
                checked={useRegisteredInfo}
                onChange={(e) => setUseRegisteredInfo(e.target.checked)}
              />
            }
            label="Sử dụng thông tin đã đăng ký"
          />
          {/* Phương thức thanh toán */}
          <FormGroup className="payment-method-group">
            <h5>Phương thức thanh toán:</h5>
            <div className="payment-options">
              <div className="payment-option mt-4">
                <input
                  type="radio"
                  id="ZALOPAY"
                  name="paymentMethod"
                  value="ZALOPAY"
                  checked={formik.values.paymentMethod === "ZALOPAY"}
                  onChange={formik.handleChange}
                />
                <label htmlFor="zalopay" className="payment-label">
                  <img
                    src="https://th.bing.com/th?id=OIP.dqBGQAVmIM35FLHSndWGLwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.4&pid=3.1&rm=2"
                    alt="ZaloPay"
                    className="payment-logo"
                  />
                  ZaloPay
                </label>
              </div>
              <div className="payment-option mt-4">
                <input
                  type="radio"
                  id="VNPAY"
                  name="paymentMethod"
                  value="VNPAY"
                  checked={formik.values.paymentMethod === "VNPAY"}
                  onChange={formik.handleChange}
                />
                <label htmlFor="VNPAY" className="payment-label">
                  <img
                    src="https://th.bing.com/th/id/OIP.pn3RUm1xk1HiAxWIgC6CIwHaHa?w=158&h=180&c=7&r=0&o=5&dpr=1.4&pid=1.7"
                    alt="VNPay"
                    className="payment-logo"
                  />
                  VNPay
                </label>
              </div>
            </div>
            {formik.errors.paymentMethod && formik.touched.paymentMethod && (
              <p className="text-danger">{formik.errors.paymentMethod}</p>
            )}
          </FormGroup>

          <div className="booking__bottom">
            <ListGroup>
              <ListGroupItem className="border-0 px-0">
                <h5 className="d-flex align-items-center gap-1">
                  {formatCurrency(tour?.price)}
                  <i className="ri-close-line"></i> 1 người
                </h5>
                <span>{formatCurrency(tour?.price)} vnđ</span>
              </ListGroupItem>

              <ListGroupItem className="border-0 px-0">
                <h5>Chi phí dịch vụ</h5>
                <span>{formatCurrency(serviceFee)} vnđ</span>
              </ListGroupItem>

              <ListGroupItem className="border-0 px-0 total">
                <h5 className="">Tổng cộng</h5>
                <span>{formatCurrency(totalAmount)} vnđ</span>
              </ListGroupItem>
            </ListGroup>
            <Button className="btn primary__btn w-100 mt-4" type="submit">
              Đặt vé ngay
            </Button>
          </div>
        </Form>
      </div>
    </div>
  );
};

export default Booking;
