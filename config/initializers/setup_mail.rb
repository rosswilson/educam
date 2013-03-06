require "development_mail_interceptor"

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "rosswilson.co.uk",
  :user_name            => ENV['EDUCAM_EMAIL_USERNAME'],
  :password             => ENV['EDUCAM_EMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

# hjruratjkxellzig