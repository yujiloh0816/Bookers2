class AddMyImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :my_image_id, :string
  end
end
