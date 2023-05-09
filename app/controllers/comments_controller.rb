class CommentsController < ApplicationController
  def create_comment
    @shoes = Shoe.order(created_at: :asc)
    # shoe_id = params.fetch("shoe_id")

    # comment = Comment.new

    # comment.body = 
    # comment.author_id = session.fetch(:user_id)
    # comment.shoe_id = shoe_id
    
    # comment.save

    render "comments/comment.html.erb"
  end 

end
