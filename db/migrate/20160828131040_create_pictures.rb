class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :caption
      t.integer :likes

      t.timestamps
    end
  end
end
