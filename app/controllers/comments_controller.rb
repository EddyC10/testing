class CommentsController < ApplicationController
  def index
    @shoes = Shoe.order(created_at: :asc)
    render "comments/comment.html.erb"
  end 

  def create_comment

    comment = Comment.new

    comment.body = params.fetch("query_comment")
    comment.author_id = session.fetch(:user_id)
    comment.shoe_id = shoe_id = params.fetch("query_shoe_id")
    
    comment.save
    
    redirect_to "/comments", notice: "Comment added successfully"
  end

end
