# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: ENV['email_username'],
  password: ENV['email_password'],
  domain: 'localhost.localdomain',
  address: 'smtp.gmail.com',
  port: 587,
  authentication: :plain,
  enable_starttle_auto: true
}
