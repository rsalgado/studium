class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.text :notes
      t.timestamps
    end

    add_reference :sections, :reading, index: true
  end
end
