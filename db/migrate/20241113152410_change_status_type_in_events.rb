class ChangeStatusTypeInEvents < ActiveRecord::Migration[7.2]
  def up
    change_column :events, :status, :string
  end

  def down
    change_column :events, :status, :integer
  end
end
