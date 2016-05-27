class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :date_beginning
      t.string :date_end
      t.text :description

      t.timestamps null: false
    end
  end
end
