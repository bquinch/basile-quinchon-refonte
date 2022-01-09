import React, { useEffect, useState } from 'react';
import axios from 'axios';

interface Props {
  setBlogPostSlug: (action) => void
}

const BlogArticles: React.FC<Props> = ({ setBlogPostSlug }) => {

  const [blogPosts, setBlogPosts] = useState([])

  useEffect(() => {
    axios.get('/blogs.json')
      .then((response) => setBlogPosts(response.data))
  }, [])

    return (
      <>
        <h3>BLOG ARTICLE LIST</h3>
        {blogPosts.map((blogPost, i) => {
          return (
            <div key={`blog-post--${i}`} onClick={() => {
              window.history.pushState({}, '', blogPost.slug);
              setBlogPostSlug(blogPost.slug)
            }}>
              <h1 className='blog_post__title' >{blogPost.title}</h1>
            </div>
          )
        })}
      </>
    )
}

export default BlogArticles
