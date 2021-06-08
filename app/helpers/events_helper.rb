module EventsHelper
  def attend_event(event)
    if user_signed_in? && !event.past
      (button_to 'Attend', attend_event_path(event), method: :post, class: 'btn btn-dark')
    end
  end

  # def delete_event(event)
  #   if current_user == event.creator
  #     (link_to 'Delete', event, confirm: 'Are you sure?', method: :delete)
  #   end
  # end
end
