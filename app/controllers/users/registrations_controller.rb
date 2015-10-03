class Users::RegistrationsController < Devise::RegistrationsController

  include ApplicationHelper

  def update
    if update_resource(current_user,account_update_params)
      flash[:notice] = 'Profile updated.'
    else
      flash[:error] = errors_as_sentence current_user
    end
    render partial: 'partials/flash'
  end

end