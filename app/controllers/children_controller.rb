class ChildrenController < ApplicationController
  # before_action :policy_scope_event

  def index
    @children = policy_scope(Child).where(user: current_user)
  end

  def show
  end

  def new
  end

  def create
    authorize @child
  end

  def update
  end

  def edit
  end

  # private

  # def policy_scope_event
  #   authorize @child
  # end
end
