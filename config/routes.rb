Rails.application.routes.draw do
  # Keep the door
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  # API
  # mount API::Base => '/'
end
