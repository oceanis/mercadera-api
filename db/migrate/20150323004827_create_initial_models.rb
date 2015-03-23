class CreateInitialModels < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id, index: true
      t.timestamps
    end

    create_table :listings do |t|
      t.integer :subcategory_id, index: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :contact_name
      t.string :email
      t.string :telephone
      t.integer :location_id, index: true
      t.timestamps
    end

    create_table :locations do |t|
      t.string :name
      t.timestamps
    end

    create_table :favorited_listings do |t|
      t.integer :listing_id, index: true
      t.integer :user_id, index: true
      t.timestamps
    end

    create_table :reported_listings do |t|
      t.integer :listing_id, index: true
      t.integer :user_id, index: true
      t.timestamps
    end
  end
end
