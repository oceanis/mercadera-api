class AddExpiresAtToListings < ActiveRecord::Migration
  def change
    add_column :listings, :expires_at, :datetime
  end
end
