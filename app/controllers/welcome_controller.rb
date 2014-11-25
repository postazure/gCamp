class WelcomeController < ApplicationController
  def home

    render(:home, locals:{quotes: HomeText.quotes})

  end
end
