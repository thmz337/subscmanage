class Account::PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minimum_password_length, only: [ :edit, :update ]

  def edit
  end

  def update
    if password_params[:password].blank?
      current_user.errors.add(:password, "を入力してください")
      return render :edit, status: :unprocessable_entity
    end

    if current_user.update_with_password(password_params)
      bypass_sign_in current_user
      redirect_to root_path, notice: t("devise.passwords.edit.message.password_changed")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def set_minimum_password_length
    @minimum_password_length = User.password_length.min
  end
end
