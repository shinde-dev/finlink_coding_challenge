# frozen_string_literal: true

sidekiq_config = { url: ENV['REDIS_URL_SIDEKIQ'] || 'redis://localhost:6379' }
REDIS = Redis.new(host: ENV['REDIS_HOST'] || 'localhost')

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config
end
