require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Squid
  class Application < Rails::Application
    # Set the timezone
    config.time_zone = 'Pacific Time (US & Canada)'

    # Load Grape API
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    # Disable assets
    config.assets.enabled = false

    # Set ORM and disable asset generation
    config.generators do |g|
      g.assets false
      g.orm :active_record
    end

    # Route exceptions back to Grape API
    config.exceptions_app = self.routes

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Cors
    # config.middleware.insert_before 0, "Rack::Cors" do
    #   allow do
    #     origins ENV['CORS_ORIGINS']
    #     resource '*', :headers => :any, :methods => [:get, :put, :post, :patch, :options]
    #   end
    # end
  end
end
