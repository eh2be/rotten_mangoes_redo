class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, :director, :description, :release_date, presence: true
  # validates :poster_image_url, presence: true 
  validates :runtime_in_minutes, numericality: { only_integer: true }

  mount_uploader :image, ImageUploader

  ## This is for searching length of movie, but it's not implemented
  # scope :short, where("runtime_in_minutes < 90")
  # scope :medium, where("runtime_in_minutes >= 90 AND runtime_in_minutes < 120")
  # scope :long, where("runtime_in_minutes >= 120")

  ## I've commented this out because I want to allow movies from the past to be in my db!!
  # validate :release_date_is_in_the_future

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size > 0 
  end
  
  def self.search(search)
    filter_by_title = Movie.where("title LIKE ?", "%#{search}%")
    filter_by_director = Movie.where("director LIKE ?", "%#{search}%")

    if search != ""
      results = filter_by_title
      results += filter_by_director
      results
    else
      results = Movie.all
    end

    ## also kinda works
    # if search != ""
    #   results = Movie.where("title LIKE ? OR director LIKE ?", "%#{search}%", "%#{search}%")
    #   results
    # else
    #   results = Movie.all
    # end
  end


  protected
  
  ## I've commented this out because I want to allow movies from the past to be in my db!!
  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end

end
