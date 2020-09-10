class AdministratorsController < ApplicationController
  before_action :authorize_request_admin, only: [:list_all_user, :edit_user, :delete_user, :search_user]
  before_action :set_user, only: [:edit_user, :delete_user]

  def list_all_user
    users = User.all.paginate(page: params[:page], per_page: 3)
    json_response(users)
  end

  def edit_user
    @user.update(user_params)
    head :no_content
  end

  def delete_user
    @user.destroy
    head :no_content
  end

  def search_user
    @users = User.search(params[:key])
    json_response(@users)
  end

  private

  def user_params
    params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
