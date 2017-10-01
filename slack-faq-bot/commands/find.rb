module SlackFaqBot
  def self.find(query:, client:, data:)
    catch(:exit) do
      ActiveRecord::Base.establish_connection
      faqs = ::Faq.search(query).limit(3)
      answers = faqs.map.with_index do |faq, index|
        created = faq.created_at.in_time_zone(ENV['TIMEZONE']).strftime("%d/%m/%Y %H:%M")
        "#{index + 1}. Added #{created}\nQ: #{faq.question}\nA:#{faq.answer}"
      end.join("\n")
      client.say(channel: data.channel, text: "Top results for #{query};\n#{answers}\nCan't see what you need? See all results: #{ENV['HOST']}faqs?query=#{query}")
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
