require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSystemAPI
  class Application < Rails::Application

    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq


    config.api_only = true
  end
end
