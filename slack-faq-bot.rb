# frozen_string_literal: true

require 'slack-ruby-bot'

require 'active_record'
require 'pg_search'
require 'uri'
require_relative 'app/models/application_record'
require_relative 'app/models/faq'
require_relative 'slack-faq-bot/version'
require_relative 'slack-faq-bot/about'
require_relative 'slack-faq-bot/commands'
require_relative 'slack-faq-bot/bot'
