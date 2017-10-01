# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require_relative 'slack-faq-bot/run'

run Rails.application

Thread.abort_on_exception = true

Thread.new do
  SlackFaqBot::Bot.run
end
