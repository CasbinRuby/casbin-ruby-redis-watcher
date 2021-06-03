# frozen_string_literal: true

require 'casbin-ruby-redis-watcher/redis'

describe CasbinWatcher::Redis do
  let(:redis) { instance_double(Redis) }

  before do
    allow(Redis).to receive(:new).and_return(redis)
    allow(redis).to receive(:publish).and_return(1)
    allow(redis).to receive(:subscribe).and_return(true)
  end

  it '#update' do
    expect(described_class.new(redis).update).to eq 1
  end
end
