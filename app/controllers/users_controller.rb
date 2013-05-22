class UsersController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user, only: [:edit, :update]
    before_filter :signed_in?,   only: [:edit, :update]
    before_filter :checked_admin?,     only: :destroy

	def show
		@user = User.find(params[:id])
		@microposts = @user.microposts.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
	if @user.save
		flash[:success] = "Thank You !\nYour Account is Created."
			UserMailer.welcome_email(@user).deliver

			sign_in @user
			redirect_to root_path
		else
		render 'register'
		end
	end

	def napthe
	end

	def nt

		@serial = params[:serial]
		if @serial=="0979002506"
			flash[:success] = "Thank you .CheckEmail now."
			UserMailer.welcome_email(current_user).deliver
			
			redirect_to user_path(current_user)
		else
			flash[:errors] = "Not found"
			redirect_to user_path
		end
	end

	def addpoint
		@serial_point =params[:serial_point]
		if @serial_point=="1234567890"
			flash[:success] = "ma so dung"
			current_user.point +=500
				if current_user.update_attributes(params[:current_user])
					binding.pry
					flash[:success] = "Done"
					redirect_to user_path
				else
				flash[:errors] = "Errors"
				redirect_to napthe_path
				end
			
		else
			flash[:errors] = "Incorect serial"		
		end
	end

	def edit
		@user = User.find(params[:id])
		if(current_user? @user)
		#nothing do
		else
		 flash[:errors] = "Access permission !"
		 redirect_to user_path
		end
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update_attributes(params[:user])
				sign_in @user
				format.html { redirect_to user_path ,notice: 'Account was success updated!'}
				format.json {head :no_content}
			else
				format.html {render action: "edit"}
				format.json {render json: @user.errors,status: :unprocessable_entity}	
			end
		end

	end

	def index
		@users = User.paginate(page: params[:page])
	end

	 def destroy
  	  User.find(params[:id]).destroy
   	 flash[:success] = "User destroyed."
   	 redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end
