require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/sugar'

# fix guard safe_yml issues
SafeYAML::OPTIONS[:default_mode] = :safe
SafeYAML::OPTIONS[:deserialize_symbols] = true

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '12.04'
end
