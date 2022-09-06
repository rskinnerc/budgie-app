class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
