# frozen_string_literal: true

SlackRubyBot.configure do |config|
  config.send_gifs = false
end

module SlackFaqBot
  def self.say_error(client, data, text)
    client.say(channel: data.channel, text: ":warning: #{text}")
    throw(:exit)
  end

  class Bot < SlackRubyBot::Bot
    help do
      title 'FAQ Bot'

      desc 'This bot can store or find common questions'

      command 'store' do
        desc 'Command format is: `store q:<my question> a:<the answer>` '\
             'Please note the `q:` and `a:` are required'
      end

      command 'find' do
        desc 'Find an answer *find <search term>*'
      end
    end
  end
end
