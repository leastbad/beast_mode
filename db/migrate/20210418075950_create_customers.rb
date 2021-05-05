class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :company
      t.integer :age
      t.string :status
      t.timestamps
    end
  end
end
