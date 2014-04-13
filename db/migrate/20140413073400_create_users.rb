class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :store_id
      t.string :email
      t.integer :phone
      t.text :address
      t.string :role
      t.timestamps
    end
  end
end
