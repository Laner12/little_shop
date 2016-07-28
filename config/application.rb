require_relative 'boot'

require 'rails/all'

config.assets.precompile += [
'bootstrap_and_overrides.css',
'flash_styling.css',
'navbar_styling.css'
]

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LittleShop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
