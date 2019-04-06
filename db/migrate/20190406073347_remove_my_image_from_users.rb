class RemoveMyImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :my_image, :text
  end
end
