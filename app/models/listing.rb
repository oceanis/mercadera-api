class Listing < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :location
  belongs_to :user
end
