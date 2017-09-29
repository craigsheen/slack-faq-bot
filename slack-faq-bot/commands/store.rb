module SlackFaqBot
  def self.store(question:, answer:, client:, data:)
    catch(:exit) do
      ActiveRecord::Base.establish_connection
      faq = ::Faq.new(question: question, answer: answer)
      if faq.save
        client.say(channel: data.channel, text: "Stored; \nQ: #{question}\nA: #{answer}")
      else
        client.say(channel: data.channel, text: "Sorry couldn't save because; #{errors}")
      end
    end
  end

  module Commands
    class Find < SlackRubyBot::Commands::Base
      match(/(store) q\:(?<question>.+)a\:(?<answer>.+)/i) do |client, data, match|
        SlackFaqBot.store(
          question: match[:question], answer: match[:answer],
          client: client, data: data
        )
      end
    end
  end
end
