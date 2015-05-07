Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.test? || Rails.env.development?
  provider :tumblr, ENV['TUMBLR_CONSUMER_KEY'], ENV['TUMBLR_SECRET_KEY']
  provider :instagram, ENV['INSTAGRAM_CLIENT_ID'], ENV['INSTAGRAM_CLIENT_SECRET']
  provider :linkedin, ENV['LINKEDIN_CLIENT_ID'], ENV['LINKEDIN_SECRET_KEY']
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_SECRET_KEY']
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end

OmniAuth.config.logger = Rails.logger

OmniAuth.config.test_mode = Rails.env.test?