class BlogsController < ApplicationController
  layout "blog"

  def index
    @blog_posts = BlogPost.all
    render json: @blog_posts
  end

  def show
    @blog_post = BlogPost.find_by_slug(params[:slug])
    respond_to do |format|
      format.html { render html: "", layout: true}
      format.json { render json: @blog_post, root: "data" }
    end
  end
end
