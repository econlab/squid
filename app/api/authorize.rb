require 'doorkeeper/grape/helpers'

module Authentication
  extend ActiveSupport::Concern

  included do
    helpers Doorkeeper::Grape::Helpers

    before do
      doorkeeper_authorize!
    end
  end
end
