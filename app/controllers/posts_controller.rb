class PostsController < ApplicationController
  before_action :post_params, only: [:create]

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    authorize @post
  end

  def create
    @room = Room.find(params[:room_id])
    @post = Post.new(post_params)
    @post.room = @room
    @post.user = current_user
    if @post.save
      RoomChannel.broadcast_to(
        @room,
        render_to_string(partial: "post", locals: { post: @post })
      )
      redirect_to room_path(@room, anchor: "post-#{@post.id}")
    else
      render "rooms/show"
    end
  end

  private

  def post_params
    params.require(:post).permit(:post)
  end

end
