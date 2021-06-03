class EventsController < ApplicationController
    before_action :authenticate_user!
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(params)
    if @event.save
        @event.creator = current_user
        redirect_to root_path
    else
        render 'new'
    end
  end

  def show
  end

  private
  def params
    params.require(:event).permit(:title, :description, :date, :event_id, :user_id)
  end
end
