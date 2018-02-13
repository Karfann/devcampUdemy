class AddPositionToPortifolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portifolios, :position, :integer
  end
end
