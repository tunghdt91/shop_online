class OrdersController < ApplicationController
   before_filter :signed_in_user, only: [:create,:show]
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    @product_orders = ProductOrder.all
  
    @product_orders = ProductOrder.where("order_id = ?",@order.id)
  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.user_id = current_user.id
    @order.save

    @products = Product.all
    a = session[:carts]
    @products.each do |product|
    if(a.has_key?(:"#{product.id}"))

    @product_order = ProductOrder.new(params[:product_order])
    @product_order.order_id = @order.id
    @product_order.product_id = product.id
    @product_order.quantity = a[:"#{product.id}"]
    @product_order.save
    end
    end

    respond_to do |format|
      if @product_order.save
        format.html { redirect_to @order, notice: '' }
        flash[:success]="Completed !Thank You."
      else
        format.html { render action: "new" }
        
      end
    end

    session[:carts]={}
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
  
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
