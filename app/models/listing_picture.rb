class ListingPicture < ActiveRecord::Base
  belongs_to :listing

  validates :url, presence: true
  validates :listing, presence: true
  validates :url, uniqueness: { scope: :listing_id,
                                 message: "picture already exists for this listing" }
end
