import { BOOKING_TOUR_REQUEST, BOOKING_TOUR_SUCCESS } from "../Tour/ActionType";
import {
  CHECK_PAYMENT_STATUS_FAILURE,
  CHECK_PAYMENT_STATUS_REQUEST,
  CHECK_PAYMENT_STATUS_SUCCESS,
  CREATE_BOOKING_FAILURE,
  GET_ORDERS_FAILURE,
  GET_ORDERS_REQUEST,
  GET_ORDERS_SUCCESS,
  PAYMENT_FAILURE,
  PAYMENT_REQUEST,
  PAYMENT_SUCCESS,
} from "./ActionType";

const initialState = {
  loading: false,
  bookingData: null,
  error: null,
  payment: null,
  paymentStatus: null,
  orders: [],
};

const bookingReducer = (state = initialState, action) => {
  switch (action.type) {
    case BOOKING_TOUR_REQUEST:
    case PAYMENT_REQUEST:
    case CHECK_PAYMENT_STATUS_REQUEST:
    case GET_ORDERS_REQUEST:
      return {
        ...state,
        loading: true,
      };
    case BOOKING_TOUR_SUCCESS:
      return {
        ...state,
        loading: false,
        bookingData: action.payload,
      };
    case PAYMENT_SUCCESS:
      return {
        ...state,
        loading: false,
        payment: action.payload,
        bookingData: null,
      };
    case CHECK_PAYMENT_STATUS_SUCCESS:
      return {
        ...state,
        loading: false,
        paymentStatus: action.payload,
        payment: null,
      };

    case GET_ORDERS_SUCCESS:
      return {
        ...state,
        loading: false,
        orders: action.payload,
      };

    case CREATE_BOOKING_FAILURE:
    case PAYMENT_FAILURE:
    case CHECK_PAYMENT_STATUS_FAILURE:
    case GET_ORDERS_FAILURE:
      return {
        ...state,
        loading: false,
        error: action.payload,
      };
    default:
      return state;
  }
};

export default bookingReducer;
