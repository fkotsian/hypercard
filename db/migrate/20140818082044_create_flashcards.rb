class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.string :title, null: false
      t.string :question, null: false
      t.string :answer, null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
