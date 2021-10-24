class RoomsController < ApplicationController
  def index
    @rooms = policy_scope(Room).order(name: :asc)
  end

  def show
    @room = Room.find(params[:id])
    @post = Post.new
    authorize @room
  end
end
