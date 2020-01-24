class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  before_save(:titleize_product)


  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  scope :country_of_origin, -> (country_of_origin_parameter) { where(country_of_origin: "USA") }

  private
  def titleize_product
    self.name = self.name.titleize
  end
end
