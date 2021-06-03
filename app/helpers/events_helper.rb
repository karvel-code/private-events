module EventsHelper
    def attend_event(event)
        (button_to 'Attend', attend_event_path(event.id), method: :post, class: 'btn btn-dark') if user_signed_in?
    end
end
