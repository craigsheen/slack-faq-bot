class AddExtraInfoToFaqs < ActiveRecord::Migration[5.1]
  def change
    add_column :faqs, :tags, :text, index: true
    add_column :faqs, :channel, :string, index: true
  end
end
