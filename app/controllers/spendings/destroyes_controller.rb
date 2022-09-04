class Spendings::DestroyesController < ApplicationController
  def destroy
    @spendings = Spending.all.accessible_for(current_user)
    @spendings.destroy_all
    redirect_to spendings_path
  end
end