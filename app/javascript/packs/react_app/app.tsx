import React, { useEffect, useState } from 'react';
import BlogArticles from './components/BlogArticles';
import BlogArticle from './components/BlogArticle';

const App: React.FC = () => {
  const [blogPostSlug, setBlogPostSlug] = useState(null)

  useEffect(() => {
    if (window.location.pathname !== "/" && !blogPostSlug) {
      setBlogPostSlug(window.location.pathname.substring(1))
    }
  }, [blogPostSlug])

  return (
    <div className="App">
      <header className="App-header">
        { blogPostSlug && <BlogArticle blogPostSlug={blogPostSlug} setBlogPostSlug={setBlogPostSlug}/>}
        { (!blogPostSlug && window.location.pathname === "/") && <BlogArticles setBlogPostSlug={setBlogPostSlug}/>}
      </header>
    </div>
  );
}

export default App;
