# Ruby casbin redis watcher

Casbin role watcher to be used for monitoring updates to casbin policies

### Installation
```
gem 'casbin-ruby'
gem 'casbin-ruby-redis-watcher'
```

### Basic Usage
```ruby
require 'casbin-ruby'
require 'casbin-ruby-redis-watcher'

enforcer = Casbin::Enforcer.new("path/to/model.conf", "path/to/policy.csv")
redis = Redis.new
watcher = CasbinWatcher::Redis.new(redis)
watcher.set_update_callback(enforcer.e.load_policy)
enforcer.watcher = watcher

```
