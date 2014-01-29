class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :answer

      t.timestamps
    end

    add_reference :questions, :section, index: true
  end
end
