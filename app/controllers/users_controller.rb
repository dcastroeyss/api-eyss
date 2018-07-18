class UsersController < ApplicationController
  
  def create
    user = User.new(params_permit)
    if user.valid?
      if !User.exists?(email: params[:email])
        user.password = Digest::MD5.hexdigest(params[:password].to_s)
        user.token = User.generate_token
        user.save
        render json: {user:user, errors: user.errors.full_messages, status: 201, saved: true}
      else 
        render json: {errors: ["mail already exists"], status: 201, saved: false}
      end 
    else 
      render json: {errors: user.errors.full_messages, status: 201, saved: false}
    end 
  end
  
  def validate_login 
    if User.exists?(email: params[:email])
      user = User.find_by(email: params[:email])
      if user.password == Digest::MD5.hexdigest(params[:password].to_s) 
        render json: {token: user.token, user: true, errors: []}
      else 
        render json: {errors: ["incorrect password"], user: false}
      end 
    else
      render json: {errors: ["email must exist"], user: false} 
    end 
  end 

  private 

  def params_permit 
    params.permit(:email, :password)
  end 
end
