class ProductMicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create,:show]

	def create	
		@product_micropost = @product.product_microposts.build(params[:product_micropost])
		if @product_micropost.save
			flash[:success] ="Posts created !"
		else
			flash[:errors] = "Not created !"
		end
	end

	def destroy	
	end

	def index
	end
end
