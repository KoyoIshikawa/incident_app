require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "csv"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IncidentApp
  class Application < Rails::Application
    config.load_defaults 6.1
    # 日本語対応
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'

    config.autoload_once_paths += %W(#{config.root}/lib/autoloads)
    
    config.generators.system_tests = nil
  end
end
