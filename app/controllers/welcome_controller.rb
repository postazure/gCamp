class WelcomeController < ApplicationController
  def home
    quotes = [
      ['"Immortality consists largely of boredom."',
        'Zefrem Cochrane, "Metamorphosis", stardate 3219.8'],
      ['"The best diplomat I know is a fully activated phaser bank."',
        ' Scotty'],
      ['"I\'m a soldier, not a diplomat. I can only tell the truth."',
        ' Kirk, "Errand of Mercy", stardate 3198.9'],
    ]

    render(:home, locals:{quotes: quotes})
  end
end
