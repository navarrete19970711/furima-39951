class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :user_item
  before_action :sold_item



  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end


  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      pay_item
      @purchase_delivery_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end




  private

  def purchase_params
    params.require(:purchase_delivery_address).permit(:postal_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def user_item
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def sold_item
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
