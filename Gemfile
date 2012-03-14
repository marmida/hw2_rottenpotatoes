source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'

  # hacked to fix ruby-debug version errors; see: 
  # http://stackoverflow.com/questions/8251349/ruby-threadptr-data-type-error
  gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'