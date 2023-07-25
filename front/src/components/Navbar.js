import React from 'react'
import { NavLink } from 'react-router-dom'

const Navbar = () => {
  return (
    <div className="nav">
        <NavLink to="/">Users</NavLink>
        <NavLink to="/articles">Articles</NavLink>
        <NavLink to="login">Login</NavLink>
    </div>
  )
}

export default Navbar