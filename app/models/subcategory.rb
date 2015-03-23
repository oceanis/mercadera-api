class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :listings

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :category_id, presence: true
end
