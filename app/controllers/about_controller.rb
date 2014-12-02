class AboutController < ApplicationController
  def us
  end

  def terms
  end

  def faq
    faqs = Faq.all
    render locals: {faqs: faqs}
  end
end
