# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require_relative 'version'
require_relative 'about'
require_relative 'commands'
require_relative 'bot'

Thread.abort_on_exception = true

Thread.new do
  SlackRubyBot::App.instance.run
end
