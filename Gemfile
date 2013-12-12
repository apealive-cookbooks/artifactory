source 'https://rubygems.org'

gem 'berkshelf'
gem 'chef-rewind'
gem 'chef-sugar'

group :test do
  gem 'chef', '~> 11.6.2'
  gem 'rspec'
  gem 'chefspec', :git => 'git@github.com:sethvargo/chefspec.git', :tag => "v3.0.2"
  gem 'guard'
  gem 'guard-rspec'
end

group :integration do
  gem 'test-kitchen', '~> 1.0.0.beta'
  gem 'kitchen-vagrant'
  gem 'serverspec'
end

