class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :user, index: true
      t.references :topic, index: true
      t.text :desc

      t.timestamps
    end
  end
end
