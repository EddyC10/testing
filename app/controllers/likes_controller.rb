class LikesController < ApplicationController
  def user_likes
    user_like = Like.new

    user_like.user_id = session.fetch(:user_id)
    user_like.shoe_id = params.fetch("something")

    redirect_to "/"
  end
end
