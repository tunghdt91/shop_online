class SessionsController < ApplicationController

  def new
  	user = User.new
  end

  def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash[:error]='Invalid username or password'
			render :new
		end
	end

  def destroy
		sign_out
		redirect_to root_path
	end
end