class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.date :date_beginning
      t.date :date_end
      t.text :description

      t.timestamps null: false
    end
  end
end
