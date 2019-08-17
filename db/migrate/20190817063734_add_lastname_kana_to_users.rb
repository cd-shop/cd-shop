class AddLastnameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lastname_kana, :string
  end
end
