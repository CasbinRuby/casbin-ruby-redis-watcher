# Ruby casbin redis watcher

Casbin role watcher to be used for monitoring updates to casbin policies

### Installation
```
gem 'casbin'
gem 'casbin-ruby-redis-watcher'
```

### Basic Usage
```
require 'casbin'
require 'casbin-ruby-redis-watcher'

enforcer = Casbin::Enforcer.new("path/to/model.conf", "path/to/policy.csv")
redis = Redis.new
watcher = CasbinWatcher::Redis.new(redis)
watcher.set_update_callback(enforcer.e.load_policy)
enforcer.watcher = watcher

```
