# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = current_user.attended_events.upcoming_events
    @past_events = current_user.attended_events.past_events
    # @created_events = current_user.created_events
  end
end
