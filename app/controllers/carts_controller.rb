 class CartsController < ApplicationController
	include UsersHelper
	before_filter :signed_in_user, 	only: [:index, :edit, :update, :destroy, :new]

	def show
	

	end

	def index
		
	end


  	def new

  	end

  	def mycarts
  	end

  	def add_to_carts
  		hash = session[:carts]
    	if (hash.has_key?(:"#{params[:id]}"))
      		hash[:"#{params[:id]}"] += 1
      		
    	else
      		hash[:"#{params[:id]}"] = 1
      		
    	end
    	
    	session[:carts] = hash
    	redirect_to root_path
  	end

  	def create

  	end

	def edit

	end

	def update

	end


	def destroy
		session[:carts] = {}
	
		redirect_to mycarts_path
  	end

 

end