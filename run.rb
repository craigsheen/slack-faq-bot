# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-faq-bot'

begin
  SlackFaqBot::Bot.run
rescue Exception => e
  STDERR.puts "ERROR: #{e}"
  STDERR.puts e.backtrace
  raise e
end
