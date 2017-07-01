class AddImageTmpTomessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :image_tmp, :string
  end
end
