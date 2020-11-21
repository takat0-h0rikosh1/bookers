# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
  end

  # POST /resource/password
  def create
    @email = params[:email]

    messages = []
    if @email == ""
      messages.push "Email can't be blank"
    elsif User.where(email: @email) == []
      messages.push "Email not found"
    end

    if messages == []
      super
    else
      flash.now[:alert] = messages
      render :new
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
