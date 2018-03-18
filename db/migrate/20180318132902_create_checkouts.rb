class CreateCheckouts < ActiveRecord::Migration[5.1]
  def change
    create_table :checkouts do |t|
      t.string :street
      t.string :town
      t.string :county
      t.string :country

      t.timestamps
    end
  end
end
