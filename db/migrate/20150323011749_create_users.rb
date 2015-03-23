class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :api_token
      t.string :name
      t.string :role
      t.timestamps
    end
  end
end
