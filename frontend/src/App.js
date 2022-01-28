import React from "react";
import "./App.css";
import Recommend from "./components/recommend/Recommend.js";
// import { Route } from "react-router-dom";
import About from "./routes/About";
import Home from "./routes/Home";
import Navbar from "./components/Navbar";
import UserPage from "./routes/UserPage";
import User from "./routes/User";

import {
  BrowserRouter as Router,
  Route,
  Routes,
  Switch,
  Link,
} from "react-router-dom";

function App() {
  return (
    <div className="App">
      <Router>
        <Navbar></Navbar>
        <Routes>
          <Route path="/" exact={true} element={<Home />}></Route>
          <Route path="/about" exact={true} element={<About />}></Route>
          <Route path="/recommend" exact={true} element={<Recommend />}></Route>
          {/* <Route path="/user" exact={true} element={<User />}></Route> */}
          {/* <Route path="/userpage" exact={true} element={<UserPage />}></Route> */}
        </Routes>
      </Router>
    </div>
  );
}

export default App;
