class AuthenticationController < ApiController
    
    skip_before_action :authenticate_token!
    
    def create
        @user = User.find_by(username:params[:user][:username])
        if @user&.authenticate(params[:user][:password]) 
            render json: {token:WebTokens.encode(user:@user.id)}
        else
            render json: {errors:["Invalid username or password"]}
        end
    end
end