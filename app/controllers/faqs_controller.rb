class FaqsController < ApplicationController
  def index
    @faqs = Faq.search(params[:query])
  end
end
