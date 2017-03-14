class AddImageToServices < ActiveRecord::Migration[5.0]
  def change
    add_attachment :services, :image
  end
end
