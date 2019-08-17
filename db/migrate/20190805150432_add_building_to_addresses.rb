class AddBuildingToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :building, :string, :null => true
  end
end
