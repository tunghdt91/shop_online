class ManufacturersController < ApplicationController
  #before_filter :signed_in_user
 # before_filter :admin_user,     only: [:edit, :new, :index ]


  # GET /categories
  # GET /categories.json
  def index
    @manufacturers = Manufacturer.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @manufacturer = Manufacturer.new
  end

  # GET /categories/1/edit
  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @manufacturer = Manufacturer.new(params[:manufacturer])

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to manufacturers_path, notice: 'Category was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @manufacturer = Manufacturer.find(params[:id])

    respond_to do |format|
      if @manufacturer.update_attributes(params[:manufacturer])
        format.html { redirect_to @manufacturer, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    respond_to do |format|
      format.html { redirect_to Manufacturer_path }
      format.json { head :no_content }
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
