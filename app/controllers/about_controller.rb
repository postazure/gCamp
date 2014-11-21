class AboutController < ApplicationController
  def us
  end

  def terms
  end

  def faq
    render locals: {faq: AboutText.faqs}
  end
end
