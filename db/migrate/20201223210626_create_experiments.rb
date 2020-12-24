class CreateExperiments < ActiveRecord::Migration[6.0]
  def change
    create_table :experiments do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :wrapper
      t.string :code_reference
      t.boolean :published, default: false
      t.string :component

      t.timestamps
    end
  end
end
