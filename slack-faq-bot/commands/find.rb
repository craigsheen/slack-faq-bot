module SlackFaqBot
  def self.find(query:, client:, data:)
    catch(:exit) do
      ActiveRecord::Base.establish_connection
      faqs = ::Faq.search(query).limit(3)
      answers = faqs.map.with_index do |faq, index|
        "#{index + 1}. Added #{faq.created_at}\nQ: #{faq.question}\nA:#{faq.answer}"
      end.join("\n")
      # TODO: URI safe query
      client.say(channel: data.channel, text: "Top results for #{query};\n#{answers}\nSee all results: https://slack-faq-bot.herokuapp.com/faqs?query=#{query}")
    end
  end

  module Commands
    class Find < SlackRubyBot::Commands::Base
      match(/(find) (?<query>.+)/i) do |client, data, match|
        SlackFaqBot.find(query: match[:query], client: client, data: data)
      end
    end
  end
end
