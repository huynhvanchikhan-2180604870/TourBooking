import { Checkbox, FormControlLabel } from "@mui/material";
import { useFormik } from "formik";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import { Button, Form, FormGroup, ListGroup, ListGroupItem } from "reactstrap";
import * as Yup from "yup";
import { createBooking, createOrderPayment } from "../../store/Booking/Action";
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
  const formik = useFormik({
    initialValues: {
      fullname: "",
      cin: "",
      phone: "",
      guestSize: 1,
      amount: 0,
      tour_id: tour_id.id,
    },
    validationSchema,
    onSubmit: (values) => {
      // console.log("booking: ", values);
      dispatch(createBooking(values));
    },
  });
  const serviceFee = 10;
  const totalAmount =
    Number(tour?.price) * Number(formik.values.guestSize) + Number(serviceFee);

  React.useEffect(() => {
    formik.setFieldValue("amount", totalAmount);
  }, [formik.values.guestSize, totalAmount]);

  const handlePaymentRedirect = (orderUrl) => {
    window.location.href = orderUrl;
  };

  useEffect(() => {
    if (booking?.bookingData) {
      const paymentData = {
        bookingId: booking.bookingData.id,
        appuser: booking.bookingData.user,
        amount: booking.bookingData.totalPrice,
        order_id: booking.bookingData.tour.id,
      };
      dispatch(createOrderPayment(paymentData));
    }
  }, [booking.bookingData, dispatch]);

  useEffect(() => {
    if (booking?.payment?.orderurl) {
      // navigate(booking.payment.orderurl);
      handlePaymentRedirect(booking?.payment?.orderurl);
    }
  }, [booking.payment, navigate]);

  useEffect(() => {
    if (useRegisteredInfo && auth.user) {
      formik.setValues({
        fullname: auth.user.username,
        cin: auth.user.cin,
        phone: auth.user.phone,
        guestSize: formik.values.guestSize,
        amount: totalAmount,
        tour_id: tour_id.id,
      });
    } else {
      formik.resetForm({
        values: {
          fullname: "",
          cin: "",
          phone: "",
          guestSize: 1,
          amount: 0,
          tour_id: tour_id.id,
        },
      });
    }
  }, [useRegisteredInfo, auth.user, totalAmount, formik.resetForm]);

  return (
    <div className="booking">
      <div className="booking__top d-flex align-items-center justify-content-between">
        <h3>
          ${tour?.price} <span>/per person</span>
        </h3>

        <span className="tour__rating d-flex align-items-center">
          <i className="ri-star-fill"></i>
          {avgRating === 0 ? null : avgRating} ({tour?.reviews?.length})
        </span>
      </div>
      {/* ========= booking form=========== */}
      <div className="booking__forms">
        <h5
          className="text-center"
          style={{ fontFamily: "var(--font-name)", fontSize: "40px" }}
        >
          Information
        </h5>
        <Form className="booking__info-form" onSubmit={formik.handleSubmit}>
          <FormGroup>
            <input
              type="text"
              placeholder="Fullname"
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
              placeholder="Phone"
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
              placeholder="Citizen ID"
              id="cin"
              required
              value={formik.values.cin}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
            />
          </FormGroup>

          <FormGroup className="d-flex align-items-center g-4">
            <input
              type="number"
              placeholder="Guest"
              id="guestSize"
              required
              value={formik.values.guestSize}
              onChange={formik.handleChange}
              onBlur={formik.handleBlur}
            />
          </FormGroup>
          <FormControlLabel
            control={
              <Checkbox
                defaultChecked
                checked={useRegisteredInfo}
                onChange={(e) => setUseRegisteredInfo(e.target.checked)}
              />
            }
            label="Use Registered Information"
          />

          <div className="booking__bottom">
            <ListGroup>
              <ListGroupItem className="border-0 px-0">
                <h5 className="d-flex align-items-center gap-1">
                  ${tour?.price} <i className="ri-close-line"></i> 1 person
                </h5>
                <span>${tour?.price}</span>
              </ListGroupItem>

              <ListGroupItem className="border-0 px-0">
                <h5>Service charge</h5>

                <span>${serviceFee}</span>
              </ListGroupItem>

              <ListGroupItem className="border-0 px-0 total">
                <h5 className="">Total</h5>
                <span>${totalAmount}</span>
              </ListGroupItem>
            </ListGroup>
            <Button className="btn primary__btn w-100 mt-4" type="submit">
              Book Now
            </Button>
          </div>
        </Form>
      </div>
      {/* ========= booking form end=========== */}

      {/* ========== booking bottom============ */}

      {/* ========== booking bottom end============ */}
    </div>
  );
};

export default Booking;
