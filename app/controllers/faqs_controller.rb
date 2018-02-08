class FaqsController < ApplicationController
  def index
    if params[:query]
      @faqs = Faq.search(params[:query])
    else
      @faqs = Faq.all
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update(faq_params)
      flash[:success] = 'Successfully edited'
    else
      flash[:error] = 'Could not edit'
    end
    redirect_to faqs_path
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    flash[:success] = 'Successfully deleted'
    redirect_to faqs_path
  end

  private

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end
end
