import { applyMiddleware, combineReducers, legacy_createStore } from "redux";
import { thunk } from "redux-thunk";
import { autReducer } from "./Auth/Reducer";
import hostReducer from "./Host/Reducer";
import tourReducer from "./Tour/Reducer";
const rootReducers = combineReducers({
  auth: autReducer,
  host: hostReducer,
  tour: tourReducer,
});

export const store = legacy_createStore(rootReducers, applyMiddleware(thunk));
