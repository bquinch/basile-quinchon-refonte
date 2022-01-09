import React, { useEffect, useState } from 'react';
import axios from 'axios';

interface Props {
  blogPostSlug?: string
  setBlogPostSlug: (action) => void
}

const BlogArticle: React.FC<Props> = ({ blogPostSlug, setBlogPostSlug }) => {

  const [currentBlogPost, setCurrentBlogPost] = useState(null)

  useEffect(() => {
    if (blogPostSlug) {
      axios.get(`/${blogPostSlug}.json`)
        .then((response) => setCurrentBlogPost(response.data.data))
    }
  }, [blogPostSlug])

    return (
      <>
        <h3>BLOG ARTICLE</h3>
        {currentBlogPost && (
            <div key={`blog-post--${window.location.pathname}`}>
              <h1 className='blog_post__title'>{currentBlogPost.title}</h1>
            </div>
        )}
        <p onClick={() => {
          window.history.replaceState({}, "", "/");
          setBlogPostSlug(null)
        }}>Back to blog list</p>
      </>
    )
}

export default BlogArticle
