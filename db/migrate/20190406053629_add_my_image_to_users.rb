class AddMyImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :my_image, :text
  end
end
