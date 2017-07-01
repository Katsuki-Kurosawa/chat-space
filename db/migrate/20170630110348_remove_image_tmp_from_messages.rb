class RemoveImageTmpFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :image_tmp, :string
  end
end
