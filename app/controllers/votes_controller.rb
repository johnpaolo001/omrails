class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    item = Item.find(params[:id])
    item.liked_by current_user
    redirect_to items_path, notice: "you successfully voted for an item"
  end

  def destroy
    item = Item.find(params[:id])
    item.unliked_by current_user
    redirect_to items_path, notice: "you successfully unvoted for an item"
  end
end