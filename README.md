# Slack FAQ Bot

![Alt text](app/assets/images/faq-bot-v1.gif?raw=true)

## Usage

- `help`: Shows help information
- `store q: <question> a: <answer>`: Stores a new question/answer
- `find <query>`: Queries stored FAQs questions and answers and shows top 3 matches. Also shows link to see all found by query.

## Deployment

- Create a new Bot Integration under [services/new/bot](http://slack.com/services/new/bot).
- Set ENV Var `SLACK_API_TOKEN` from the Bot integration settings on Slack
- Set ENV Var `HOST` which is where the FAQ Bot will be hosted. (see below)
- Deploy and enjoy!

## TODO

- Instead of having to set host, find a way to connect to Rails.
- Find a way to not require the `ActiveRecord::Base.establish_connection`
- Tests
- Allow editing/deleting on web
