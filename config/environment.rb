# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 465,
    domain:               'gmail.com',
    :ssl => true,
    :tsl => true,
    user_name:            'libery.testapp@gmail.com',
    password:             'kaqovnsauslwshuf',
    authentication:       'plain',
    enable_starttls_auto: true 
  }