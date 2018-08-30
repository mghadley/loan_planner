class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
    	t.string :name, null: false
      t.float :amount, null: false
      t.float :minimum, null: false
      t.float :additional, null: false
      t.float :interest_rate, null: false
      t.string :interest_month, null: false

      t.timestamps
    end
  end
end
