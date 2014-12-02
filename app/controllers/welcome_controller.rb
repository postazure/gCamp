class WelcomeController < ApplicationController
  def home
    quotes = Quote.all
    render(:home, locals:{quotes: quotes})

  end
end
