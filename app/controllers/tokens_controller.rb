class TokensController  < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    email = params[:email]
    password = params[:password]

    if email.nil? or password.nil?
      render :status => 400, :json => { :message => "The request must contain the user email and password." }
      return
    end

    @user = User.find_by_email(email.downcase)

    if @user.nil?
      logger.info("User #{email} failed signin, user cannot be found.")
      render :status => 403, :json => { :message => "Invalid email or password." }
      return
    end

    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status => 403, :json => { :message => "Invalid email or password." }
    else
      @user.ensure_authentication_token!
      render :status => 200, :json => { :token => @user.authentication_token }
    end
  end

  def destroy
    @user = User.find_by_authentication_token(params[:id])

    if @user.nil?
      logger.info("Invalid token. Token not found.")
      render :status => 403, :json => { :message => "Invalid token. Token not found." }
    else
      @user.reset_authentication_token!
      render :status => 200, :json => { :token => params[:id] }
    end
  end
end