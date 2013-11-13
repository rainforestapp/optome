class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.string :file_name
      t.text :text

      t.timestamps
    end
  end
end
