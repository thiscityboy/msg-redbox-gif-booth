# msg gemfile
source 'https://repo.fury.io/svdEKiyaqdZ1xhagHajp/me/'
source 'https://rubygems.org'
ruby '2.2.2'

gem "rails", "4.2.1"
gem 'puma'
gem 'unicorn'


# Front end
gem "sass-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "jquery-rails"
gem "font-awesome-rails"

# Admin
gem "devise"
gem "rails_admin"

# Backend
gem "paperclip"
gem 'aws-sdk', '< 2.0'
gem "msg_toolbox"
gem "rollbar"
gem "rmagick"

# Queueing
gem "sidekiq"
gem 'sinatra', '>= 1.3.0', :require => nil # For Sidekiq web

#FUN!
gem 'giphy'
gem 'httparty'

group :development, :test do
  gem "better_errors"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "sqlite3"
  gem "foreman"
  gem "spring"
end

group :production do
  gem "rails_12factor"
  gem "pg"
end
