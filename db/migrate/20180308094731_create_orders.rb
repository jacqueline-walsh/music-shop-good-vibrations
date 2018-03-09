class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total
      t.decimal :tax
      t.decimal :shipping

      t.timestamps
    end
  end
end
