
import React, {useState} from 'react'
import { Link, useNavigate } from 'react-router-dom'

const Login = ({setUser}) => {

    const [username, setUserName] = useState("")
    const [password, setPassword] = useState("")
    const navigate = useNavigate()

    const handleLogin = (e) => {
        e.preventDefault()
        fetch('http://localhost:3000/login', {
            method: "POST", 
            headers: {"Content-Type": "application/json"}, 
            body: JSON.stringify({username, password})
        })
        .then(res => {
            if(res.ok) {
                return res.json()
            }
        })
        .then(user=> {
            console.log(user)
            setUser(user)
            // setIsLogged(true)
            navigate('/articles')

        })
    }
  return (
    <div>
        <form onSubmit={handleLogin}>
            <label htmlFor="username">Username</label><br/>
            <input value={username} onChange={(e) => setUserName(e.target.value)} required/><br/>
            <label htmlFor="password">Password</label><br/>
            <input value={password} onChange={(e) => setPassword(e.target.value)} required/><br/>
            <button type='submit'>Login</button><br/>
            <Link to="/articles">Don't have an Account? Sign up</Link>
        </form>
    </div>
  )
}

export default Login