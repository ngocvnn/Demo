module SessionsHelper
	

	def log_in(user)
		session[:user_id] = user.id
	end



	def current_user
		if(user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(:remember, cookies[:remember_token])
				log_in user
				@current_user = user
			end
		end
	end
    
    # def status_id?(status_id)
    # 	status_id == 
    # end


	def current_user?(user)
		user == current_user
	end


	def logged_in?
		!current_user.nil?
	end

	def logged_in_user
	    unless logged_in?
	      flash[:danger] ="Please log in"
	      redirect_to login_url
	    end
  	end

	def correct_user
	   @user = User.find(params[:id])
	   redirect_to root_url unless current_user?(@user)
	end


	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

end