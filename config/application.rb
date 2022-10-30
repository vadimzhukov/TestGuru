require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Testguru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #

    config.time_zone = 'Moscow'
    # config.eager_load_paths << Rails.root.join("extras")
    # Where the I18n library should search for translation files
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]

    # Permitted locales available for the application
    I18n.available_locales = %i[en ru]

    # Set default locale to something other than :en
    I18n.default_locale = :ru

    # Add files in /lib to autoload
    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
