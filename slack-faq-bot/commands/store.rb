module SlackFaqBot
  def self.store(question:, answer:, client:, data:)
    catch(:exit) do
      ActiveRecord::Base.establish_connection
      user = client.users[data.user].name
      faq = ::Faq.new(question: question, answer: answer, channel: data.channel, user: user)
      if faq.save
        client.say(channel: data.channel, text: "Too easy! I've stored; \nQ: #{question}\nA: #{faq.formatted_answer}")
      else
        client.say(channel: data.channel, text: "Sorry couldn't save because; #{errors}")
      end
    end
  end

  module Commands
    class Find < SlackRubyBot::Commands::Base
      match(/(faqbot store) q\:(?<question>.+)a\:(?<answer>.+)/i) do |client, data, match|
        SlackFaqBot.store(
          question: match[:question], answer: match[:answer],
          client: client, data: data
        )
      end
    end
  end
end
