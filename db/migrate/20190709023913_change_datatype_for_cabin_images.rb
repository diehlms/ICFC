class ChangeDatatypeForCabinImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :cabins, :image 
    add_column :cabins, :images, :json
  end
end
