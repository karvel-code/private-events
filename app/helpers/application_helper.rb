module ApplicationHelper
  def user_options
    if user_signed_in?
      (content_tag :li, class: 'nav-item mx-3' do
        button_to 'Sign out', destroy_user_session_path, redirect_to: root_path, method: :delete,
                                                         class: 'text-decoration-none link-dark'
      end) +
        (content_tag :li, class: 'nav-item mx-3' do
          link_to 'Edit profile', edit_user_registration_path, class: 'text-decoration-none link-dark'
        end) +
        (content_tag :li, class: 'nav-item mx-3' do
          link_to 'New Event', new_event_path, class: 'text-decoration-none link-dark'
        end) +
        (content_tag :li, class: 'nav-item mx-3' do
          link_to 'My Events', user_path(:id), class: 'text-decoration-none link-dark'
        end)

    else
      (content_tag :li, class: 'nav-item mx-3' do
         link_to 'Sign in', new_user_session_path, class: 'text-decoration-none link-dark'
       end) +
        (content_tag :li, class: 'nav-item mx-3' do
          link_to 'Sign up', new_user_registration_path, class: 'text-decoration-none link-dark'
        end)
    end
  end
end
