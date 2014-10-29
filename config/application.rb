require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
# ==== OR ====
# require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StarterKit
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'

    # Disable I18n locale deprecation warning caused by newrelic gem
    # http://stackoverflow.com/questions/20361428/rails-i18n-validation-deprecation-warning
    I18n.enforce_available_locales = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Enable faster precompiles
    config.assets.initialize_on_precompile = false

    # Serve vendor fonts
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')

    config.assets.precompile += %w( head, Social-Icons.eot )

    config.to_prepare do
      Devise::Mailer.layout Rails.application.config.settings.mail.layout
    end

    # Gmail Contact page details
    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => ENV["DOMAIN"],
      :user_name            => ENV["GOOGLE_USERNAME"],
      :password             => ENV["GOOGLE_PASSWORD"],
      :authentication       => :plain,
      :enable_starttls_auto => true
    }

    config.action_mailer.default_url_options = {
      :host => ENV["MAIL_HOST"]
    }

    # Enable garbage collection profiler for New Relic
    GC::Profiler.enable

  end
end

require File.expand_path('../settings', __FILE__)
