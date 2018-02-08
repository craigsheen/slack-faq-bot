class PagesController < ApplicationController
  def index
    if params[:query]
      @faqs = Faq.search(params[:query])
    else
      @faqs = Faq.all
    end
  end
end
