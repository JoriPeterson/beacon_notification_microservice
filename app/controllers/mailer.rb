configure do
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.smtp_settings = {
    :address => ENV['ADDRESS'],
    :port => 1025,
    :authentication => :plain,
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => ENV['SENDGRID_DOMAIN'],
    :enable_starttls_auto => true
    }
  ActionMailer::Base.view_paths = File.expand_path('app/views/')
end

class Mailer < ActionMailer::Base
  default from: "no_reply@beacon_app.com"
  layout 'notify'

	def notify(params)
		@params = params
		mail(to: params[:email], subject: "Emergency Contact Notification: Action Needed")
	end
end
