import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Articles from "./components/Articles";
import Users from "./components/Users";
import Navbar from "./components/Navbar";
import { useEffect, useState } from "react";
import Login from "./components/Login";


function App() {
const [isLogged, setIsLogged] = useState()
const [user, setUser] = useState(null)

useEffect(() => {
  fetch('http://localhost:3000/me')
  .then(res => {
    if(res.ok) {
      res.json().then(user => setUser(user))
    }
  })
},[])

  return (
    <div className="App">
      <Router>
        <Navbar />
        <Routes>
          <Route path="/" element={<Users />}/>
          <Route path="articles" element={<Articles />}/>
          <Route path="login" element={<Login setUser={setUser}/>}/>
        </Routes>
      </Router>
  
    </div>
  );
}

export default App;
