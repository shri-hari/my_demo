module UserSessionsHelper
	def signed_in?
		!current_user.nil?
	end

	def authenticate
		deny_access unless signed_in?
	end

	def deny_access
		flash[:notice] = "Please sign in to access this page." 
		redirect_to login_path
	end
end
