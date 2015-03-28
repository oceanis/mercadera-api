class ListingSerializer < ActiveModel::Serializer
  attributes :id,
             :subcategory_id,
             :name,
             :description,
             :price,
             :contact_name,
             :email,
             :telephone,
             :location_id,
             :created_at,
             :updated_at,
             :expires_at,
             :user_id

  has_many :listing_pictures
end
