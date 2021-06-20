class ShoutsController < ApplicationController
  def show
    @shout = Shouts.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  private

  def shouts_params
    params.require(:shout).permit(:body)
  end

  def redirect_options_for(shout)
    if shout.persisted?
      flash.notice = 'Success!'
    else
      flash.alert = 'Unable to shout'
    end
  end
end
