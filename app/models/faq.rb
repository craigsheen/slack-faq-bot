class Faq < ApplicationRecord
  include PgSearch
  pg_search_scope :search, against: %i[question answer], using: { tsearch: { prefix: true } }

  validates :answer, presence: true
  validates :question, presence: true
end
