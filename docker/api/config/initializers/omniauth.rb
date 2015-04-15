Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.test? || Rails.env.development?
end

OmniAuth.config.logger = Rails.logger

OmniAuth.config.test_mode = Rails.env.test?