import axios from "axios";
import { API_BASE_URL } from "../../config/api";
import {
  FIND_TOUR_FAILURE,
  FIND_TOUR_REQUEST,
  FIND_TOUR_SUCCESS,
  GET_TOURS_FAILURE,
  GET_TOURS_REQUEST,
  GET_TOURS_SUCCESS,
  POST_TOUR_REVIEW_FAILURE,
  POST_TOUR_REVIEW_REQUEST,
  POST_TOUR_REVIEW_SUCCESS,
} from "./ActionType";

// Action Creators
export const getAllTours = (queryParams) => async (dispatch) => {
  console.log("queryParams: ", queryParams);
  dispatch({ type: GET_TOURS_REQUEST });
  try {
    const response = await axios.get(`${API_BASE_URL}/api/v1/tours`, {
      params: queryParams,
    });
    console.log("all tours: ", response.data);
    dispatch({ type: GET_TOURS_SUCCESS, payload: response.data });
  } catch (error) {
    dispatch({ type: GET_TOURS_FAILURE, payload: error.toString() });
  }
};

export const findTourById = (id) => async (dispatch) => {
  dispatch({ type: FIND_TOUR_REQUEST });
  try {
    const response = await axios.get(`${API_BASE_URL}/api/v1/tours/` + id);
    console.log("all tours: ", response.data);
    dispatch({ type: FIND_TOUR_SUCCESS, payload: response.data });
  } catch (error) {
    dispatch({ type: FIND_TOUR_FAILURE, payload: error.toString() });
  }
};

export const postReview = (reviewData) => async (dispatch) => {
  dispatch({ type: POST_TOUR_REVIEW_REQUEST });
  const token = localStorage.getItem("jwt");
  try {
    const response = await axios.post(
      `${API_BASE_URL}/api/v2/reviews/create`,
      reviewData,
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );
    dispatch({ type: POST_TOUR_REVIEW_SUCCESS, payload: response.data });
  } catch (error) {
    dispatch({ type: POST_TOUR_REVIEW_FAILURE, payload: error.toString() });
  }
};
