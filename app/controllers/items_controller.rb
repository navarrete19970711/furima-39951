class ItemsController < ApplicationController
  
  def index
  end


  endprivate

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
