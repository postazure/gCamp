class HomeText < ActiveRecord::Base
  def self.quotes
    [
      ['Failure is not an option. Everyone has to Succeed', 'Arnold Schwarzenegger'],
      ['Your time is limited, so don\'t waste it living someone else\'s life.', 'Steve Jobs'],
      ['Better Ingredients, Better Pizza', 'Papa John\'s'],
    ]
  end
end
