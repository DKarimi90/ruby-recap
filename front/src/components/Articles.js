import React, {useEffect, useState} from 'react'

const Articles = () => {
const [articles, setArticles] = useState([])

    useEffect(() => {
        fetch('http://localhost:3000/articles')
        .then(res => {
          if(res.ok){
            return res.json()
          }
        })
        .then(data => {
          console.log(data)
          setArticles(data)
        })
      },[]) 
  return (
    <div>
        {articles && articles.map((article, index) => (
            <div key={index}>
                <p>{article.title}</p>
            </div>
        ))}
    </div>
  )
}

export default Articles