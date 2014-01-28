class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :title
      t.timestamps
    end

    add_reference :readings, :user, index: true
  end
end
