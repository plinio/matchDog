OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 1458025767830877, "48c86cd6e477b5ee7ae67f447dc1782a"
end