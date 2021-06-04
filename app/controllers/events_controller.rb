class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all
    @upcoming = Event.upcoming_events
    @past = Event.past_events
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      @event.creator = current_user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def attend
    @event = Event.find_by(id: params[:id])
    redirect_to root_path if current_user.id == @event.creator.id

    redirect_to root_path if Invitation.create!(event_id: @event.id, user_id: current_user.id)
  end

  # def destroy
  #     @event = Event.find(params[:id])
  #     @event.destroy
  #     redirect_to root_path
  # end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :event_id, :user_id)
  end
end
