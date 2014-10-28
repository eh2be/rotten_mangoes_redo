class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, :director, :description, :poster_image_url, :release_date, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }

  ## I've commented this out because I want to allow movies from the past to be in my db!!
  # validate :release_date_is_in_the_future

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size > 0 
  end
  
  # protected
  
  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end

end
