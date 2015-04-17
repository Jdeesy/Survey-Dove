class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to  :survey
      t.string      :prompt

      t.timestamps  null: false
    end
  end
end
