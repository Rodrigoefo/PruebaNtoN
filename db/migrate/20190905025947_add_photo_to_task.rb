class AddPhotoToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :photo, :string
  end
end
