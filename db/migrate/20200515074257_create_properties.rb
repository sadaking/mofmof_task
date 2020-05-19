class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :property_name, null: false
      t.integer :rent, null: false
      t.text :street_address, null: false
      t.integer :age, null: false
      t.text :remark
    end
  end
end
