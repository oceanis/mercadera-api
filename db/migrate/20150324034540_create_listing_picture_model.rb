class CreateListingPictureModel < ActiveRecord::Migration
  def change
    create_table :listing_pictures do |t|
      t.string :url
      t.integer :listing_id, index: true
    end
  end
end
