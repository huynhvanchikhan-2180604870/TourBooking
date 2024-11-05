import axios from "axios";
import { useFormik } from "formik";
import React, { useEffect, useState } from "react";
import { Col, Form, FormGroup } from "reactstrap";
import "./search-bar.css";

export const SearchBar = ({ onSearch }) => {
  const [categories, setCategories] = useState([]);
  const handleSubmit = (values) => {
    console.log(values);
  };
  const formik = useFormik({
    initialValues: {
      destination: undefined,
      departureDate: undefined,
      category: "",
    },
    onSubmit: (values) => {
      console.log(values);
      onSearch(values); // Gọi hàm onSearch được truyền từ component cha
    },
  });

  useEffect(() => {
    // Fetch categories from the API
    axios
      .get("http://localhost:8080/api/v1/tours/categories")
      .then((response) => {
        setCategories(response.data);
      })
      .catch((error) => console.error("Error fetching categories:", error));
  }, []);

  const searchHandler = () => {};

  return (
    <Col lg="12">
      <div className="search__bar">
        <Form
          className="d-flex align-items-center gap-4"
          onSubmit={formik.handleSubmit}
        >
          <FormGroup className="d-flex g-3 form__group form__group-fast">
            <span>
              <i className="ri-map-pin-line"></i>
            </span>
            <div className="ms-2">
              <h6>Location</h6>
              <input
                type="text"
                placeholder="Where are you going?"
                name="destination"
                className="pt-2"
                onChange={formik.handleChange} // Bind Formik handleChange
                value={formik.values.destination} // Bind Formik value
              />
            </div>
          </FormGroup>

          <FormGroup className="d-flex g-3 form__group form__group-fast">
            <span>
              <i className="ri-calendar-line"></i>
            </span>
            <div className="ms-2">
              <h6>Departure Date</h6>
              <input
                type="date"
                name="departureDate"
                className="pt-2 me-4"
                onChange={formik.handleChange} // Bind Formik handleChange
                value={formik.values.departureDate} // Bind Formik value
              />
            </div>
          </FormGroup>

          <FormGroup className="d-flex g-3 form__group form__group-last">
            <span>
              <i class="ri-earth-line mt-2"></i>
            </span>
            <div className="ms-2">
              <h6>Category</h6>
              <select
                value={formik.values.category}
                onChange={formik.handleChange}
                onBlur={formik.handleBlur}
                name="category"
                className="select_cate pt-2"
              >
                <option value="">Select a category</option>
                {categories.map((cat, index) => (
                  <option key={index} value={cat.id}>
                    {cat.name}
                  </option>
                ))}
              </select>
            </div>
          </FormGroup>

          <button className="search__icon" type="submit">
            <i className="ri-search-line"></i>
          </button>
        </Form>
      </div>
    </Col>
  );
};
