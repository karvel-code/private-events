# frozen_string_literal: true

module EventsHelper
  def attend_event(event)
    (button_to 'Attend', attend_event_path(event.id), method: :post, class: 'btn btn-dark') if user_signed_in?
  end

  def delete_event(event)
    if current_user == event.creator
      (link_to 'Delete', event, confirm: 'Are you sure?', method: :delete)
    end
  end
end
