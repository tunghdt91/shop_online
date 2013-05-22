class ProductsController < ApplicationController

	def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @product_microposts = @product.product_microposts.paginate(page: params[:page])
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    @categories = Category.all
    @manufacturers = Manufacturer.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
        @categories = Category.all
        @manufacturers = Manufacturer.all

  end

  # POST /products
  # POST /products.json
  def create

    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def list_products
    @products = Product.find_all_by_category_id(params[:id])
    @category = Category.find(params[:id])
  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def price_by_asc
    @products = Product.find_by_sql("select * from products ORDER BY price ASC")

  end

  def price_by_desc
    @products = Product.find_by_sql("select * from products ORDER BY price DESC")
  end

  def newupdate
    @products = Product.find_by_sql("select * from products ORDER BY updated_at DESC")
  end
  def comment
    #@product = Product.find_by_id(params[:params].to_i)
    @product = Product.find_by_id(params[:id].to_i)
    content = params[:content]
    @product.product_microposts.create!(content: content)
    redirect_to product_path(@product)
  end
end
