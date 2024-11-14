class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :address
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
