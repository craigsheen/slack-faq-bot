module SlackFaqBot
  def self.find(query:, client:, data:)
    catch(:exit) do
      ActiveRecord::Base.establish_connection
      faqs = ::Faq.search(query).limit(3)
      answers = faqs.map.with_index do |faq, index|
        created = faq.created_at.in_time_zone(ENV['TIMEZONE']).strftime('%d/%m/%Y')
        "#{index + 1}. Added #{created} by #{faq.user}\nQ: #{faq.question}\nA:#{faq.answer}"
      end.join("\n")
      client.say(channel: data.channel, text: "Top results for #{query};\n#{answers}\nCan't see what you need? See all results: #{ENV['HOST']}faqs?query=#{URI.encode(query)}")
    end
  end

  module Commands
    class Find < SlackRubyBot::Commands::Base
      match(/^(faqbot)\ (?!.*store)(?<query>.+)/i) do |client, data, match|
        SlackFaqBot.find(query: match[:query], client: client, data: data)
      end
    end
  end
end
