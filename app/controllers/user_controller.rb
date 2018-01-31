class UserController < ApplicationController

  before_filter :authenticate_user!, :except => [:members_token]

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      sign_in @user, :bypass => true
      flash[:notice] = I18n.t("general.password_updated_successfully")
      redirect_to edit_password_path
    else
      render "edit"
    end
  end

  def edit_profile
    @user = current_user
  end
  
  def update_profile
    @user = User.find(current_user.id)
    if @user.update(edit_user_params)
      flash[:notice] = I18n.t("general.profile_updated_successfully")
      redirect_to edit_profile_path
    else
      render "edit_profile"
    end
  end

  def members_token
    user = User.find_by_token(params[:token])
    if user
      sign_in user, :bypass => true
      flash[:notice] = I18n.t("general.sign_in_successfully")
      redirect_to dashboard_index_path
    else
      flash[:notice] = I18n.t("general.token_is_not_valid")
      redirect_to root_path
    end
  end  

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end

  def edit_user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
