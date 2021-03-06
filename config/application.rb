require_relative 'boot'

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_model/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PostcodeChecker
	class Application < Rails::Application
		# Initialize configuration defaults for originally generated Rails version.
		config.load_defaults 6.0

		# Custom directories with classes and modules you want to be autoloadable.
		config.autoload_paths += %W(#{config.root}/lib)

		# Settings in config/environments/* take precedence over those specified here.
		# Application configuration can go into files in config/initializers
		# -- all .rb files in that direct ory are automatically loaded after loading
		# the framework and any gems in your application.
	end
end
