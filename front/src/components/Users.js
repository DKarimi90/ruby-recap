import React, {useEffect, useState} from 'react'

const Users = () => {
const [users, setUsers] = useState([])


    useEffect(() => {
    fetch('http://localhost:3000/users')
    .then((res) => {
      if(res.ok){
        return res.json()
      }
    })
    .then(data => {
      console.log(data)
      setUsers(data)
    })
  } ,[""])

  return (
    <div>
      {users.map((user, index) => (
        <div key={index}>
            <p>{user.username}</p>
        </div>
      ))}
    </div>
  )
}

export default Users