class CrewController < ApplicationController
  before_filter :authenticate

private
  def authenticate
    redirect_to [:new, :session] unless current_user
  end
end
