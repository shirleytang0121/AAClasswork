import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer"
import { applyMiddleware } from "redux";
import logger from 'redux-logger'
import { myThunk } from "../middleware/thunk";

const configureStore = (preloadedState={}) => {
    return createStore(rootReducer, preloadedState, applyMiddleware(myThunk, logger));
};

export default configureStore;
