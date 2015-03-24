class Listing < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :location
  belongs_to :user

  validates :name,
            :description,
            :price,
            :contact_name,
            :email,
            :telephone, presence: true

  validates :price, numericality: { greater_than: 0 }
  validates :subcategory, :location, :user, presence: true
end
