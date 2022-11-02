class MainController < ApplicationController
  def login
  end

  def create
    u = User.where(username: params[:username]).first
    if u and u.authenticate(params[:password])
      redirect_to main_user_item_path
      session[:user_id] = u.id
      session[:loggedin] = true
    else
      session[:loggedin] = false
      redirect_to main_login_path, notice: "Incorrect username or password, please try again."
    end
  end

  def destroy
    reset_session
  end

  def user_item 
    if mustLogin
      @item_list = Item.where(user_id: session[:user_id])
    end
  end

  def shop
    @shopping_list = Item.where(user_id: params[:id])
    render "main/shop"
  end

  def buy
      i = Item.where(id: params[:item_id]).first
      url = '/shop/' + params[:shop_id].to_s
      if i.stock <= 0
        redirect_to url, notice: "Buy failed, out of stock"
      else
        i.stock = i.stock-1
        i.save
        inven = Inventory.new
        inven.user_id = session[:user_id].to_i
        inven.item_id = params[:item_id].to_i
        inven.price = i.price
        inven.timestamp = Time.new
        inven.save
        redirect_to url, notice: "buy success"
      end
  end

  def inventories
    if mustLogin
      @inven_list = Inventory.where(user_id: session[:user_id])
      render "main/inventories"
    end
  end

end
