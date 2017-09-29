# frozen_string_literal: true

module SlackFaqBot
  module Commands
    class About < SlackRubyBot::Commands::Base
      command 'about'
      match(/^(?<bot>[[:alnum:][:punct:]@<>]*)$/u)

      def self.call(client, data, _match)
        client.say(text: SlackFaqBot::ABOUT, channel: data.channel)
      end
    end
  end
end
