# frozen_string_literal: true

require 'redis'

module CasbinRedisWatcher
  class RedisWatcher
    REDIS_CHANNEL_NAME = 'casbin-role-watcher'

    attr_accessor :update_callback
    attr_reader :redis

    def initialize(redis_instance)
      @redis = redis_instance
      redis_casbin_subscription
    end

    def update
      redis.publish(REDIS_CHANNEL_NAME, "casbin policy updated at #{Time.now}")
    end

    private

    def redis_casbin_subscription(delay = 0)
      # in case we want to delay connecting to redis (redis connection failure)
      sleep(delay)

      puts 'Waiting for casbin policy updates...'
      check_messages(delay)
    end

    def check_messages(delay)
      pid = fork do
        redis.subscribe(REDIS_CHANNEL_NAME) do |on|
          on.message { |_channel, _message| update_callback.call }
        end
      rescue Redis::CannotConnectError
        puts 'try reconnect'
        redis_casbin_subscription(delay + 10)
      end

      Process.detach(pid)
    end
  end
end
