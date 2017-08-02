class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :intro
      t.string :address
      t.decimal :lat, {:precision=>10, :scale=>6}
      t.decimal :lng, {:precision=>10, :scale=>6}
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
