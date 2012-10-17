class Movie < ActiveRecord::Base

  def self.all_ratings
    Movie.select(:rating).map(&:rating).uniq
  end
end
